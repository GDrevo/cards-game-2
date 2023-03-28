class Card < ApplicationRecord
  belongs_to :player
  has_many :skills
  has_many :battle_cards
  has_one_attached :photo

  after_create :create_skills
  after_create :attach_photo
  before_save :calculate_war_power

  def level_up(xp)
    return if level == 50

    current_xp = self.experience
    self.experience += xp
    self.level += 1
    new_hp = hit_points + (0.07 * hit_points).round
    new_armor = armor + (armor * 0.02).round
    new_power = power + (0.08 * power).round
    new_speed = speed + (speed * 0.02).round
    new_next_level = next_level + (next_level * 0.1).round
    new_experience = xp - next_level + current_xp
    self.hit_points = new_hp
    self.armor = new_armor
    self.power = new_power
    self.speed = new_speed
    self.next_level = new_next_level
    self.experience = new_experience
    new_experience_given = experience_given + (0.08 * experience_given).round
    self.experience_given = new_experience_given
    save
  end

  def prestige_up
    shards == next_prestige ? shards_stock = 0 : shards_stock = shards - next_prestige
    case prestige
    when 0
      self.unlocked = true
      self.prestige = 1
      self.next_prestige = 5
    when 1
      self.prestige = 2
      self.next_prestige = 10
    when 2
      self.prestige = 3
      self.next_prestige = 25
    when 3
      self.prestige = 4
      self.next_prestige = 50
    when 4
      self.prestige = 5
    end
    self.shards = shards_stock
    save
    player.check_challenge_unlock
  end

  private

  def calculate_war_power
    wp = power * speed
    case prestige
    when 2
      wp = (power + 25) * (speed + 1)
    when 3
      wp = (power + 75) * (speed + 2)
    when 4
      wp = (power + 150) * (speed + 3)
    when 5
      wp = (power + 250) * (speed + 5)
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
        effect_target_type: "ennemies",
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
        effect_target_type: "self",
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
        target_type: "Multi",
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
        target_type: "Multi",
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

  def attach_photo
    return if photo.attached?

    case name
    when "Footman"
      photo.attach(io: File.open('app/assets/images/footman.png'), filename: 'footman.png', content_type: "image/png")
    when "Archer"
      photo.attach(io: File.open('app/assets/images/archer.png'), filename: 'archer.png', content_type: "image/png")
    when "Brute"
      photo.attach(io: File.open('app/assets/images/brute.png'), filename: 'brute.png', content_type: "image/png")
    when "Cavalry"
      photo.attach(io: File.open('app/assets/images/cavalry.png'), filename: 'cavalry.png', content_type: "image/png")
    when "Cleric"
      photo.attach(io: File.open('app/assets/images/cleric.png'), filename: 'cleric.png', content_type: "image/png")
    when "High Priest"
      photo.attach(io: File.open('app/assets/images/high priest.png'), filename: 'high priest.png', content_type: "image/png")
    when "Guardian"
      photo.attach(io: File.open('app/assets/images/guardian.png'), filename: 'guardian.png', content_type: "image/png")
    when "Captain"
      photo.attach(io: File.open('app/assets/images/captain.png'), filename: 'captain.png', content_type: "image/png")
    when "Crossbowman"
      photo.attach(io: File.open('app/assets/images/crossbowman.png'), filename: 'crossbowman.png', content_type: "image/png")
    when "Axeman"
      photo.attach(io: File.open('app/assets/images/axeman.png'), filename: 'axeman.png', content_type: "image/png")
    when "Shieldbearer"
      photo.attach(io: File.open('app/assets/images/shieldbearer.png'), filename: 'shieldbearer.png', content_type: "image/png")
    when "Herbalist"
      photo.attach(io: File.open('app/assets/images/herbalist.png'), filename: 'herbalist.png', content_type: "image/png")
    when "Crusader"
      photo.attach(io: File.open('app/assets/images/crusader.png'), filename: 'crusader.png', content_type: "image/png")
    when "Commander"
      photo.attach(io: File.open('app/assets/images/commander.png'), filename: 'commander.png', content_type: "image/png")
    when "Death Weaver"
      photo.attach(io: File.open('app/assets/images/death weaver.png'), filename: 'death weaver.png', content_type: "image/png")
    when "Mage Apprentice"
      photo.attach(io: File.open('app/assets/images/mage apprentice.png'), filename: 'mage apprentice.png', content_type: "image/png")
    when "Marksman"
      photo.attach(io: File.open('app/assets/images/marksman.png'), filename: 'marksman.png', content_type: "image/png")
    when "Swordsman"
      photo.attach(io: File.open('app/assets/images/swordsman.png'), filename: 'swordsman.png', content_type: "image/png")
    when "Spearman"
      photo.attach(io: File.open('app/assets/images/spearman.png'), filename: 'spearman.png', content_type: "image/png")
    when "Death Knight"
      photo.attach(io: File.open('app/assets/images/death knight.png'), filename: 'death knight.png', content_type: "image/png")
    when "Banshee"
      photo.attach(io: File.open('app/assets/images/banshee.png'), filename: 'banshee.png', content_type: "image/png")
    when "Mummy"
      photo.attach(io: File.open('app/assets/images/mummy.png'), filename: 'mummy.png', content_type: "image/png")
    when "Mummy Guardian"
      photo.attach(io: File.open('app/assets/images/mummy guardian.png'), filename: 'mummy guardian.png', content_type: "image/png")
    when "Crypt Keeper"
      photo.attach(io: File.open('app/assets/images/crypt keeper.png'), filename: 'crypt keeper.png', content_type: "image/png")
    when "Berserker"
      photo.attach(io: File.open('app/assets/images/berserker.png'), filename: 'berserker.png', content_type: "image/png")
    when "Paladin"
      photo.attach(io: File.open('app/assets/images/paladin.png'), filename: 'paladin.png', content_type: "image/png")
    when "King"
      photo.attach(io: File.open('app/assets/images/king.png'), filename: 'king.png', content_type: "image/png")
    when "Necromancer"
      photo.attach(io: File.open('app/assets/images/necromancer.png'), filename: 'necromancer.png', content_type: "image/png")
    when "Necromancer Acolyte"
      photo.attach(io: File.open('app/assets/images/necromancer acolyte.png'), filename: 'necromancer acolyte.png', content_type: "image/png")
    when "Crypt Sentinel"
      photo.attach(io: File.open('app/assets/images/crypt sentinel.png'), filename: 'crypt sentinel.png', content_type: "image/png")
    when "Bone Weaver"
      photo.attach(io: File.open('app/assets/images/bone weaver.png'), filename: 'bone weaver.png', content_type: "image/png")
    when "Spectral Guardian"
      photo.attach(io: File.open('app/assets/images/spectral guardian.png'), filename: 'spectral guardian.png', content_type: "image/png")
    when "Death Priest"
      photo.attach(io: File.open('app/assets/images/death priest.png'), filename: 'death priest.png', content_type: "image/png")
    when "Skeleton Warrior"
      photo.attach(io: File.open('app/assets/images/skeleton warrior.png'), filename: 'skeleton warrior.png', content_type: "image/png")
    when "Rotting Corpse"
      photo.attach(io: File.open('app/assets/images/rotting corpse.png'), filename: 'rotting corpse.png', content_type: "image/png")
    when "Skeletal Archer"
      photo.attach(io: File.open('app/assets/images/skeletal archer.png'), filename: 'skeletal archer.png', content_type: "image/png")
    when "Zombie Brute"
      photo.attach(io: File.open('app/assets/images/zombie brute.png'), filename: 'zombie brute.png', content_type: "image/png")
    when "Bone Dragon"
      photo.attach(io: File.open('app/assets/images/bone dragon.png'), filename: 'bone dragon.png', content_type: "image/png")
    when "Grave Lord"
      photo.attach(io: File.open('app/assets/images/grave lord.png'), filename: 'grave lord.png', content_type: "image/png")
    when "Lich King"
      photo.attach(io: File.open('app/assets/images/lich king.png'), filename: 'lich king.png', content_type: "image/png")
    else
      case side
      when "light"
        photo.attach(io: File.open('app/assets/images/paladin.png'), filename: 'paladin.png', content_type: "image/png")
      when "dark"
        photo.attach(io: File.open('app/assets/images/death priest.png'), filename: 'death priest.png', content_type: "image/png")
      else
        photo.attach(io: File.open('app/assets/images/zombie brute.png'), filename: 'zombie brute.png', content_type: "image/png")
      end
    end
    save
  end
end
