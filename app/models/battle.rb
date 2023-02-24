class Battle < ApplicationRecord
  belongs_to :player
  belongs_to :challenge
  belongs_to :bt_computer, class_name: 'BattleTeam'
  belongs_to :bt_player, class_name: 'BattleTeam'
end
