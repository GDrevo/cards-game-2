class BattleTeam < ApplicationRecord
  belongs_to :player
  has_many :battles, as: bt_computer
  has_many :battles, as: bt_player
  has_many :battle_cards
end
