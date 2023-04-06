class GearSet < ApplicationRecord
  belongs_to :card
  has_many :gears

  before_save :calculate_bonus
  before_save :check_full

  private

  def calculate_bonus
    hp = 0
    armor = 0
    power = 0
    speed = 0
    gears.each do |gear|
      hp += gear.bonus_hp
      armor += gear.bonus_armor
      power += gear.bonus_power
      speed += gear.bonus_speed
    end
    self.bonus_hp = hp
    self.bonus_armor = armor
    self.bonus_power = power
    self.bonus_speed = speed
  end

  def check_full
    case level
    when 0
      gears.size == 3 ? self.full = true : nil
    when 1
      gears.size == 6 ? self.full = true : nil
    when 2
      gears.size == 9 ? self.full = true : nil
    end
  end
end
