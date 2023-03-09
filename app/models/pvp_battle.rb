class PvpBattle < ApplicationRecord
  belongs_to :player
  belongs_to :bt_opponent, class_name: 'PvpBattleTeam'
  belongs_to :bt_player, class_name: 'PvpBattleTeam'
end
