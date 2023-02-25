class Card < ApplicationRecord
  belongs_to :player
  has_many :skills
  has_many :battle_cards

  after_create :create_skills

  def level_up(xp)
    return if level == 50

    self.experience += xp
    self.level += 1
    new_hp = hit_points + ((7.0 / 100) * hit_points).round
    self.hit_points = new_hp
    new_armor = armor + ((self.level - 1) / 100.0).round
    self.armor = new_armor
    new_power = power + ((8.0 / 100) * power).round
    self.power = new_power
    new_speed = speed + ((self.level - 1) / 100.0).round
    self.speed = new_speed
    new_next_level = next_level + (next_level / 10.0).round
    self.next_level = new_next_level
    new_experience = experience - next_level
    self.experience = new_experience
    new_experience_given = experience_given + ((8 / 100.0) * experience_given).round
    self.experience_given = new_experience_given
    # CHECK IF ALL STATS UPDATE ACCORDINGLY
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
