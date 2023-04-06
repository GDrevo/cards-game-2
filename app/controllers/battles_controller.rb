class BattlesController < ApplicationController
  def create
    player_cards = []
    card_ids_params.each do |id|
      player_cards << Card.find(id)
    end
    challenge = Challenge.find(challenge_id_params)
    player = challenge.player
    bt_computer = create_bt(challenge.computer.cards)
    bt_computer.battle_cards.each do |battle_card|
      battle_card.card.skills.each do |skill|
        skill.counter = skill.reload_time
        skill.save
      end
    end
    bt_player = create_bt(player_cards)
    bt_player.battle_cards.each do |battle_card|
      battle_card.card.skills.each do |skill|
        skill.counter = skill.reload_time
        skill.save
      end
    end
    battle = Battle.create(player:, challenge:, bt_computer:, bt_player:)
    redirect_to battle_path(battle)
  end

  def show
    @battle = Battle.find(params[:id].to_i)
    current_turn = @battle.turn_number
    current_turn == 1 ? cookies[:last_turn] = 1 : nil

    bcs_player = @battle.bt_player.battle_cards.select { |card| card.dead == false }
    bcs_opponent = @battle.bt_computer.battle_cards.select { |card| card.dead == false }
    @bcs_player = bcs_player.sort_by { |obj| obj.card.name }
    @bcs_opponent = bcs_opponent.sort_by { |obj| obj.card.name }
    if bcs_opponent.any? { |bc| bc.effects.any? { |effect| effect.effect_type == "taunt" } }
      @taunt_present = true
      @targetable_bcs_opponent = @bcs_opponent.select do |bc|
        bc.effects.any? { |effect| effect.effect_type == "taunt" }
      end
    else
      @targetable_bcs_opponent = @bcs_opponent
      @taunt_present = false
    end
    card_to_play = play_turn(@bcs_player, @bcs_opponent)
    if current_turn > cookies[:last_turn].to_i
      card_to_play.card.skills.each do |skill|
        skill.counter += 1
        skill.save
        cookies[:last_turn] = current_turn
      end
    end
    @card_to_play = card_to_play
    session[:card_to_play_id] = @card_to_play.id
    if !@bcs_player.all?(&:dead) && !@bcs_opponent.all?(&:dead)
      skills = @card_to_play.card.skills.select { |skill| skill.counter >= skill.reload_time }
      @skills = skills.sort_by(&:id)
    end

    if @bcs_player.all?(&:dead)
      set_winner("computer", @battle)
    elsif @bcs_opponent.all?(&:dead)
      set_winner(@battle.player, @battle)
    else
      render :show
    end
  end

  def play_card
    battle = Battle.find(params[:id])
    bcs_player = battle.bt_player.battle_cards
    alive_bcs_player = bcs_player.select { |card| card.dead == false }
    bcs_computer = battle.bt_computer.battle_cards
    alive_bcs_computer = bcs_computer.select { |card| card.dead == false }
    all_bcs = bcs_player + bcs_computer
    all_bcs.each do |bc|
      bc.damage_taken = 0
      bc.save
    end
    skill = Skill.find(params[:skill])
    attacker = skill.card
    bc_attacker = (bcs_player.select { |bc| bc.card == attacker }).first
    if target_params[:target].to_i.zero?
      bc_target = "multi target"
    else
      bc_target = BattleCard.find(target_params[:target].to_i)
    end
    calculate_damage(bc_attacker, bc_target, skill, alive_bcs_player, alive_bcs_computer)
    manage_effects(bc_attacker) unless bc_attacker.effects.empty?

    set_effect(skill, bcs_player, bcs_computer, bc_attacker, bc_target) if skill.effect

    manage_skill_countdown(skill)
    card_to_play = BattleCard.find(session[:card_to_play_id])
    card_to_play.counter = 0
    card_to_play.save
    session.delete(:card_to_play_id)
    battle.turn_number += 1
    battle.save

    redirect_to battle_path(battle)
  end

  def simulate_turn
    battle = Battle.find(params[:id])
    bcs_player = battle.bt_player.battle_cards
    alive_bcs_player = bcs_player.select { |card| card.dead == false }
    bcs_computer = battle.bt_computer.battle_cards
    alive_bcs_computer = bcs_computer.select { |card| card.dead == false }
    all_bcs = bcs_player + bcs_computer
    all_bcs.each do |bc|
      bc.damage_taken = 0
      bc.save
    end
    # 1. Get the skills the card_to_play can use, compute a simple logic to decide which to use

    card_to_play = BattleCard.find(session[:card_to_play_id])
    skill = decision_skill(card_to_play, bcs_player, bcs_computer)
    # 2. Do the same for the opponent's card to target
    if skill.target_type.include?("Multi")
      bc_target = bcs_player if skill.name.include?("Attack")
      bc_target = bcs_computer if skill.name.include?("Heal")
    elsif bcs_player.any? { |bc| bc.effects.any? { |effect| effect.effect_type == "taunt" } }
      taunt_bcs = bcs_player.select do |bc|
        bc.effects.any? { |effect| effect.effect_type == "taunt" }
      end
      bc_target = decision_target(taunt_bcs, alive_bcs_computer, skill)
    else
      bc_target = decision_target(alive_bcs_player, alive_bcs_computer, skill)
    end
    # 3. Calculate damage, lower hit_points and reset counter
    calculate_damage(card_to_play, bc_target, skill, alive_bcs_computer, alive_bcs_player)
    manage_effects(card_to_play) unless card_to_play.effects.empty?

    set_effect(skill, bcs_computer, bcs_player, card_to_play, bc_target) if skill.effect && skill.effect_type != "dispell"

    manage_skill_countdown(skill)
    card_to_play.counter = 0
    card_to_play.save
    session.delete(:card_to_play_id)
    battle.turn_number += 1
    battle.save

    redirect_to battle_path(battle)
  end

  def rewards
    @xp_gained = params[:experience_gained]
    @shard_card_id = params[:shard_card].to_i
    @shard_card = Card.find(@shard_card_id)
    challenge_id = params[:challenge].to_i
    @challenge = Challenge.find(challenge_id)
    @gear = Gear.find(params[:gear_id])
  end

  private

  def set_effect(skill, bcs_attacker, bcs_defender, bc_attacker, bc_target)
    if skill.effect_type == "dispell"
      case skill.effect_target_type
      when "same"
        bc_target.effects.where(curse: false).destroy_all unless bc_target.effects.where(curse: false).empty?
      when "ennemies"
        bcs_defender.each do |target|
          target.effects.where(curse: false).destroy_all unless target.effects.where(curse: false).empty?
        end
      end
    else
      # raise
      case skill.effect_target_type
      when "allies"
        targets = bcs_attacker
      when "ennemies"
        targets = bcs_defender
        curse = true
      when "self"
        targets = [bc_attacker]
      when "same"
        targets = [bc_target]
        curse = true
      end
      duration = skill.effect_duration
      intensity = skill.intensity
      effect_type = skill.effect_type
      curse ||= false

      targets.each do |battle_card|
        Effect.create(
          effect_type:,
          duration:,
          intensity:,
          battle_card:,
          curse:
        )
      end
    end
  end

  def manage_effects(bc_attacker)
    effects = bc_attacker.effects
    effects.each do |effect|
      effect.counter += 1
      effect.save
      # #check_if_done in Effect model
    end
  end

  def set_winner(player, battle)
    if player == battle.player
      # Give shards before changing challenge status in order to check if first time challenge accomplished and give a bonus shard
      challenge = battle.challenge
      @shard_card = give_shards(player, challenge)
      challenge.reward.nil? ? nil : player.coins += challenge.reward
      player.save
      # Set challenge as done, unlock the next one
      challenge.done = true unless challenge.category.include?("epic") || challenge.category.include?("elite")
      challenge.save
      next_challenge = challenge.next(challenge.category)
      next_challenge.unlocked = true if next_challenge
      next_challenge.save if next_challenge
      manage_strong_challenge(challenge) if challenge.category.include?("epic") || challenge.category.include?("elite")
      # Give the shards to player_cards and add the coins to player.coins
      player_bcs = battle.bt_player.battle_cards.select { |bc| bc.dead == false }
      computer_bcs = battle.bt_computer.battle_cards
      # Give gear to winner
      gear_id = gear_attribution(player)

      # Calculate XP gained and divide it between the cards that aren't dead
      @experience = calculate_experience(player_bcs, computer_bcs)
      redirect_to rewards_battle_path(battle_id: battle.id, experience_gained: @experience, shard_card: @shard_card.id, challenge:, gear_id:)
    else
      player_bcs = battle.bt_player.battle_cards
      computer_bcs = battle.bt_computer.battle_cards.select { |bc| bc.dead == true }
      calculate_experience(player_bcs, computer_bcs)
      redirect_to challenges_path(side: battle.challenge.category)
    end
  end

  def gear_attribution(player)
    random_number = rand(1..50)
    if random_number == 50
      gear = create_gear(player, "weapon 2")
    elsif random_number == 49
      gear = create_gear(player, "armor 2")
    elsif random_number == 48
      gear = create_gear(player, "artifact 2")
    elsif random_number >= 46
      gear = create_gear(player, "weapon 1")
    elsif random_number >= 44
      gear = create_gear(player, "armor 1")
    elsif random_number >= 42
      gear = create_gear(player, "artifact 1")
    elsif random_number >= 28
      gear = create_gear(player, "weapon 0")
    elsif random_number >= 14
      gear = create_gear(player, "armor 0")
    else
      gear = create_gear(player, "artifact 0")
    end
    gear.id
  end

  def create_gear(player, gear_type)
    case gear_type
    when "weapon 2"
      bonus_armor = 0
      bonus_power = rand(100..250)
      bonus_speed = 0
      coins_value = 50
    when "weapon 1"
      bonus_armor = 0
      bonus_power = rand(20..50)
      bonus_speed = 0
      coins_value = 15
    when "weapon 0"
      bonus_armor = 0
      bonus_power = rand(10..25)
      bonus_speed = 0
      coins_value = 5
    when "armor 2"
      bonus_armor = rand(5..10)
      bonus_power = 0
      bonus_speed = 0
      coins_value = 50
    when "armor 1"
      bonus_armor = rand(3..5)
      bonus_power = 0
      bonus_speed = 0
      coins_value = 15
    when "armor 0"
      bonus_armor = rand(1..2)
      bonus_power = 0
      bonus_speed = 0
      coins_value = 5
    when "artifact 2"
      bonus_armor = 0
      bonus_power = 0
      bonus_speed = rand(3..10)
      coins_value = 50
    when "artifact 1"
      bonus_armor = 0
      bonus_power = 0
      bonus_speed = rand(1..5)
      coins_value = 15
    when "artifact 0"
      bonus_armor = 0
      bonus_power = 0
      bonus_speed = rand(1..3)
      coins_value = 5
    end
    Gear.create(player:, level: gear_type[-1], gear_type:, bonus_armor:, bonus_power:, bonus_speed:, coins_value:)
  end

  def manage_strong_challenge(challenge)
    return if challenge.done

    card_name = challenge.epic_card
    card = challenge.player.cards.select { |c| c.name == card_name }
    card.first.prestige_up unless card.first.prestige == 5
    card.first.shards = 0
    card.first.save
    challenge.done = true
    challenge.save
  end

  def give_shards(player, challenge)
    case challenge.shards
    when "normal weak"
      if challenge.category == "light"
        cards = player.cards.where(side: "light")
        shard_card = cards.where(cat: "normal weak").sample
        return if shard_card.prestige == 5

        challenge.done ? shard_card.shards += 1 : shard_card.shards += 2
      else
        cards = player.cards.where(side: "dark")
        shard_card = cards.where(cat: "normal weak").sample
        return if shard_card.prestige == 5

        challenge.done ? shard_card.shards += 1 : shard_card.shards += 2
      end
      shard_card.save
    when "normal normal"
      if challenge.category == "light"
        cards = player.cards.where(side: "light")
        shard_card = cards.where(cat: "normal normal").sample
        return if shard_card.prestige == 5

        challenge.done ? shard_card.shards += 1 : shard_card.shards += 2
      else
        cards = player.cards.where(side: "dark")
        shard_card = cards.where(cat: "normal normal").sample
        return if shard_card.prestige == 5

        challenge.done ? shard_card.shards += 1 : shard_card.shards += 2
      end
    when "daily weak"
      cards = player.cards.where(cat: "daily weak")
      shard_card = cards.sample
      challenge.done ? shard_card.shards += 1 : shard_card.shards += 2
    when "daily normal"
      cards = player.cards.where(cat: "daily normal")
      shard_card = cards.sample
      challenge.done ? shard_card.shards += 1 : shard_card.shards += 2
    else
      shard_name = challenge.epic_card
      shard_card = player.cards.where(name: shard_name).first
    end
    shard_card.prestige_up if shard_card.shards >= shard_card.next_prestige
    shard_card.save
    shard_card
  end

  def calculate_experience(player_bcs, computer_bcs)
    total_xp_gained = 0
    player_bcs_num = player_bcs.size
    computer_bcs.each do |battle_card|
      total_xp_gained += battle_card.card.experience_given
    end
    player_bcs.each do |battle_card|
      xp_needed = battle_card.card.next_level - battle_card.card.experience
      if xp_needed <= (total_xp_gained / player_bcs_num)
        battle_card.card.level_up(total_xp_gained / player_bcs_num)
      else
        battle_card.card.experience += (total_xp_gained / player_bcs_num)
        battle_card.card.save
      end
    end
    total_xp_gained
  end

  def calculate_damage(attacker, target, skill, bcs_attacker, bcs_defender)
    return if skill.strength.nil?

    damage = attacker.power
    if skill.strength.include?("Light")
      damage = (damage * 0.75).round
    elsif skill.strength.include?("Powerful")
      damage = (damage * 2).round
    end
    if skill.target_type.include?("Multi")
      if skill.name.include?("Attack")
        targets = bcs_defender
        targets.each do |target_multi|
          target_multi.damage_taken = 0
          target_multi.armor > 95 ? target_multi.armor = 95 : nil
          damage_multi = (damage * (100 - target_multi.armor) / 100).round
          target_multi.damage_taken = 0 - damage_multi

          target_multi.hit_points -= damage_multi
          target_multi.dead = true if target_multi.hit_points <= 0
          target_multi.save
        end
      elsif skill.name.include?("Heal")
        targets = bcs_attacker
        targets.each do |target_multi|
          target_multi.damage_taken = 0
          target_multi.hit_points += (damage / 1.25).round
          target_multi.damage_taken = (damage / 1.25).round

          target_multi.hit_points > target_multi.max_hp ? target_multi.hit_points = target_multi.max_hp : nil

          target_multi.save
        end
      end
    elsif skill.target_type.include?("Single")
      if skill.name.include?("Attack")
        target.damage_taken = 0
        target.armor > 95 ? target.armor = 95 : nil
        damage_attack = (damage * (100 - target.armor) / 100).round
        target.hit_points -= damage_attack
        target.damage_taken = 0 - damage_attack
        target.dead = true if target.hit_points <= 0

        target.save
      elsif skill.name.include?("Heal")
        target.damage_taken = 0
        target.hit_points += (damage / 1.25).round
        target.hit_points > target.max_hp ? target.hit_points = target.max_hp : nil
        target.damage_taken = (damage / 1.25).round
        target.save
      end
    end
  end

  def play_turn(cards_player, cards_opponent)
    all_cards = cards_player + cards_opponent
    all_cards = all_cards.select { |card| card.dead == false }

    while all_cards.all? { |battle_card| battle_card.counter < 100 }
      all_cards.each do |battle_card|
        battle_card.counter += battle_card.speed
        battle_card.save
      end
    end
    all_cards.sort_by!(&:counter)
    all_cards.reverse!
    all_cards.find { |battle_card| battle_card.counter >= 100 }
  end

  def manage_skill_countdown(skill)
    skill.counter = 0
    skill.save
  end

  def create_bt(cards)
    player = cards.first.player
    battle_team = BattleTeam.create(player:)
    cards.each do |card|
      prestige = card.prestige
      case prestige
      when 1
        hit_points = (card.hit_points * 0.9).round + card.gear_set.bonus_hp
        armor = (card.armor * 0.9).round + card.gear_set.bonus_armor
        power = (card.power * 0.9).round + card.gear_set.bonus_power
        speed = (card.speed * 0.9).round + card.gear_set.bonus_speed
      when 2
        hit_points = card.hit_points + card.gear_set.bonus_hp
        armor = card.armor + card.gear_set.bonus_armor
        power = card.power + card.gear_set.bonus_power
        speed = card.speed + card.gear_set.bonus_speed
      when 3
        hit_points = (card.hit_points * 1.1).round + card.gear_set.bonus_hp
        armor = (card.armor * 1.1).round + card.gear_set.bonus_armor
        power = (card.power * 1.1).round + card.gear_set.bonus_power
        speed = (card.speed * 1.1).round + card.gear_set.bonus_speed
      when 4
        hit_points = (card.hit_points * 1.25).round + card.gear_set.bonus_hp
        armor = (card.armor * 1.25).round + card.gear_set.bonus_armor
        power = (card.power * 1.25).round + card.gear_set.bonus_power
        speed = (card.speed * 1.25).round + card.gear_set.bonus_speed
      when 5
        hit_points = (card.hit_points * 1.5).round + card.gear_set.bonus_hp
        armor = (card.armor * 1.5).round + card.gear_set.bonus_armor
        power = (card.power * 1.5).round + card.gear_set.bonus_power
        speed = (card.speed * 1.5).round + card.gear_set.bonus_speed
      end
      BattleCard.create(hit_points:, armor:, power:, speed:, card:, battle_team:, max_hp: hit_points)
    end
    battle_team
  end

  def decision_skill(card, bcs_player, bcs_computer)
    skills = card.card.skills.select { |skill| skill.counter >= skill.reload_time }
    heals = skills.select { |skill| skill.name.include?("Heal") }
    attacks = skills.select { |skill| skill.name.include?("Attack") }
    allies_alive = bcs_computer.where(dead: false).size
    ennemies_alive = bcs_player.where(dead: false).size
    allies_injured = (bcs_computer.select { |battle_card| battle_card.hit_points.between?(1, 80 * battle_card.max_hp / 100) }).size
    if (allies_alive.to_f / allies_injured) < 2
      if allies_injured.size > 1
        skill = (heals.select { |heal| heal.target_type.include?("Multi") }).first
      end
      skill ||= (heals.select { |heal| heal.target_type.include?("Single") }).first
    else
      if ennemies_alive.size > 1
        skill = (attacks.select { |attack| attack.target_type.include?("Multi") }).first
      end
      skill ||= (attacks.select { |attack| attack.target_type.include?("Single") }).first
    end
    skill.nil? ? skills.sample : skill
  end

  def decision_target(bcs_player, bcs_computer, skill)
    bcs_computer = bcs_computer.sample(2)
    bcs_player = bcs_player.sample(2)

    if skill.name.include?("Heal")
      bcs_computer.min_by(&:hit_points)
    elsif skill.name.include?("Attack")
      bcs_player.min_by(&:hit_points)
    end
  end

  def card_ids_params
    params.require(:card_ids)
  end

  def challenge_id_params
    params.require(:challenge_id)
  end

  def battle_params
    params.permit!
  end

  def target_params
    params.permit(:target)
  end
end
