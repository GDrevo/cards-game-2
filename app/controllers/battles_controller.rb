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
    bcs_player = @battle.bt_player.battle_cards.select { |card| card.dead == false }
    bcs_opponent = @battle.bt_computer.battle_cards.select { |card| card.dead == false }
    @bcs_player = bcs_player.sort_by { |obj| obj.card.name }
    @bcs_opponent = bcs_opponent.sort_by { |obj| obj.card.name }
    if bcs_opponent.any? { |bc| bc.effects.any? { |effect| effect.effect_type == "taunt" } }
      @targetable_bcs_opponent = @bcs_opponent.select do |bc|
        bc.effects.any? { |effect| effect.effect_type == "taunt" }
      end
    else
      @targetable_bcs_opponent = @bcs_opponent
    end
    if !@bcs_player.all?(&:dead) && !@bcs_opponent.all?(&:dead)
      @card_to_play = play_turn(@bcs_player, @bcs_opponent)
      session[:card_to_play_id] = @card_to_play.id
      @skills = @card_to_play.card.skills.select { |skill| skill.counter >= skill.reload_time }
    end

    if @bcs_player.all?(&:dead)
      set_winner("computer", @battle)
    elsif @bcs_opponent.all?(&:dead)
      set_winner(@battle.player, @battle)
    else
      # raise
      render :show
    end
  end

  def play_card
    battle = Battle.find(params[:id])
    bcs_player = battle.bt_player.battle_cards
    alive_bcs_player = bcs_player.select { |card| card.dead == false }
    bcs_computer = battle.bt_computer.battle_cards
    alive_bcs_computer = bcs_computer.select { |card| card.dead == false }
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
    redirect_to battle_path(battle)
  end

  def simulate_turn
    battle = Battle.find(params[:id])
    bcs_player = battle.bt_player.battle_cards
    alive_bcs_player = bcs_player.select { |card| card.dead == false }
    bcs_computer = battle.bt_computer.battle_cards
    alive_bcs_computer = bcs_computer.select { |card| card.dead == false }
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

    set_effect(skill, bcs_computer, bcs_player, bc_attacker, bc_target) if skill.effect

    manage_skill_countdown(skill)
    card_to_play.counter = 0
    card_to_play.save
    session.delete(:card_to_play_id)
    redirect_to battle_path(battle)
  end

  def rewards
    @xp_gained = params[:experience_gained]
    @shard_card_id = params[:shard_card].to_i
    @shard_card = Card.find(@shard_card_id)
  end

  private

  def set_effect(skill, bcs_attacker, bcs_defender, bc_attacker, bc_target)
    if skill.effect_type == "dispell"
      case skill.effect_target_type
      when "same"
        bc_target.effects.where(curse: false).destroy_all unless bc_target.effects.where(curse: false).empty?
      when "ennemies"
        bcs_target.each do |target|
          target.effects.where(curse: false).destroy_all unless target.effects.where(curse: false).empty?
        end
      end
    else
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
      @shard_card = give_shards(player, battle.challenge)
      player.coins += battle.challenge.reward
      player.save
      # Set challenge as done, unlock the next one
      battle.challenge.done = true
      battle.challenge.save
      next_challenge = battle.challenge.next(battle.challenge.category)
      next_challenge.unlocked = true if next_challenge
      next_challenge.save if next_challenge
      # Give the shards to player_cards and add the coins to player.coins
      player_bcs = battle.bt_player.battle_cards.select { |bc| bc.dead == false }
      computer_bcs = battle.bt_computer.battle_cards
      # Calculate XP gained and divide it between the cards that aren't dead
      @experience = calculate_experience(player_bcs, computer_bcs)
      redirect_to rewards_battle_path(battle_id: battle.id, experience_gained: @experience, shard_card: @shard_card.id)
    else
      player_bcs = battle.bt_player.battle_cards
      computer_bcs = battle.bt_computer.battle_cards.select { |bc| bc.dead == true }
      calculate_experience(player_bcs, computer_bcs)
      redirect_to challenges_path(side: battle.challenge.category)
    end
  end

  def give_shards(player, challenge)
    case challenge.shards
    when "normal weak"
      if challenge.category == "light"
        cards = player.cards.where(side: "light")
        shard_card = cards.where(cat: "normal weak").sample
        return if shard_card.prestige == 5

        challenge.done ? shard_card.shards += 1 : shard_card.shards += 2
        shard_card.prestige_up if shard_card.shards >= shard_card.next_prestige
      else
        cards = player.cards.where(side: "dark")
        shard_card = cards.where(cat: "normal weak").sample
        return if shard_card.prestige == 5

        challenge.done ? shard_card.shards += 1 : shard_card.shards += 2
        shard_card.prestige_up if shard_card.shards >= shard_card.next_prestige
      end
      shard_card.save
    when "normal normal"
      if challenge.category == "light"
        cards = player.cards.where(side: "light")
        weak_shard_card = cards.where(cat: "normal weak").sample
        shard_card = cards.where(cat: "normal normal").sample
        return if shard_card.prestige == 5

        challenge.done ? shard_card.shards += 1 : shard_card.shards += 2
        shard_card.prestige_up if shard_card.shards >= shard_card.next_prestige
        return if weak_shard_card.prestige == 5

        challenge.done ? weak_shard_card.shards += 1 : weak_shard_card.shards += 2
        weak_shard_card.prestige_up if weak_shard_card.shards >= weak_shard_card.next_prestige
      else
        cards = player.cards.where(side: "dark")
        weak_shard_card = cards.where(cat: "normal weak").sample
        shard_card = cards.where(cat: "normal normal").sample
        return if shard_card.prestige == 5

        challenge.done ? shard_card.shards += 1 : shard_card.shards += 2
        shard_card.prestige_up if shard_card.shards >= shard_card.next_prestige
        return if weak_shard_card.prestige == 5

        challenge.done ? weak_shard_card.shards += 1 : weak_shard_card.shards += 2
        weak_shard_card.prestige_up if weak_shard_card.shards >= weak_shard_card.next_prestige
      end
      shard_card.save
      weak_shard_card.save
    when "daily weak"
      cards = player.cards.where(cat: "daily weak")
      card = cards.sample
      challenge.done ? card.shards += 1 : card.shards += 2
    when "daily normal"
      cards = player.cards.where(cat: "daily normal")
      card = cards.sample
      challenge.done ? card.shards += 1 : card.shards += 2
    end
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

    damage = attacker.card.power
    if skill.strength.include?("Light")
      damage = (damage * 0.75).round
    elsif skill.strength.include?("Powerful")
      damage = (damage * 2).round
    end
    if skill.target_type.include?("Multi")
      if skill.name.include?("Attack")
        targets = bcs_defender
        targets.each do |target_multi|
          damage_multi = damage * (100 - target_multi.armor) / 100
          target_multi.hit_points -= damage_multi
          target_multi.dead = true if target_multi.hit_points <= 0
          target_multi.save
        end
      elsif skill.name.include?("Heal")
        targets = bcs_attacker
        targets.each do |target_multi|
          target_multi.hit_points += (damage / 1.25).round
          target_multi.hit_points > target_multi.max_hp ? target_multi.hit_points = target_multi.max_hp : nil
          target_multi.save
        end
      end
    elsif skill.target_type.include?("Single")
      if skill.name.include?("Attack")
        damage_attack = damage * (100 - target.armor) / 100
        target.hit_points -= damage_attack
        target.dead = true if target.hit_points <= 0
        target.save
      elsif skill.name.include?("Heal")
        target.hit_points += (damage / 1.25).round
        target.hit_points > target.max_hp ? target.hit_points = target.max_hp : nil
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
    card = all_cards.find { |battle_card| battle_card.counter >= 100 }
    card.card.skills.each do |skill|
      skill.counter += 1
      skill.save
    end
    card
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
        hit_points = (card.hit_points * 0.75).round
        armor = (card.armor * 0.75).round
        power = (card.power * 0.75).round
        speed = (card.speed * 0.75).round
      when 2
        hit_points = (card.hit_points * 0.9).round
        armor = (card.armor * 0.9).round
        power = (card.power * 0.9).round
        speed = (card.speed * 0.9).round
      when 3
        hit_points = card.hit_points
        armor = card.armor
        power = card.power
        speed = card.speed
      when 4
        hit_points = (card.hit_points * 1.1).round
        armor = (card.armor * 1.1).round
        power = (card.power * 1.1).round
        speed = (card.speed * 1.1).round
      when 5
        hit_points = (card.hit_points * 1.25).round
        armor = (card.armor * 1.25).round
        power = (card.power * 1.25).round
        speed = (card.speed * 1.25).round
      end
      BattleCard.create(hit_points:, armor:, power:, speed:, card:, battle_team:, max_hp: hit_points)
    end
    battle_team
  end

  def decision_skill(card, bcs_player, bcs_computer)
    skills = card.card.skills
    heals = card.card.skills.select { |skill| skill.name.include?("Heal") }
    attacks = card.card.skills.select { |skill| skill.name.include?("Attack") }
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
