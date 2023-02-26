class ChallengesController < ApplicationController
  def index
    user = current_user
    @challenges = user.player.player_challenges.where(unlocked: true)
    @challenges_locked = user.player.player_challenges.where(unlocked: false)
    if params[:side].present?
      @challenges = @challenges.where(category: params[:side])
      @challenges_locked = @challenges_locked.where(category: params[:side])
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @bt_computer = @challenge.computer.cards
    @players_cards = @challenge.player.cards.where.not(side: @bt_computer.first.side).and(@challenge.player.cards.where(unlocked: true))
  end
end
