class OffersController < ApplicationController
  def index
    if current_user.player.offers.empty? == false
      current_user.player.offers.last.created_at.today? ? nil : create_new_offers(current_user.player)
    else
      create_new_offers(current_user.player)
    end
    @offers = current_user.player.offers
    # raise
  end

  def buy
    offer = Offer.find(params[:id])
    card = offer.player.cards.where(name: offer.shard_card).first
    card.shards += offer.shard_number
    card.shards >= card.next_prestige ? card.prestige_up : nil
    card.save
    offer.bought = true
    offer.save
    offer.player.coins -= offer.price
    offer.player.save
    # raise
    redirect_to offers_path
  end

  private

  def create_new_offers(player)
    current_user.player.coins += 1000
    current_user.player.save
    player.offers.empty? ? nil : player.offers.destroy_all
    10.times do
      random = rand(1..100)
      if random > 95
        cards = Card.where(cat: "strong")
        card = cards.sample
        # # 5% 2 shards strong
        Offer.create(player:, price: 200, shard_card: card.name, shard_number: 2)
      elsif random > 90
        # # 5% 1 shard strong
        cards = Card.where(cat: "strong")
        card = cards.sample
        Offer.create(player:, price: 100, shard_card: card.name, shard_number: 1)
      elsif random > 85
        # # 5% 5 shards normal
        cards = Card.where(cat: "normal")
        card = cards.sample
        Offer.create(player:, price: 250, shard_card: card.name, shard_number: 5)
      elsif random > 60
        # # 25% 2 shards normal
        cards = Card.where(cat: "normal")
        card = cards.sample
        Offer.create(player:, price: 100, shard_card: card.name, shard_number: 2)
      elsif random > 50
        # # 10% 10 shards weak
        cards = Card.where(cat: "weak")
        card = cards.sample
        Offer.create(player:, price: 250, shard_card: card.name, shard_number: 10)
      else
        # # 50% 5 shards weak
        cards = Card.where(cat: "weak")
        card = cards.sample
        Offer.create(player:, price: 125, shard_card: card.name, shard_number: 5)
      end
    end
  end
end
