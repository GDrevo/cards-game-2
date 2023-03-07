class Player < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cards
  has_many :player_challenges, class_name: 'Challenge', foreign_key: 'player_id', inverse_of: :player
  has_many :computer_challenges, class_name: 'Challenge', foreign_key: 'computer_id', inverse_of: :computer
  has_many :battle_teams
  has_many :battles
  has_many :offers

  def unlock(card_name)
    card = cards.where(name: card_name).first
    card.unlocked = true
    card.save
  end

  def check_challenge_unlock
    all_challenges = challenges.where(category.include?("epic")).or(challenges.where(category.include?("elite")))
    challenges_to_check = all_challenges.where(unlocked: false)

    challenges_to_check.each do |challenge|
      # challenge.requirement = "Paladin,Berserker,Cleric,Priest,Captain"
      prestige = challenge.rank
      req = challenge.requirement.split(",")
      req_cards = []
      req.each do |card_name|
        card_checked = cards.where(name: card_name).first
        req_cards << card_checked.prestige >= prestige ? card_checked : next
      end
      req.size == req_cards.size && challenge.unlocked = true
      req.size == req_cards.size && challenge.save
    end
  end
end
