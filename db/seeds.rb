# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
# TO DO: adapt the cards stats to level
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

def card_creator(computer, name, level, hit_points, attributes, skillset_num)
  if level == 1
    hp = hit_points
    new_armor = attributes[0]
    new_power = attributes[1]
    new_speed = attributes[2]
    new_xp_given = attributes[3]
  else
    repetitions = level - 1
    hp = hit_points
    repetitions.times do
      hp = (hp + (hp * 0.07).round)
    end
    new_armor = attributes[0]
    repetitions.times do
      new_armor = (new_armor + (new_armor * 0.05).round)
    end
    new_power = attributes[1]
    repetitions.times do
      new_power = (new_power + (new_power * 0.08).round)
    end
    new_speed = attributes[2]
    repetitions.times do
      new_speed = (new_speed + (new_speed * 0.05).round)
    end
    new_xp_given = attributes[3]
    repetitions.times do
      new_xp_given = (new_xp_given + (new_xp_given * 0.08).round)
    end
  end
  card_type = attributes[4]
  side = attributes[5]
  prestige = attributes[6]
  prestige ||= 1
  skillset = skillset_num
  Card.create(
    name:,
    level:,
    hit_points: hp,
    armor: new_armor,
    power: new_power,
    speed: new_speed,
    experience_given: new_xp_given,
    player: computer,
    unlocked: true,
    card_type:,
    side:,
    prestige:,
    skillset:
  )
end

# ==============================================================================
# == LIGHT CHALLENGES =============================================== 1 to 10 ==
# ==============================================================================
computer = Player.create(name: "Computer", code: "light 1")
card_creator(computer, "Skeleton Warrior", 1, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 1, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 1, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 1, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card = card_creator(computer, "Bone Mender", 1, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 2")
card_creator(computer, "Skeleton Warrior", 2, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 2, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 2, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 2, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card = card_creator(computer, "Bone Mender", 2, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 3")
card_creator(computer, "Skeleton Warrior", 3, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 3, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 3, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 3, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card = card_creator(computer, "Bone Mender", 3, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 4")
card_creator(computer, "Skeleton Warrior", 4, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 4, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 4, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 4, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card = card_creator(computer, "Bone Mender", 4, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 5")
card_creator(computer, "Skeleton Warrior", 5, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 5, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 5, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 5, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card = card_creator(computer, "Bone Mender", 5, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 6")
card_creator(computer, "Skeleton Warrior", 6, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 6, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 6, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 6, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card = card_creator(computer, "Bone Mender", 6, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 7")
card_creator(computer, "Skeleton Warrior", 7, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 7, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 7, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 7, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card = card_creator(computer, "Bone Mender", 7, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 8")
card_creator(computer, "Skeleton Warrior", 8, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 8, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 8, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 8, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 8, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 9")
card_creator(computer, "Skeleton Warrior", 9, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 9, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 9, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 9, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 9, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 10")
card_creator(computer, "Skeleton Warrior", 10, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 10, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 10, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 10, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card_creator(computer, "Mummy", 10, 40, [20, 17, 13, 40, "attacker", "dark"], 3)

# ==============================================================================
# == LIGHT CHALLENGES ============================================== 11 to 20 ==
# ==============================================================================
computer = Player.create(name: "Computer", code: "light 11")
card_creator(computer, "Death Knight", 11, 60, [20, 17, 13, 40, "attacker", "dark"], 3)
card_creator(computer, "Ghoul", 11, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 11, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 11, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 11, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 12")
card_creator(computer, "Skeleton Warrior", 12, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 12, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 12, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Necromancer", 12, 55, [12, 17, 13, 40, "healer", "dark"], 13)
card_creator(computer, "Bone Mender", 12, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 13")
card_creator(computer, "Skeleton Warrior", 13, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 13, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Vampire", 13, 60, [20, 13, 17, 40, "attacker", "dark"], 3)
card_creator(computer, "Plaguebearer", 13, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 13, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 14")
card_creator(computer, "Skeleton Warrior", 14, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Lich", 14, 60, [20, 15, 15, 40, "attacker", "dark"], 3)
card_creator(computer, "Rotting Corpse", 14, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 14, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 14, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 15")
card_creator(computer, "Skeleton Warrior", 15, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 15, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 15, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 15, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 15, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 16")
card_creator(computer, "Skeleton Warrior", 16, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 16, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 16, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 16, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 16, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 17")
card_creator(computer, "Skeleton Warrior", 17, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 17, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 17, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 17, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 17, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 18")
card_creator(computer, "Skeleton Warrior", 18, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 18, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 18, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 18, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 18, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 19")
card_creator(computer, "Skeleton Warrior", 19, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 19, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 19, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 19, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 19, 40, [10, 11, 9, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 20")
card_creator(computer, "Skeleton Warrior", 20, 40, [15, 12, 8, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 20, 40, [15, 8, 12, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 20, 40, [15, 10, 10, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 20, 40, [10, 12, 8, 30, "healer", "dark"], 12)
card_creator(computer, "Mummy", 20, 40, [20, 17, 13, 40, "attacker", "dark"], 3)
