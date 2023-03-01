class Effect < ApplicationRecord
  belongs_to :battle_card

  after_create :define_name

  private

  def define_name
    case effect_type
    when "taunt"
      name = "Taunt"
    when "armor"
      if curse
        name = "Decreased Armor"
      else
        name = "Increased Armor"
      end
    when "power"
      if curse
        name = "Decreased Power"
      else
        name = "Increased Power"
      end
    when "speed"
      if curse
        name = "Decreased Speed"
      else
        name = "Increased Speed"
      end
    when "damage"
      if curse
        name = "Decreased Damage"
      else
        name = "Increased Damage"
      end
    when "armor speed"
      if curse
        name = "Decreased Armor and Speed"
      else
        name = "Increased Armor and Speed"
      end
    when "armor power"
      if curse
        name = "Decreased Armor and Power"
      else
        name = "Increased Armor and Power"
      end
    end
    self.name = name
    save
  end
end
