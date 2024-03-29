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
      new_armor = (new_armor + (new_armor * 0.02).round)
    end
    new_power = attributes[1]
    repetitions.times do
      new_power = (new_power + (new_power * 0.08).round)
    end
    new_speed = attributes[2]
    repetitions.times do
      new_speed = (new_speed + (new_speed * 0.02).round)
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
# == PVP BATTLE TEAMS ==========================================================
# ==============================================================================
computer = Player.create(name: "Computer", rank: 15)
card_1 = card_creator(computer, "Crypt Sentinel", 1, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 1, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 1, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 1, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 1, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 15, code: 1)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

computer = Player.create(name: "Computer", rank: 14)
card_1 = card_creator(computer, "Crypt Sentinel", 5, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 5, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 5, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 5, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 5, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 14, code: 2)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

computer = Player.create(name: "Computer", rank: 13)
card_1 = card_creator(computer, "Crypt Sentinel", 10, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 10, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 10, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 10, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 10, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 13, code: 3)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

computer = Player.create(name: "Computer", rank: 12)
card_1 = card_creator(computer, "Crypt Sentinel", 10, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 10, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 10, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 10, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 10, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 12, code: 4)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

computer = Player.create(name: "Computer", rank: 11)
card_1 = card_creator(computer, "Crypt Sentinel", 15, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 15, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 15, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 15, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 15, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 11, code: 5)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

computer = Player.create(name: "Computer", rank: 10)
card_1 = card_creator(computer, "Crypt Sentinel", 25, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 25, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 25, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 25, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 25, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 10, code: 6)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

computer = Player.create(name: "Computer", rank: 9)
card_1 = card_creator(computer, "Crypt Sentinel", 35, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 35, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 35, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 35, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 35, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 9, code: 7)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

computer = Player.create(name: "Computer", rank: 8)
card_1 = card_creator(computer, "Crypt Sentinel", 45, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 45, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 45, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 45, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 45, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 8, code: 8)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

computer = Player.create(name: "Computer", rank: 7)
card_1 = card_creator(computer, "Crypt Sentinel", 50, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 50, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 50, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 50, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 50, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 7, code: 9)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

computer = Player.create(name: "Computer", rank: 6)
card_1 = card_creator(computer, "Crypt Sentinel", 50, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 50, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 50, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 50, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 50, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 6, code: 10)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

computer = Player.create(name: "Computer", rank: 5)
card_1 = card_creator(computer, "Crypt Sentinel", 50, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 50, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 50, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 50, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 50, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 5, code: 11)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

computer = Player.create(name: "Computer", rank: 4)
card_1 = card_creator(computer, "Crypt Sentinel", 50, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 50, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 50, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 50, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 50, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 4, code: 12)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

computer = Player.create(name: "Computer", rank: 3)
card_1 = card_creator(computer, "Crypt Sentinel", 50, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 50, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 50, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 50, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 50, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 3, code: 13)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

computer = Player.create(name: "Computer", rank: 2)
card_1 = card_creator(computer, "Crypt Sentinel", 50, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 50, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 50, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 50, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 50, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 2, code: 14)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

computer = Player.create(name: "Computer", rank: 1)
card_1 = card_creator(computer, "Crypt Sentinel", 50, 135, [1600, 7, 1000, 40, "tank", "dark"], 19)
card_2 = card_creator(computer, "Death Priest", 50, 100, [1000, 12, 1000, 40, "healer", "dark"], 13)
card_3 = card_creator(computer, "Death Weaver", 50, 120, [1400, 22, 1200, 50, "attacker", "dark"], 5)
card_4 = card_creator(computer, "Zombie Brute", 50, 125, [1400, 5, 800, 30, "tank", "dark"], 18)
card_5 = card_creator(computer, "Skeleton Warrior", 50, 100, [1000, 16, 800, 30, "attacker", "dark"], 2)
pvp_battle_team = PvpBattleTeam.create(player: computer, rank: 1, code: 15)
cards = [card_1, card_2, card_3, card_4, card_5]
cards.each do |card|
  PvpBattleCard.create(card:, pvp_battle_team:, hit_points: card.hit_points, armor: card.armor, power: card.power, speed: card.speed, max_hp: card.hit_points)
end

