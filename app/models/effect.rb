class Effect < ApplicationRecord
  belongs_to :battle_card

  after_create :define_name
  after_create :apply_effect

  after_save :check_if_done

  before_destroy :remove_effect

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

  def apply_effect
    bc = battle_card
    if curse
      case effect_type
      when "armor"
        bc.armor = bc.armor - intensity
      when "power"
        bc.power = bc.power - intensity
      when "speed"
        bc.speed = bc.speed - intensity
      when "armor speed"
        bc.armor = bc.armor - intensity
        bc.speed = bc.speed - intensity
      when "armor power"
        bc.armor = bc.armor - intensity
        bc.power = bc.power - intensity
      end
    elsif curse == false
      case effect_type
      when "armor"
        bc.armor = bc.armor + intensity
      when "power"
        bc.power = bc.power + intensity
      when "speed"
        bc.speed = bc.speed + intensity
      when "armor speed"
        bc.armor = bc.armor + intensity
        bc.speed = bc.speed + intensity
      when "armor power"
        bc.armor = bc.armor + intensity
        bc.power = bc.power + intensity
      end
    end
    bc.save
  end

  def check_if_done
    return unless counter == duration

    destroy
  end

  def remove_effect
    bc = battle_card
    if curse
      case effect_type
      when "armor"
        bc.armor = bc.armor + intensity
      when "power"
        bc.power = bc.power + intensity
      when "speed"
        bc.speed = bc.speed + intensity
      when "armor speed"
        bc.armor = bc.armor + intensity
        bc.speed = bc.speed + intensity
      when "armor power"
        bc.armor = bc.armor + intensity
        bc.power = bc.power + intensity
      end
    elsif curse == false
      case effect_type
      when "armor"
        bc.armor = bc.armor - intensity
      when "power"
        bc.power = bc.power - intensity
      when "speed"
        bc.speed = bc.speed - intensity
      when "armor speed"
        bc.armor = bc.armor - intensity
        bc.speed = bc.speed - intensity
      when "armor power"
        bc.armor = bc.armor - intensity
        bc.power = bc.power - intensity
      end
    end
    bc.save
  end
end
