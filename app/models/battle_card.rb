class BattleCard < ApplicationRecord
  belongs_to :card
  belongs_to :battle_team

  has_many :effects

  def effect?(effect_name)
    effects.any? { |effect| effect.name == effect_name }
  end
end