# ==============================================================================
# == LIGHT CHALLENGES =============================================== 1 to 10 ==
# ==============================================================================
computer = Player.create(name: "Computer", code: "light 1")
card_creator(computer, "Skeleton Warrior", 1, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 1, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 1, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 1, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 1, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 2")
card_creator(computer, "Skeleton Warrior", 2, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 2, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 2, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 2, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 2, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 3")
card_creator(computer, "Skeleton Warrior", 3, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 3, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 3, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 3, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 3, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 4")
card_creator(computer, "Skeleton Warrior", 4, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 4, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 4, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 4, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 4, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 5")
card_creator(computer, "Skeleton Warrior", 5, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 5, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 5, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 5, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 5, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 6")
card_creator(computer, "Skeleton Warrior", 6, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 6, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 6, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 6, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 6, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 7")
card_creator(computer, "Skeleton Warrior", 7, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 7, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 7, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 7, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 7, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 8")
card_creator(computer, "Skeleton Warrior", 8, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 8, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 8, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 8, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 8, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 9")
card_creator(computer, "Skeleton Warrior", 9, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 9, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 9, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 9, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 9, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 10")
card_creator(computer, "Skeleton Warrior", 10, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 10, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 10, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 10, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Mummy", 10, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# ==============================================================================
# == LIGHT CHALLENGES ============================================== 11 to 20 ==
# ==============================================================================
computer = Player.create(name: "Computer", code: "light 11")
card_creator(computer, "Death Knight", 11, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Ghoul", 11, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 11, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 11, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 11, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 12")
card_creator(computer, "Skeleton Warrior", 12, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 12, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 12, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Necromancer", 12, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Bone Mender", 12, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 13")
card_creator(computer, "Skeleton Warrior", 13, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 13, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Vampire", 13, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Plaguebearer", 13, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 13, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 14")
card_creator(computer, "Skeleton Warrior", 14, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Lich", 14, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Rotting Corpse", 14, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 14, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 14, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 15")
card_creator(computer, "Skeleton Warrior", 15, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 15, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 15, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 15, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 15, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 16")
card_creator(computer, "Skeleton Warrior", 16, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 16, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 16, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 16, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 16, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 17")
card_creator(computer, "Skeleton Warrior", 17, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 17, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 17, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 17, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 17, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 18")
card_creator(computer, "Skeleton Warrior", 18, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 18, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 18, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 18, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 18, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 19")
card_creator(computer, "Skeleton Warrior", 19, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 19, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 19, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 19, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 19, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 20")
card_creator(computer, "Skeleton Warrior", 20, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 20, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 20, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 20, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Mummy", 20, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# ==============================================================================
# == LIGHT CHALLENGES ============================================== 21 to 30 ==
# ==============================================================================
computer = Player.create(name: "Computer", code: "light 21")
card_creator(computer, "Skeleton Warrior", 21, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 21, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 21, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 21, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 21, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 22")
card_creator(computer, "Skeleton Warrior", 22, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 22, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 22, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 22, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 22, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 23")
card_creator(computer, "Skeleton Warrior", 23, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 23, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 23, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 23, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 23, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 24")
card_creator(computer, "Skeleton Warrior", 24, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 24, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 24, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 24, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 24, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 25")
card_creator(computer, "Skeleton Warrior", 25, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 25, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 25, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 25, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 25, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 26")
card_creator(computer, "Skeleton Warrior", 26, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 26, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 26, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 26, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 26, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 27")
card_creator(computer, "Skeleton Warrior", 27, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 27, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 27, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 27, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 27, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 28")
card_creator(computer, "Skeleton Warrior", 28, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 28, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 28, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 28, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 28, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 29")
card_creator(computer, "Skeleton Warrior", 29, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 29, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 29, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 29, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 29, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 30")
card_creator(computer, "Skeleton Warrior", 30, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 30, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 30, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 30, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Mummy", 30, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# ==============================================================================
# == LIGHT CHALLENGES ============================================== 31 to 40 ==
# ==============================================================================
computer = Player.create(name: "Computer", code: "light 31")
card_creator(computer, "Death Knight", 31, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Ghoul", 31, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 31, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 31, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 31, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 32")
card_creator(computer, "Skeleton Warrior", 32, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 32, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 32, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Necromancer", 32, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Bone Mender", 32, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 33")
card_creator(computer, "Skeleton Warrior", 33, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 33, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Vampire", 33, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Plaguebearer", 33, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 33, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 34")
card_creator(computer, "Skeleton Warrior", 34, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Lich", 34, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Rotting Corpse", 34, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 34, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 34, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 35")
card_creator(computer, "Skeleton Warrior", 35, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 35, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 35, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 35, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 35, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 36")
card_creator(computer, "Skeleton Warrior", 36, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 36, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 36, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 36, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 36, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 37")
card_creator(computer, "Skeleton Warrior", 37, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 37, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 37, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 37, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 37, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 38")
card_creator(computer, "Skeleton Warrior", 38, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 38, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 38, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 38, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 38, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 39")
card_creator(computer, "Skeleton Warrior", 39, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 39, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 39, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 39, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 39, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 40")
card_creator(computer, "Skeleton Warrior", 40, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 40, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 40, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 40, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Mummy", 40, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# ==============================================================================
# == LIGHT CHALLENGES ============================================== 41 to 50 ==
# ==============================================================================
computer = Player.create(name: "Computer", code: "light 41")
card_creator(computer, "Death Knight", 41, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Ghoul", 41, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 41, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 41, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 41, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 42")
card_creator(computer, "Skeleton Warrior", 42, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 42, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 42, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Necromancer", 42, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Bone Mender", 42, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 43")
card_creator(computer, "Skeleton Warrior", 43, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 43, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Vampire", 43, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Plaguebearer", 43, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 43, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 44")
card_creator(computer, "Skeleton Warrior", 44, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Lich", 44, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Rotting Corpse", 44, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 44, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 44, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 45")
card_creator(computer, "Skeleton Warrior", 45, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 45, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 45, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 45, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 45, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 46")
card_creator(computer, "Skeleton Warrior", 46, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 46, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 46, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 46, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 46, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 47")
card_creator(computer, "Skeleton Warrior", 47, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 47, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 47, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 47, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 47, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 48")
card_creator(computer, "Skeleton Warrior", 48, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 48, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 48, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 48, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 48, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 49")
card_creator(computer, "Skeleton Warrior", 49, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 49, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 49, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 49, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Bone Mender", 49, 90, [800, 9, 1000, 30, "healer", "dark"], 12)

computer = Player.create(name: "Computer", code: "light 50")
card_creator(computer, "Skeleton Warrior", 50, 100, [1000, 15, 900, 30, "attacker", "dark"], 1)
card_creator(computer, "Ghoul", 50, 100, [1000, 14, 1000, 30, "attacker", "dark"], 1)
card_creator(computer, "Rotting Corpse", 50, 100, [1000, 16, 800, 30, "attacker", "dark"], 1)
card_creator(computer, "Plaguebearer", 50, 90, [800, 10, 800, 30, "healer", "dark"], 12)
card_creator(computer, "Mummy", 50, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# ==============================================================================
# == DARK CHALLENGES =============================================== 1 to 10 ==
# ==============================================================================
computer = Player.create(name: "Computer", code: "dark 1")
card_creator(computer, "Squire", 1, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 1, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 1, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 1, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 1, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 2")
card_creator(computer, "Squire", 2, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 2, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 2, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 2, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 2, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 3")
card_creator(computer, "Squire", 3, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 3, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 3, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 3, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 3, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 4")
card_creator(computer, "Squire", 4, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 4, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 4, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 4, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 4, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 5")
card_creator(computer, "Squire", 5, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 5, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 5, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 5, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 5, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 6")
card_creator(computer, "Squire", 6, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 6, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 6, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 6, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 6, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 7")
card_creator(computer, "Squire", 7, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 7, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 7, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 7, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 7, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 8")
card_creator(computer, "Squire", 8, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 8, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 8, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 8, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 8, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 9")
card_creator(computer, "Squire", 9, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 9, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 9, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 9, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 9, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 10")
card_creator(computer, "Squire", 10, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 10, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 10, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 10, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Cavalry", 10, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

# ==============================================================================
# == DARK CHALLENGES ============================================== 11 to 20 ==
# ==============================================================================
computer = Player.create(name: "Computer", code: "dark 11")
card_creator(computer, "Swordsman", 11, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Archer", 11, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 11, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 11, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 11, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 12")
card_creator(computer, "Squire", 12, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 12, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 12, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Cleric", 12, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Herbalist", 12, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 13")
card_creator(computer, "Squire", 13, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 13, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Axeman", 13, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priest", 13, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 13, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 14")
card_creator(computer, "Squire", 14, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Marksman", 14, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Crossbowman", 14, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 14, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 14, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 15")
card_creator(computer, "Squire", 15, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 15, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 15, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 15, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 15, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 16")
card_creator(computer, "Squire", 16, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 16, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 16, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 16, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 16, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 17")
card_creator(computer, "Squire", 17, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 17, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 17, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 17, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 17, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 18")
card_creator(computer, "Squire", 18, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 18, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 18, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 18, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 18, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 19")
card_creator(computer, "Squire", 19, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 19, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 19, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 19, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 19, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 20")
card_creator(computer, "Squire", 20, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 20, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 20, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 20, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Cavalry", 20, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

# ==============================================================================
# == DARK CHALLENGES ============================================== 21 to 30 ==
# ==============================================================================
computer = Player.create(name: "Computer", code: "dark 21")
card_creator(computer, "Squire", 21, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 21, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 21, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 21, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 21, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 22")
card_creator(computer, "Squire", 22, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 22, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 22, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 22, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 22, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 23")
card_creator(computer, "Squire", 23, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 23, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 23, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 23, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 23, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 24")
card_creator(computer, "Squire", 24, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 24, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 24, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 24, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 24, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 25")
card_creator(computer, "Squire", 25, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 25, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 25, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 25, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 25, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 26")
card_creator(computer, "Squire", 26, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 26, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 26, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 26, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 26, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 27")
card_creator(computer, "Squire", 27, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 27, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 27, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 27, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 27, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 28")
card_creator(computer, "Squire", 28, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 28, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 28, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 28, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 28, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 29")
card_creator(computer, "Squire", 29, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 29, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 29, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 29, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 29, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 30")
card_creator(computer, "Squire", 30, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 30, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 30, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 30, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Cavalry", 30, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

# ==============================================================================
# == DARK CHALLENGES ============================================== 31 to 40 ==
# ==============================================================================
computer = Player.create(name: "Computer", code: "dark 31")
card_creator(computer, "Swordsman", 31, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Archer", 31, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 31, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 31, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 31, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 32")
card_creator(computer, "Squire", 32, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 32, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 32, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Cleric", 32, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Herbalist", 32, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 33")
card_creator(computer, "Squire", 33, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 33, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Axeman", 33, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priest", 33, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 33, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 34")
card_creator(computer, "Squire", 34, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Marksman", 34, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Crossbowman", 34, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 34, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 34, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 35")
card_creator(computer, "Squire", 35, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 35, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 35, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 35, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 35, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 36")
card_creator(computer, "Squire", 36, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 36, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 36, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 36, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 36, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 37")
card_creator(computer, "Squire", 37, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 37, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 37, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 37, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 37, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 38")
card_creator(computer, "Squire", 38, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 38, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 38, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 38, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 38, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 39")
card_creator(computer, "Squire", 39, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 39, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 39, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 39, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 39, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 40")
card_creator(computer, "Squire", 40, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 40, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 40, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 40, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Cavalry", 40, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

# ==============================================================================
# == DARK CHALLENGES ============================================== 41 to 50 ==
# ==============================================================================
computer = Player.create(name: "Computer", code: "dark 41")
card_creator(computer, "Swordsman", 41, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Archer", 41, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 41, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 41, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 41, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 42")
card_creator(computer, "Squire", 42, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 42, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 42, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Cleric", 42, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Herbalist", 42, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 43")
card_creator(computer, "Squire", 43, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 43, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Axeman", 43, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priest", 43, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 43, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 44")
card_creator(computer, "Squire", 44, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Marksman", 44, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Crossbowman", 44, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 44, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 44, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 45")
card_creator(computer, "Squire", 45, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 45, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 45, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 45, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 45, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 46")
card_creator(computer, "Squire", 46, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 46, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 46, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 46, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 46, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 47")
card_creator(computer, "Squire", 47, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 47, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 47, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 47, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 47, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 48")
card_creator(computer, "Squire", 48, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 48, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 48, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 48, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 48, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 49")
card_creator(computer, "Squire", 49, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 49, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 49, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 49, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Herbalist", 49, 90, [800, 9, 1000, 30, "healer", "light"], 12)

computer = Player.create(name: "Computer", code: "dark 50")
card_creator(computer, "Squire", 50, 100, [1000, 15, 900, 30, "attacker", "light"], 1)
card_creator(computer, "Archer", 50, 100, [1000, 14, 1000, 30, "attacker", "light"], 1)
card_creator(computer, "Crossbowman", 50, 100, [1000, 16, 800, 30, "attacker", "light"], 1)
card_creator(computer, "Priest", 50, 90, [800, 10, 800, 30, "healer", "light"], 12)
card_creator(computer, "Cavalry", 50, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

# ////////////////////////////////////////////////////////////////////
# CHALLENGES STRONG HUMAN
# ///////////////////////////////////////////////////////////////////
# PALADIN
computer = Player.create(name: "Computer", code: "epic Paladin 1")
card_creator(computer, "Lich", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 46, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 46, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 46, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Paladin 2")
card_creator(computer, "Lich", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 47, 115, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 47, 115, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 47, 105, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Paladin 3")
card_creator(computer, "Lich", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 48, 120, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 48, 120, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 48, 110, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Paladin 4")
card_creator(computer, "Lich", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 49, 125, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 49, 125, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 49, 115, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Paladin 5")
card_creator(computer, "Lich", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 50, 130, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 50, 130, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 50, 120, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# BERSERKER
computer = Player.create(name: "Computer", code: "epic Berserker 1")
card_creator(computer, "Lich", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 46, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 46, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 46, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Berserker 2")
card_creator(computer, "Lich", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 47, 115, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 47, 115, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 47, 105, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Berserker 3")
card_creator(computer, "Lich", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 48, 120, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 48, 120, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 48, 110, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Berserker 4")
card_creator(computer, "Lich", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 49, 125, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 49, 125, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 49, 115, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Berserker 5")
card_creator(computer, "Lich", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 50, 130, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 50, 130, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 50, 120, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# KNIGHT
computer = Player.create(name: "Computer", code: "epic Knight 1")
card_creator(computer, "Lich", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 46, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 46, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 46, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Knight 2")
card_creator(computer, "Lich", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 47, 115, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 47, 115, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 47, 105, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Knight 3")
card_creator(computer, "Lich", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 48, 120, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 48, 120, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 48, 110, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Knight 4")
card_creator(computer, "Lich", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 49, 125, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 49, 125, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 49, 115, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Knight 5")
card_creator(computer, "Lich", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 50, 130, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 50, 130, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 50, 120, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# MAGE
computer = Player.create(name: "Computer", code: "epic Mage 1")
card_creator(computer, "Lich", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 46, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 46, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 46, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Mage 2")
card_creator(computer, "Lich", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 47, 115, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 47, 115, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 47, 105, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Mage 3")
card_creator(computer, "Lich", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 48, 120, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 48, 120, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 48, 110, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Mage 4")
card_creator(computer, "Lich", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 49, 125, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 49, 125, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 49, 115, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Mage 5")
card_creator(computer, "Lich", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 50, 130, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 50, 130, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 50, 120, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# CAPTAIN
computer = Player.create(name: "Computer", code: "epic Captain 1")
card_creator(computer, "Lich", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 46, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 46, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 46, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Captain 2")
card_creator(computer, "Lich", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 47, 115, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 47, 115, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 47, 105, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Captain 3")
card_creator(computer, "Lich", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 48, 120, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 48, 120, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 48, 110, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Captain 4")
card_creator(computer, "Lich", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 49, 125, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 49, 125, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 49, 115, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Captain 5")
card_creator(computer, "Lich", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 50, 130, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 50, 130, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 50, 120, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# COMMANDER
computer = Player.create(name: "Computer", code: "epic Commander 1")
card_creator(computer, "Lich", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 46, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 46, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 46, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Commander 2")
card_creator(computer, "Lich", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 47, 115, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 47, 115, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 47, 105, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Commander 3")
card_creator(computer, "Lich", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 48, 120, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 48, 120, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 48, 110, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Commander 4")
card_creator(computer, "Lich", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 49, 125, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 49, 125, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 49, 115, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Commander 5")
card_creator(computer, "Lich", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 50, 130, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 50, 130, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 50, 120, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# HIGH PRIEST
computer = Player.create(name: "Computer", code: "epic High Priest 1")
card_creator(computer, "Lich", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 46, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 46, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 46, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic High Priest 2")
card_creator(computer, "Lich", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 47, 115, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 47, 115, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 47, 105, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic High Priest 3")
card_creator(computer, "Lich", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 48, 120, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 48, 120, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 48, 110, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic High Priest 4")
card_creator(computer, "Lich", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 49, 125, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 49, 125, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 49, 115, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic High Priest 5")
card_creator(computer, "Lich", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 50, 130, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 50, 130, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 50, 120, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# BATTLE MEDIC
computer = Player.create(name: "Computer", code: "epic Battle Medic 1")
card_creator(computer, "Lich", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 46, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 46, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 46, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Battle Medic 2")
card_creator(computer, "Lich", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 47, 115, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 47, 115, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 47, 105, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Battle Medic 3")
card_creator(computer, "Lich", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 48, 120, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 48, 120, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 48, 110, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Battle Medic 4")
card_creator(computer, "Lich", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 49, 125, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 49, 125, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 49, 115, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Battle Medic 5")
card_creator(computer, "Lich", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 50, 130, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 50, 130, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 50, 120, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# JUGGERNAUT
computer = Player.create(name: "Computer", code: "epic Juggernaut 1")
card_creator(computer, "Lich", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 46, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 46, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 46, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Juggernaut 2")
card_creator(computer, "Lich", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 47, 115, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 47, 115, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 47, 105, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Juggernaut 3")
card_creator(computer, "Lich", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 48, 120, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 48, 120, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 48, 110, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Juggernaut 4")
card_creator(computer, "Lich", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 49, 125, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 49, 125, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 49, 115, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Juggernaut 5")
card_creator(computer, "Lich", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 50, 130, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 50, 130, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 50, 120, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# WARDEN
computer = Player.create(name: "Computer", code: "epic Warden 1")
card_creator(computer, "Lich", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 46, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 46, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 46, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Warden 2")
card_creator(computer, "Lich", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 47, 115, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 47, 115, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 47, 105, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Warden 3")
card_creator(computer, "Lich", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 48, 120, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 48, 120, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 48, 110, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Warden 4")
card_creator(computer, "Lich", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 49, 125, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 49, 125, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 49, 115, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Warden 5")
card_creator(computer, "Lich", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 50, 130, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 50, 130, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 50, 120, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Mummy", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# KING
computer = Player.create(name: "Computer", code: "epic King 1")
card_creator(computer, "Lich", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 46, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 46, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 46, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Grave Lord", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic King 2")
card_creator(computer, "Lich", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 47, 115, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 47, 115, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 47, 105, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Grave Lord", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic King 3")
card_creator(computer, "Lich", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 48, 120, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 48, 120, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 48, 110, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Grave Lord", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic King 4")
card_creator(computer, "Lich", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 49, 125, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 49, 125, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 49, 115, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Grave Lord", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic King 5")
card_creator(computer, "Lich", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 50, 130, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 50, 130, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 50, 120, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Grave Lord", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# QUEEN
computer = Player.create(name: "Computer", code: "epic Queen 1")
card_creator(computer, "Lich", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 46, 110, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 46, 110, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 46, 100, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Lich King", 46, 110, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Queen 2")
card_creator(computer, "Lich", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 47, 115, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 47, 115, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 47, 105, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Lich King", 47, 115, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Queen 3")
card_creator(computer, "Lich", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 48, 120, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 48, 120, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 48, 110, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Lich King", 48, 120, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Queen 4")
card_creator(computer, "Lich", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 49, 125, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 49, 125, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 49, 115, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Lich King", 49, 125, [1200, 19, 1000, 40, "attacker", "dark"], 3)

computer = Player.create(name: "Computer", code: "epic Queen 5")
card_creator(computer, "Lich", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)
card_creator(computer, "Death Knight", 50, 130, [1200, 17, 1200, 40, "attacker", "dark"], 3)
card_creator(computer, "Vampire", 50, 130, [1200, 18, 1100, 40, "attacker", "dark"], 3)
card_creator(computer, "Necromancer", 50, 120, [1200, 17, 1300, 40, "healer", "dark"], 13)
card_creator(computer, "Lich King", 50, 130, [1200, 19, 1000, 40, "attacker", "dark"], 3)

# ////////////////////////////////////////////////////////////////////
# CHALLENGES STRONG UNDEAD
# ///////////////////////////////////////////////////////////////////
# REVENANT
computer = Player.create(name: "Computer", code: "epic Revenant 1")
card_creator(computer, "Marksman", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 46, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 46, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 46, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Revenant 2")
card_creator(computer, "Marksman", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 47, 115, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 47, 115, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 47, 105, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Revenant 3")
card_creator(computer, "Marksman", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 48, 120, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 48, 120, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 48, 110, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Revenant 4")
card_creator(computer, "Marksman", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 49, 125, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 49, 125, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 49, 115, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Revenant 5")
card_creator(computer, "Marksman", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 50, 130, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 50, 130, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 50, 120, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)

# Death Weaver
computer = Player.create(name: "Computer", code: "epic Death Weaver 1")
card_creator(computer, "Marksman", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 46, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 46, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 46, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Death Weaver 2")
card_creator(computer, "Marksman", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 47, 115, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 47, 115, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 47, 105, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Death Weaver 3")
card_creator(computer, "Marksman", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 48, 120, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 48, 120, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 48, 110, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Death Weaver 4")
card_creator(computer, "Marksman", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 49, 125, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 49, 125, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 49, 115, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Death Weaver 5")
card_creator(computer, "Marksman", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 50, 130, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 50, 130, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 50, 120, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)

# BONE GOLEM
computer = Player.create(name: "Computer", code: "epic Bone Golem 1")
card_creator(computer, "Marksman", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 46, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 46, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 46, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Bone Golem 2")
card_creator(computer, "Marksman", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 47, 115, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 47, 115, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 47, 105, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Bone Golem 3")
card_creator(computer, "Marksman", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 48, 120, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 48, 120, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 48, 110, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Bone Golem 4")
card_creator(computer, "Marksman", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 49, 125, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 49, 125, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 49, 115, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Bone Golem 5")
card_creator(computer, "Marksman", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 50, 130, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 50, 130, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 50, 120, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)

# Wight
computer = Player.create(name: "Computer", code: "epic Wight 1")
card_creator(computer, "Marksman", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 46, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 46, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 46, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Wight 2")
card_creator(computer, "Marksman", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 47, 115, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 47, 115, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 47, 105, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Wight 3")
card_creator(computer, "Marksman", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 48, 120, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 48, 120, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 48, 110, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Wight 4")
card_creator(computer, "Marksman", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 49, 125, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 49, 125, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 49, 115, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Wight 5")
card_creator(computer, "Marksman", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 50, 130, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 50, 130, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 50, 120, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)

# Necrophage
computer = Player.create(name: "Computer", code: "epic Necrophage 1")
card_creator(computer, "Marksman", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 46, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 46, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 46, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Necrophage 2")
card_creator(computer, "Marksman", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 47, 115, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 47, 115, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 47, 105, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Necrophage 3")
card_creator(computer, "Marksman", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 48, 120, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 48, 120, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 48, 110, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Necrophage 4")
card_creator(computer, "Marksman", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 49, 125, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 49, 125, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 49, 115, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Necrophage 5")
card_creator(computer, "Marksman", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 50, 130, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 50, 130, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 50, 120, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)

# Bone Dragon
computer = Player.create(name: "Computer", code: "epic Bone Dragon 1")
card_creator(computer, "Marksman", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 46, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 46, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 46, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Bone Dragon 2")
card_creator(computer, "Marksman", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 47, 115, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 47, 115, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 47, 105, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Bone Dragon 3")
card_creator(computer, "Marksman", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 48, 120, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 48, 120, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 48, 110, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Bone Dragon 4")
card_creator(computer, "Marksman", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 49, 125, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 49, 125, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 49, 115, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Bone Dragon 5")
card_creator(computer, "Marksman", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 50, 130, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 50, 130, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 50, 120, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)

# Lich Healer
computer = Player.create(name: "Computer", code: "epic Lich Healer 1")
card_creator(computer, "Marksman", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 46, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 46, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 46, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Lich Healer 2")
card_creator(computer, "Marksman", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 47, 115, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 47, 115, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 47, 105, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Lich Healer 3")
card_creator(computer, "Marksman", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 48, 120, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 48, 120, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 48, 110, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Lich Healer 4")
card_creator(computer, "Marksman", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 49, 125, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 49, 125, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 49, 115, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Lich Healer 5")
card_creator(computer, "Marksman", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 50, 130, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 50, 130, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 50, 120, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)

# Crypt Keeper
computer = Player.create(name: "Computer", code: "epic Crypt Keeper 1")
card_creator(computer, "Marksman", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 46, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 46, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 46, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Crypt Keeper 2")
card_creator(computer, "Marksman", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 47, 115, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 47, 115, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 47, 105, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Crypt Keeper 3")
card_creator(computer, "Marksman", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 48, 120, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 48, 120, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 48, 110, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Crypt Keeper 4")
card_creator(computer, "Marksman", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 49, 125, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 49, 125, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 49, 115, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Crypt Keeper 5")
card_creator(computer, "Marksman", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 50, 130, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 50, 130, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 50, 120, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)

# Wight Juggernaut
computer = Player.create(name: "Computer", code: "epic Wight Juggernaut 1")
card_creator(computer, "Marksman", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 46, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 46, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 46, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Wight Juggernaut 2")
card_creator(computer, "Marksman", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 47, 115, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 47, 115, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 47, 105, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Wight Juggernaut 3")
card_creator(computer, "Marksman", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 48, 120, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 48, 120, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 48, 110, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Wight Juggernaut 4")
card_creator(computer, "Marksman", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 49, 125, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 49, 125, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 49, 115, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Wight Juggernaut 5")
card_creator(computer, "Marksman", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 50, 130, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 50, 130, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 50, 120, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)

# Spectral Guardian
computer = Player.create(name: "Computer", code: "epic Spectral Guardian 1")
card_creator(computer, "Marksman", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 46, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 46, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 46, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Spectral Guardian 2")
card_creator(computer, "Marksman", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 47, 115, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 47, 115, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 47, 105, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Spectral Guardian 3")
card_creator(computer, "Marksman", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 48, 120, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 48, 120, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 48, 110, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Spectral Guardian 4")
card_creator(computer, "Marksman", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 49, 125, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 49, 125, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 49, 115, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Spectral Guardian 5")
card_creator(computer, "Marksman", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 50, 130, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 50, 130, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 50, 120, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Cavalry", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)

# Lich King
computer = Player.create(name: "Computer", code: "epic Lich King 1")
card_creator(computer, "Marksman", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 46, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 46, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 46, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Queen", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Lich King 2")
card_creator(computer, "Marksman", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 47, 115, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 47, 115, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 47, 105, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Queen", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Lich King 3")
card_creator(computer, "Marksman", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 48, 120, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 48, 120, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 48, 110, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Queen", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Lich King 4")
card_creator(computer, "Marksman", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 49, 125, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 49, 125, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 49, 115, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Queen", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Lich King 5")
card_creator(computer, "Marksman", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 50, 130, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 50, 130, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 50, 120, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "Queen", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)

# Grave Lord
computer = Player.create(name: "Computer", code: "epic Grave Lord 1")
card_creator(computer, "Marksman", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 46, 110, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 46, 110, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 46, 100, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "King", 46, 110, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Grave Lord 2")
card_creator(computer, "Marksman", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 47, 115, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 47, 115, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 47, 105, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "King", 47, 115, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Grave Lord 3")
card_creator(computer, "Marksman", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 48, 120, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 48, 120, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 48, 110, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "King", 48, 120, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Grave Lord 4")
card_creator(computer, "Marksman", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 49, 125, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 49, 125, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 49, 115, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "King", 49, 125, [1200, 19, 1000, 40, "attacker", "light"], 3)

computer = Player.create(name: "Computer", code: "epic Grave Lord 5")
card_creator(computer, "Marksman", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)
card_creator(computer, "Swordsman", 50, 130, [1200, 17, 1200, 40, "attacker", "light"], 3)
card_creator(computer, "Axeman", 50, 130, [1200, 18, 1100, 40, "attacker", "light"], 3)
card_creator(computer, "Priestess", 50, 120, [1200, 17, 1300, 40, "healer", "light"], 13)
card_creator(computer, "King", 50, 130, [1200, 19, 1000, 40, "attacker", "light"], 3)
