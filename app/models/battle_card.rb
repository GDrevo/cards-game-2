class BattleCard < ApplicationRecord
  belongs_to :card
  belongs_to :battle_team

  has_many :effects
end
