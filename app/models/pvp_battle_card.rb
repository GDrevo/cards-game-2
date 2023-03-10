class PvpBattleCard < ApplicationRecord
  belongs_to :card
  belongs_to :pvp_battle_team

  has_many :pvp_effects, dependent: :destroy

  def effect?(effect_name)
    pvp_effects.any? { |effect| effect.name == effect_name }
  end
end
