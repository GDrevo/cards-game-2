class CardsController < ApplicationController
  def index
    player = current_user.player
    @cards = player.cards.where(unlocked: true).sort_by(&:war_power).reverse
    @cards_locked = player.cards.select { |card| card.unlocked == false }
    @cards_locked = @cards_locked.sort_by(&:shards).reverse
  end
end
