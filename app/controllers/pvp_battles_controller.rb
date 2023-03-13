class PvpBattlesController < ApplicationController
  def new
    @players_cards = current_user.player.cards.where(unlocked: true)
    bt_opponent = PvpBattleTeam.find(params[:opponent_id])
    @opponent_bt = bt_opponent
    @bt_computer = bt_opponent.pvp_battle_cards
    # raise
  end

  def create
    player_cards = []
    card_ids_params.each do |id|
      player_cards << Card.find(id)
    end
    player = current_user.player
    bt_player = create_bt(player_cards)
    bt_player.pvp_battle_cards.each do |battle_card|
      battle_card.damage_taken = 0
      battle_card.pvp_effects.destroy_all
      battle_card.card.skills.each do |skill|
        skill.counter = skill.reload_time
        skill.save
      end
    end

    bt_opponent = PvpBattleTeam.find(opponent_bt_params)
    bt_opponent.pvp_battle_cards.each do |battle_card|
      battle_card.dead = false
      battle_card.hit_points = battle_card.card.hit_points
      battle_card.pvp_effects.destroy_all
      battle_card.card.skills.each do |skill|
        skill.counter = skill.reload_time
        skill.save
      end
    end

    battle = PvpBattle.create(player:, bt_opponent:, bt_player:)
    redirect_to pvp_battle_path(battle)
  end

  def show
    @pvp_battle = PvpBattle.find(params[:id])

    current_turn = @pvp_battle.turn_number
    current_turn == 1 ? cookies[:last_turn] = 1 : nil

    bcs_player_all = @pvp_battle.bt_player.pvp_battle_cards
    bcs_opponent_all = @pvp_battle.bt_opponent.pvp_battle_cards

    bcs_player = @pvp_battle.bt_player.pvp_battle_cards.select { |card| card.dead == false }
    bcs_opponent = @pvp_battle.bt_opponent.pvp_battle_cards.select { |card| card.dead == false }
    @bcs_player = bcs_player.sort_by { |obj| obj.card.name }
    @bcs_opponent = bcs_opponent.sort_by { |obj| obj.card.name }
    if bcs_opponent.any? { |bc| bc.pvp_effects.any? { |effect| effect.effect_type == "taunt" } }
      @taunt_present = true
      @targetable_bcs_opponent = @bcs_opponent.select do |bc|
        bc.pvp_effects.any? { |effect| effect.effect_type == "taunt" }
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
      set_winner("computer", @pvp_battle, bcs_opponent_all.first.pvp_battle_team)
    elsif @bcs_opponent.all?(&:dead)
      set_winner(@pvp_battle.player, @pvp_battle, bcs_opponent_all.first.pvp_battle_team)
    else
      render :show
    end
  end

  def play_card
    battle = PvpBattle.find(params[:id])
    bcs_player = battle.bt_player.pvp_battle_cards
    alive_bcs_player = bcs_player.select { |card| card.dead == false }
    bcs_opponent = battle.bt_opponent.pvp_battle_cards
    alive_bcs_opponent = bcs_opponent.select { |card| card.dead == false }
    all_bcs = bcs_player + bcs_opponent
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
      bc_target = PvpBattleCard.find(target_params[:target].to_i)
    end
    calculate_damage(bc_attacker, bc_target, skill, alive_bcs_player, alive_bcs_opponent)
    manage_effects(bc_attacker) unless bc_attacker.pvp_effects.empty?

    set_effect(skill, bcs_player, bcs_opponent, bc_attacker, bc_target) if skill.effect

    manage_skill_countdown(skill)
    card_to_play = PvpBattleCard.find(session[:card_to_play_id])
    card_to_play.counter = 0
    card_to_play.save
    session.delete(:card_to_play_id)
    battle.turn_number += 1
    battle.save

    redirect_to pvp_battle_path(battle)
  end

  def simulate_turn
    battle = PvpBattle.find(params[:id])
    bcs_player = battle.bt_player.pvp_battle_cards
    alive_bcs_player = bcs_player.select { |card| card.dead == false }
    bcs_opponent = battle.bt_opponent.pvp_battle_cards
    alive_bcs_opponent = bcs_opponent.select { |card| card.dead == false }
    all_bcs = bcs_player + bcs_opponent
    all_bcs.each do |bc|
      bc.damage_taken = 0
      bc.save
    end
    # 1. Get the skills the card_to_play can use, compute a simple logic to decide which to use

    card_to_play = PvpBattleCard.find(session[:card_to_play_id])
    skill = decision_skill(card_to_play, bcs_player, bcs_opponent)
    # 2. Do the same for the opponent's card to target
    if skill.target_type.include?("Multi")
      bc_target = bcs_player if skill.name.include?("Attack")
      bc_target = bcs_opponent if skill.name.include?("Heal")
    elsif bcs_player.any? { |bc| bc.pvp_effects.any? { |effect| effect.effect_type == "taunt" } }
      taunt_bcs = bcs_player.select do |bc|
        bc.pvp_effects.any? { |effect| effect.effect_type == "taunt" }
      end
      bc_target = decision_target(taunt_bcs, alive_bcs_opponent, skill)
    else
      bc_target = decision_target(alive_bcs_player, alive_bcs_opponent, skill)
    end
    # 3. Calculate damage, lower hit_points and reset counter
    calculate_damage(card_to_play, bc_target, skill, alive_bcs_opponent, alive_bcs_player)
    manage_effects(card_to_play) unless card_to_play.pvp_effects.empty?

    set_effect(skill, bcs_opponent, bcs_player, card_to_play, bc_target) if skill.effect && skill.effect_type != "dispell"

    manage_skill_countdown(skill)
    card_to_play.counter = 0
    card_to_play.save
    session.delete(:card_to_play_id)
    battle.turn_number += 1
    battle.save

    redirect_to pvp_battle_path(battle)
  end

  def rewards
    @rank = params[:new_rank]
  end

  private

  def create_bt(cards)
    player = cards.first.player
    player.pvp_battle_teams.destroy_all
    pvp_battle_team = PvpBattleTeam.create(player:, rank: player.rank)
    cards.each do |card|
      prestige = card.prestige
      case prestige
      when 1
        hit_points = (card.hit_points * 0.9).round
        armor = (card.armor * 0.9).round
        power = (card.power * 0.9).round
        speed = (card.speed * 0.9).round
      when 2
        hit_points = card.hit_points
        armor = card.armor
        power = card.power
        speed = card.speed
      when 3
        hit_points = (card.hit_points * 1.1)
        armor = (card.armor * 1.1)
        power = (card.power * 1.1)
        speed = (card.speed * 1.1)
      when 4
        hit_points = (card.hit_points * 1.25).round
        armor = (card.armor * 1.25).round
        power = (card.power * 1.25).round
        speed = (card.speed * 1.25).round
      when 5
        hit_points = (card.hit_points * 1.5).round
        armor = (card.armor * 1.5).round
        power = (card.power * 1.5).round
        speed = (card.speed * 1.5).round
      end
      PvpBattleCard.create(hit_points:, armor:, power:, speed:, card:, pvp_battle_team:, max_hp: hit_points)
    end
    pvp_battle_team
  end

  def set_effect(skill, bcs_attacker, bcs_defender, bc_attacker, bc_target)
    if skill.effect_type == "dispell"
      case skill.effect_target_type
      when "same"
        bc_target.pvp_effects.where(curse: false).destroy_all unless bc_target.pvp_effects.where(curse: false).empty?
      when "ennemies"
        bcs_defender.each do |target|
          target.pvp_effects.where(curse: false).destroy_all unless target.pvp_effects.where(curse: false).empty?
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

      targets.each do |pvp_battle_card|
        PvpEffect.create(
          effect_type:,
          duration:,
          intensity:,
          pvp_battle_card:,
          curse:
        )
      end
    end
  end

  def manage_effects(bc_attacker)
    effects = bc_attacker.pvp_effects
    effects.each do |effect|
      effect.counter += 1
      effect.save
    end
  end

  def manage_skill_countdown(skill)
    skill.counter = 0
    skill.save
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

  def set_winner(player, battle, opponent_bt)
    if player == battle.player
      # Promote player to the opponent's rank, and demote opponent's rank to player's rank
      prev_rank = player.rank

      prev_rank ||= Player.where.not(rank: 0).sort_by(&:rank).last.rank + 1
      player.rank = opponent_bt.player.rank
      player.save
      player_bt = player.pvp_battle_teams.last
      player_bt.rank = player.rank
      player_bt.save
      opponent_bt.rank = prev_rank
      opponent_bt.save
      opponent_bt.player.rank = prev_rank
      opponent_bt.player.save
      # Save pvp_battle_team so that other players can play against it
      # and delete all others
      opponent_bt.pvp_battle_cards.each do |bc|
        bc.hit_points = bc.max_hp
        bc.dead = false
        bc.damage_taken = 0
        bc.counter = 0
        bc.save
      end
      # redirect to a pvp_rewards page to show promotion
      redirect_to rewards_pvp_battle_path(pvp_battle_id: battle.id, prev_rank:, new_rank: player.rank)
    else
      # redirect to a pvp_rewards page to show FAILED
    end
  end

  def card_ids_params
    params.require(:card_ids)
  end

  def opponent_bt_params
    params.require(:opponent_bt_id)
  end

  def target_params
    params.permit(:target)
  end
end
