class Card < ApplicationRecord
  belongs_to :player
  has_many :skills
  has_many :battle_cards

  after_create :create_skills

  def level_up(xp)
    return if level == 50

    current_xp = self.experience
    self.experience += xp
    self.level += 1
    new_hp = hit_points + ((7.0 / 100) * hit_points).round
    new_armor = armor + ((self.level - 1) / 100.0).round
    new_power = power + ((8.0 / 100) * power).round
    new_speed = speed + ((self.level - 1) / 100.0).round
    new_next_level = next_level + (next_level / 10.0).round
    new_experience = xp - next_level + current_xp
    self.hit_points = new_hp
    self.armor = new_armor
    self.power = new_power
    self.speed = new_speed
    self.next_level = new_next_level
    self.experience = new_experience
    new_experience_given = experience_given + ((8 / 100.0) * experience_given).round
    self.experience_given = new_experience_given
    # CHECK IF ALL STATS UPDATE ACCORDINGLY
    save
  end

  def prestige_up
    case prestige
    when 0
      self.unlocked = true
      self.prestige = 1
      self.next_prestige = 25
    when 1
      self.prestige = 2
      self.next_prestige = 50
    when 2
      self.prestige = 3
      self.next_prestige = 75
    when 3
      self.prestige = 4
      self.next_prestige = 100
    when 4
      self.prestige = 5
    end
    save
  end

  private

  def create_skills
    best_cards = ["King", "Archfiend"]
    good_cards = ["Paladin", "Crusader", "Cleric", "Captain", "Demon", "Necromancer", "Warlock", "Hellhound"]

    if best_cards.include?(name)
      Skill.create(name: "Strong Attack", target_type: "Single", strength: "Strong", reload_time: 1, card: self)
      Skill.create(name: "Multi Attack", target_type: "Multi", strength: "Normal", reload_time: 2, card: self)
      Skill.create(name: "Special Attack", target_type: "Multi", strength: "Strong", reload_time: 3, card: self)
    elsif good_cards.include?(name)
      case card_type
      when "attacker"
        Skill.create(name: "Basic Attack", target_type: "Single", strength: "Normal", reload_time: 1, card: self)
        Skill.create(name: "Multi Attack", target_type: "Multi", strength: "Normal", reload_time: 2, card: self)
        Skill.create(name: "Special Attack", target_type: "Single", strength: "Strong", reload_time: 3, card: self)
      when "healer"
        Skill.create(name: "Basic Attack", target_type: "Single", strength: "Light", reload_time: 1, card: self)
        Skill.create(name: "Strong Heal", target_type: "Single", strength: "Strong", reload_time: 2, card: self)
        Skill.create(name: "Multi Heal", target_type: "Multi", strength: "Normal", reload_time: 3, card: self)
      end
    else
      case card_type
      when "attacker"
        Skill.create(name: "Basic Attack", target_type: "Single", strength: "Light", reload_time: 1, card: self)
        Skill.create(name: "Stronger Attack", target_type: "Single", strength: "Normal", reload_time: 2, card: self)
        Skill.create(name: "Special Attack", target_type: "Single", strength: "Normal", reload_time: 3, card: self)
      when "healer"
        Skill.create(name: "Basic Attack", target_type: "Single", strength: "Light", reload_time: 1, card: self)
        Skill.create(name: "Basic Heal", target_type: "Single", strength: "Normal", reload_time: 2, card: self)
        Skill.create(name: "Multi Heal", target_type: "Multi", strength: "Light", reload_time: 3, card: self)
      end
    end
  end
end
