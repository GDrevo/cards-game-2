class PvpBattleTeam < ApplicationRecord
  belongs_to :player
  has_many :opponent_battles, class_name: 'PvpBattle', foreign_key: 'bt_opponent', dependent: :destroy
  has_many :player_battles, class_name: 'PvpBattle', foreign_key: 'bt_player', dependent: :destroy
  has_many :pvp_battle_cards, dependent: :destroy
end
