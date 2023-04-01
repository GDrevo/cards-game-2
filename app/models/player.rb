class Player < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cards
  has_many :player_challenges, class_name: 'Challenge', foreign_key: 'player_id', inverse_of: :player
  has_many :computer_challenges, class_name: 'Challenge', foreign_key: 'computer_id', inverse_of: :computer
  has_many :battle_teams
  has_many :pvp_battle_teams
  has_many :battles
  has_many :pvp_battles
  has_many :offers
  has_many :gears

  def unlock(card_name)
    card = cards.where(name: card_name).first
    card.unlocked = true
    card.save
  end

  def check_challenge_unlock
    epic_challenges = player_challenges.where(category: "epic")
    elite_challenges = player_challenges.where(category: "elite")
    all_challenges = epic_challenges + elite_challenges
    challenges_to_check = all_challenges.select { |challenge| challenge.unlocked == false }
    challenges_to_check.each do |challenge|
      # challenge.requirement = "Paladin,Berserker,Cleric,Priest,Captain"
      prestige = challenge.rank
      req = challenge.requirement.split(",")
      req_cards = []
      req.each do |card_name|
        card_checked = cards.where(name: card_name).first
        # card_checked.prestige.to_i == 0 ? next : nil
        card_checked.prestige < prestige ? next : req_cards << card_checked
      end
      req.size == req_cards.size && challenge.unlocked = true
      req.size == req_cards.size && challenge.save
    end
  end
end
