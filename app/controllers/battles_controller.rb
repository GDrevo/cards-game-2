class BattlesController < ApplicationController
  def create
    player_cards = []
    card_ids_params.each do |id|
      player_cards << Card.find(id)
    end
    challenge = Challenge.find(challenge_id_params)
    player = challenge.player
    bt_computer = create_bt(challenge.computer.cards)
    bt_player = create_bt(player_cards)
    battle = Battle.create(player:, challenge:, bt_computer:, bt_player:)
    redirect_to battle_path(battle)
  end

  def show
    @battle = Battle.find(params[:id].to_i)
    bcs_player = @battle.bt_player.battle_cards
    @bcs_player = bcs_player.sort_by { |obj| obj.card.name }
    bcs_opponent = @battle.bt_computer.battle_cards
    @bcs_opponent = bcs_opponent.sort_by { |obj| obj.card.name }
    if !@bcs_player.all?(&:dead) && !@bcs_opponent.all?(&:dead)
      @card_to_play = play_turn(@bcs_player, @bcs_opponent)
      session[:card_to_play_id] = @card_to_play.id
      @skills = @card_to_play.card.skills
    end

    if @bcs_player.all?(&:dead)
      redirect_to game_over_path(@battle, winner: @battle.bt_computer.player)
    elsif @bcs_opponent.all?(&:dead)
      redirect_to game_over_path(@battle, winner: @battle.bt_player.player)
    else
      render :show
    end
  end

  def simulate_turn
    battle = Battle.find(params[:id])
    # 1. Get the skills the card_to_play can use, compute a simple logic to decide which to use

    # 2. Do the same for the opponent's card to target

    # 3. Calculate damage, lower hit_points and reset counter

  end

  private

  def play_turn(cards_player, cards_opponent)
    all_cards = cards_player + cards_opponent

    while all_cards.all? { |battle_card| battle_card.counter < 100 }
      all_cards.each do |battle_card|
        battle_card.counter += (battle_card.card.speed / 5.0).round
        battle_card.save
      end
    end
    all_cards.sort_by!(&:counter)
    all_cards.reverse!
    all_cards.find { |battle_card| battle_card.counter >= 100 }
  end

  def create_bt(cards)
    player = cards.first.player
    battle_team = BattleTeam.create(player:)
    cards.each do |card|
      BattleCard.create(hit_points: card.hit_points, card:, battle_team:)
    end
    battle_team
  end

  def card_ids_params
    params.require(:card_ids)
  end

  def challenge_id_params
    params.require(:challenge_id)
  end
end
