class CardsController < ApplicationController
  def index
    player = current_user.player
    @cards = player.cards.where(unlocked: true).sort_by(&:war_power).reverse
    @cards_locked = player.cards.select { |card| card.unlocked == false }
    @cards_locked = @cards_locked.sort_by(&:shards).reverse
    @total_power = @cards.sum(&:war_power)
  end

  def show
    @card = Card.find(params[:id])
    b_hp = 0
    b_armor = 0
    b_power = 0
    b_speed = 0
    @card.gear_set.gears.each do |gear|
      b_hp += gear.bonus_hp
      b_armor += gear.bonus_armor
      b_power += gear.bonus_power
      b_speed += gear.bonus_speed
    end
    @b_hp = b_hp
    @b_armor = b_armor
    @b_power = b_power
    @b_speed = b_speed
  end

  def lvl_up_gear
    card = Card.find(params[:id])
    card.gear_set.level += 1
    card.gear_set.full = false
    card.gear_set.save
    redirect_to card_path(card)
  end
end
