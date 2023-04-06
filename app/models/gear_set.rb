class GearSet < ApplicationRecord
  belongs_to :card
  has_many :gears

  before_save :calculate_bonus

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
end
