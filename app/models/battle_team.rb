class BattleTeam < ApplicationRecord
  belongs_to :player
  has_many :computer_battles, class_name: 'Battle', foreign_key: 'bt_computer'
  has_many :player_battles, class_name: 'Battle', foreign_key: 'bt_player'
  has_many :battle_cards
end
