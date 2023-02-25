class Player < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cards
  has_many :player_challenges, class_name: 'Challenge', foreign_key: 'player_id', inverse_of: :player
  has_many :computer_challenges, class_name: 'Challenge', foreign_key: 'computer_id', inverse_of: :computer
  has_many :battle_teams
  has_many :battles
end