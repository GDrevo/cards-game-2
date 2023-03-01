class Card < ApplicationRecord
  belongs_to :player
  has_many :skills
  has_many :battle_cards

  after_create :create_skills
  before_save :calculate_war_power

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
    self.war_power = new_power * new_speed
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
    self.shards = 0
    save
  end

  private

  def calculate_war_power
    wp = power * speed
    case prestige
    when 1
      wp = (wp * 0.75).round
    when 2
      wp = (wp * 0.9).round
    when 3
      nil
    when 4
      wp = (wp * 1.1).round
    when 5
      wp = (wp * 1.25).round
    end
    self.war_power = wp
  end

  def create_skills
    card = self

    skillset_1 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "light",
        card:,
        reload_time: 1
      },
      {
        name: "Strong Attack",
        target_type: "Single",
        strength: "normal",
        card:,
        reload_time: 2
      }
    ]
    skillset_2 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "light",
        card:,
        reload_time: 1
      },
      {
        name: "Multi Attack",
        target_type: "Multi",
        strength: "light",
        card:,
        reload_time: 3
      }
    ]
    skillset_3 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "light",
        card:,
        reload_time: 1
      },
      {
        name: "Multi Attack",
        target_type: "Multi",
        strength: "light",
        card:,
        reload_time: 2
      }
    ]
    skillset_4 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "normal",
        card:,
        reload_time: 1,
        effect: true,
        effect_target_type: "allies",
        effect_type: "armor",
        effect_duration: 2,
        intensity: 5
      },
      {
        name: "Multi Attack",
        target_type: "Multi",
        strength: "normal",
        card:,
        reload_time: 2
      },
      {
        name: "Special Attack",
        target_type: "Single",
        strength: "strong",
        card:,
        reload_time: 3,
        effect: true,
        effect_target_type: "ennemies",
        effect_type: "damage",
        curse: true,
        effect_duration: 2,
        intensity: -10 # 10%
      }
    ]
    skillset_5 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "normal",
        card:,
        reload_time: 1
      },
      {
        name: "Strong Attack",
        target_type: "Single",
        strength: "strong",
        card:,
        reload_time: 2,
        effect: true,
        effect_target_type: "same",
        effect_type: "speed",
        curse: true,
        effect_duration: 2,
        intensity: -10
      },
      {
        name: "Special Attack",
        target_type: "Multi",
        strength: "normal",
        card:,
        reload_time: 3,
        effect: true,
        effect_target_type: "ennemies",
        effect_type: "power",
        curse: true,
        effect_duration: 2,
        intensity: -10 # 10%
      }
    ]
    skillset_6 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "normal",
        card:,
        reload_time: 1,
        effect: true,
        effect_target_type: "same",
        effect_type: "dispell"
      },
      {
        name: "Multi Attack",
        target_type: "Multi",
        strength: "normal",
        card:,
        reload_time: 2
      },
      {
        name: "Special Attack",
        target_type: "Single",
        strength: "strong",
        card:,
        reload_time: 3,
        effect: true,
        effect_target_type: "self",
        effect_type: "damage",
        effect_duration: 2,
        intensity: 10 # 10%
      }
    ]
    skillset_7 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "normal",
        card:,
        reload_time: 1
      },
      {
        name: "Strong Attack",
        target_type: "Single",
        strength: "strong",
        card:,
        reload_time: 2,
        effect: true,
        effect_target_type: "allies",
        effect_type: "speed",
        intensity: 5
      },
      {
        name: "Special Attack",
        target_type: "Multi",
        strength: "normal",
        card:,
        reload_time: 3,
        effect: true,
        effect_target_type: "self",
        effect_type: "power",
        effect_duration: 2,
        intensity: 10 # 10%
      }
    ]
    skillset_8 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "normal",
        card:,
        reload_time: 1,
        effect: true,
        effect_target_type: "ennemies",
        effect_type: "damage",
        curse: true,
        intensity: -10 # 10%
      },
      {
        name: "Multi Attack",
        target_type: "Multi",
        strength: "normal",
        card:,
        reload_time: 2
      },
      {
        name: "Special Attack",
        target_type: "Single",
        strength: "strong",
        card:,
        reload_time: 3,
        effect: true,
        effect_target_type: "same",
        effect_type: "damage",
        effect_duration: 2,
        intensity: -20 # 20%
      }
    ]
    skillset_9 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "normal",
        card:,
        reload_time: 1
      },
      {
        name: "Strong Attack",
        target_type: "Single",
        strength: "strong",
        card:,
        reload_time: 2,
        effect: true,
        effect_target_type: "ennemies",
        effect_type: "armor",
        curse: true,
        effect_duration: 2,
        intensity: -5 # 5%
      },
      {
        name: "Special Attack",
        target_type: "Multi",
        strength: "normal",
        card:,
        reload_time: 3,
        effect: true,
        effect_target_type: "same",
        effect_type: "power",
        curse: true,
        effect_duration: 2,
        intensity: -20 # 20%
      }
    ]
    skillset_10 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "strong",
        card:,
        reload_time: 1,
        effect: true,
        effect_target_type: "same",
        effect_type: "dispell"
      },
      {
        name: "Strong Attack",
        target_type: "Single",
        strength: "strong",
        card:,
        reload_time: 2,
        effect: true,
        effect_target_type: "allies",
        effect_type: "speed",
        intensity: 20 # +20 speed
      },
      {
        name: "Special Attack",
        target_type: "Multi",
        strength: "normal",
        card:,
        reload_time: 4,
        effect: true,
        effect_target_type: "ennemies",
        effect_type: "dispell"
      }
    ]
    skillset_11 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "strong",
        card:,
        reload_time: 1,
        effect: true,
        effect_target_type: "allies",
        effect_type: "speed",
        intensity: 20 # +20 speed
      },
      {
        name: "Strong Attack",
        target_type: "Single",
        strength: "strong",
        card:,
        reload_time: 2,
        effect: true,
        effect_target_type: "ennemies",
        effect_type: "dispell"
      },
      {
        name: "Special Attack",
        target_type: "Multi",
        strength: "normal",
        card:,
        reload_time: 4,
        effect: true,
        effect_target_type: "allies",
        effect_type: "speed",
        effect_duration: 2,
        intensity: 15 # +15 speed
      }
    ]
    skillset_12 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "light",
        card:,
        reload_time: 1
      },
      {
        name: "Multi Heal",
        target_type: "Multi",
        strength: "light",
        card:,
        reload_time: 2
      }
    ]
    skillset_13 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "normal",
        card:,
        reload_time: 1
      },
      {
        name: "Multi Heal",
        target_type: "Multi",
        strength: "light",
        card:,
        reload_time: 2
      }
    ]
    skillset_14 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "normal",
        card:,
        reload_time: 1
      },
      {
        name: "Strong Heal",
        target_type: "Single",
        strength: "strong",
        card:,
        reload_time: 2
      },
      {
        name: "Special Heal",
        target_type: "Multi",
        strength: "normal",
        card:,
        reload_time: 3,
        effect: true,
        effect_target_type: "allies",
        effect_type: "damage",
        effect_duration: 2,
        intensity: 15 # 15%
      }
    ]
    skillset_15 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "normal",
        card:,
        reload_time: 1
      },
      {
        name: "Strong Heal",
        target_type: "Single",
        strength: "strong",
        card:,
        reload_time: 2,
        effect: true,
        effect_target_type: "allies",
        effect_type: "damage",
        effect_duration: 2,
        intensity: 10 # 10%
      },
      {
        name: "Special Heal",
        target_type: "Multi",
        strength: "normal",
        card:,
        reload_time: 3
      }
    ]
    skillset_16 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "normal",
        card:,
        reload_time: 1
      },
      {
        name: "Strong Heal",
        target_type: "Single",
        strength: "strong",
        card:,
        reload_time: 2
      },
      {
        name: "Special Heal",
        target_type: "Multi",
        strength: "normal",
        card:,
        reload_time: 3,
        effect: true,
        effect_target_type: "allies",
        effect_type: "speed",
        effect_duration: 2,
        intensity: 10 # +10 speed
      }
    ]
    skillset_17 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "normal",
        card:,
        reload_time: 1
      },
      {
        name: "Strong Heal",
        target_type: "Single",
        strength: "strong",
        card:,
        reload_time: 2,
        effect: true,
        effect_target_type: "allies",
        effect_type: "speed",
        effect_duration: 2,
        intensity: 5 # +5 speed
      },
      {
        name: "Special Heal",
        target_type: "Multi",
        strength: "normal",
        card:,
        reload_time: 3
      }
    ]
    skillset_18 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "light",
        card:,
        reload_time: 1
      },
      {
        name: "Taunt Attack",
        target_type: "Single",
        strength: "light",
        card:,
        reload_time: 3,
        effect: true,
        effect_target_type: "self",
        effect_type: "taunt",
        effect_duration: 2
      }
    ]
    skillset_19 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "light",
        card:,
        reload_time: 1,
        effect: true,
        effect_target_type: self,
        effect_type: "armor",
        effect_duration: 2,
        intensity: 10 # +10 armor
      },
      {
        name: "Taunt Attack",
        target_type: "Single",
        strength: "light",
        card:,
        reload_time: 3,
        effect: true,
        effect_target_type: "self",
        effect_type: "taunt",
        effect_duration: 2
      }
    ]
    skillset_20 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "light",
        card:,
        reload_time: 1,
        effect: true,
        effect_target_type: "allies",
        effect_type: "armor",
        effect_duration: 2,
        intensity: 10 # +10 armor
      },
      {
        name: "Taunt Attack",
        target_type: "Single",
        strength: "light",
        card:,
        reload_time: 2,
        effect: true,
        effect_target_type: "self",
        effect_type: "taunt",
        effect_duration: 2
      },
      {
        name: "Special Effect",
        card:,
        reload_time: 3,
        effect: true,
        effect_target_type: "allies",
        effect_type: "armor speed",
        effect_duration: 2,
        intensity: 15 # +15 armor and +15 speed
      }
    ]
    skillset_21 = [
      {
        name: "Basic Attack",
        target_type: "Single",
        strength: "light",
        card:,
        reload_time: 1,
        effect: true,
        effect_target_type: "same",
        effect_type: "dispell"
      },
      {
        name: "Taunt Attack",
        target_type: "Single",
        strength: "light",
        card:,
        reload_time: 2,
        effect: true,
        effect_target_type: "self",
        effect_type: "taunt",
        effect_duration: 2
      },
      {
        name: "Special Effect",
        card:,
        reload_time: 3,
        effect: true,
        effect_target_type: "allies",
        effect_type: "armor power",
        effect_duration: 2,
        intensity: 15 # +15 armor and +15% power
      }
    ]

    case skillset
    when 1
      skillset_1.each do |skill|
        Skill.create(skill)
      end
    when 2
      skillset_2.each do |skill|
        Skill.create(skill)
      end
    when 3
      skillset_3.each do |skill|
        Skill.create(skill)
      end
    when 4
      skillset_4.each do |skill|
        Skill.create(skill)
      end
    when 5
      skillset_5.each do |skill|
        Skill.create(skill)
      end
    when 6
      skillset_6.each do |skill|
        Skill.create(skill)
      end
    when 7
      skillset_7.each do |skill|
        Skill.create(skill)
      end
    when 8
      skillset_8.each do |skill|
        Skill.create(skill)
      end
    when 9
      skillset_9.each do |skill|
        Skill.create(skill)
      end
    when 10
      skillset_10.each do |skill|
        Skill.create(skill)
      end
    when 11
      skillset_11.each do |skill|
        Skill.create(skill)
      end
    when 12
      skillset_12.each do |skill|
        Skill.create(skill)
      end
    when 13
      skillset_13.each do |skill|
        Skill.create(skill)
      end
    when 14
      skillset_14.each do |skill|
        Skill.create(skill)
      end
    when 15
      skillset_15.each do |skill|
        Skill.create(skill)
      end
    when 16
      skillset_16.each do |skill|
        Skill.create(skill)
      end
    when 17
      skillset_17.each do |skill|
        Skill.create(skill)
      end
    when 18
      skillset_18.each do |skill|
        Skill.create(skill)
      end
    when 19
      skillset_19.each do |skill|
        Skill.create(skill)
      end
    when 20
      skillset_20.each do |skill|
        Skill.create(skill)
      end
    when 21
      skillset_21.each do |skill|
        Skill.create(skill)
      end
    end
  end
end
