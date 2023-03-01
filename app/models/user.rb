class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :player

  after_create :create_player

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def create_player
    player = Player.create(name: "New Player", user: self)
    create_cards(player)
    create_challenges(player)
  end

  def create_cards(player)
    # Attributes Attackers
    attr_weak_slow = {
      hit_points: 50,
      card_type: "attacker",
      armor: 15,
      power: 12,
      speed: 8,
      player:
    }
    attr_weak_normal = {
      hit_points: 50,
      card_type: "attacker",
      armor: 15,
      power: 10,
      speed: 10,
      player:
    }
    attr_weak_quick = {
      hit_points: 50,
      card_type: "attacker",
      armor: 15,
      power: 8,
      speed: 12,
      player:
    }
    attr_normal_slow = {
      hit_points: 60,
      card_type: "attacker",
      armor: 20,
      power: 17,
      speed: 13,
      player:,
      experience_given: 40
    }
    attr_normal_normal = {
      hit_points: 60,
      card_type: "attacker",
      armor: 20,
      power: 15,
      speed: 15,
      player:,
      experience_given: 40
    }
    attr_normal_quick = {
      hit_points: 60,
      card_type: "attacker",
      armor: 20,
      power: 13,
      speed: 17,
      player:,
      experience_given: 40
    }
    attr_strong_slow = {
      hit_points: 70,
      card_type: "attacker",
      armor: 23,
      power: 20,
      speed: 16,
      player:,
      experience_given: 50
    }
    attr_strong_normal = {
      hit_points: 70,
      card_type: "attacker",
      armor: 23,
      power: 18,
      speed: 18,
      player:,
      experience_given: 50
    }
    attr_strong_quick = {
      hit_points: 70,
      card_type: "attacker",
      armor: 23,
      power: 16,
      speed: 20,
      player:,
      experience_given: 50
    }
    attr_elite_slow = {
      hit_points: 80,
      card_type: "attacker",
      armor: 25,
      power: 22,
      speed: 18,
      player:,
      experience_given: 60
    }
    attr_elite_quick = {
      hit_points: 80,
      card_type: "attacker",
      armor: 25,
      power: 18,
      speed: 22,
      player:,
      experience_given: 60
    }
    # Attributes Healers
    weak_heal_s = {
      hit_points: 45,
      card_type: "healer",
      armor: 10,
      power: 12,
      speed: 8,
      player:
    }
    weak_heal_q = {
      hit_points: 45,
      card_type: "healer",
      armor: 10,
      power: 11,
      speed: 9,
      player:
    }
    normal_heal_s = {
      hit_points: 55,
      card_type: "healer",
      armor: 12,
      power: 17,
      speed: 13,
      player:,
      experience_given: 40
    }
    normal_heal_q = {
      hit_points: 55,
      card_type: "healer",
      armor: 12,
      power: 16,
      speed: 14,
      player:,
      experience_given: 40
    }
    strong_heal_s = {
      hit_points: 65,
      card_type: "healer",
      armor: 15,
      power: 20,
      speed: 16,
      player:,
      experience_given: 50
    }
    strong_heal_q = {
      hit_points: 65,
      card_type: "healer",
      armor: 15,
      power: 16,
      speed: 20,
      player:,
      experience_given: 50
    }
    # Attributes Tanks
    weak_tank_s = {
      hit_points: 60,
      card_type: "tank",
      armor: 20,
      power: 5,
      speed: 8,
      player:
    }
    weak_tank_q = {
      hit_points: 60,
      card_type: "tank",
      armor: 20,
      power: 4,
      speed: 9,
      player:
    }
    normal_tank_s = {
      hit_points: 70,
      card_type: "tank",
      armor: 22,
      power: 8,
      speed: 10,
      player:,
      experience_given: 40
    }
    normal_tank_q = {
      hit_points: 70,
      card_type: "tank",
      armor: 22,
      power: 7,
      speed: 11,
      player:,
      experience_given: 40
    }
    strong_tank_s = {
      hit_points: 78,
      card_type: "tank",
      armor: 25,
      power: 12,
      speed: 13,
      player:,
      experience_given: 50
    }
    strong_tank_q = {
      hit_points: 78,
      card_type: "tank",
      armor: 25,
      power: 11,
      speed: 14,
      player:,
      experience_given: 50
    }

    Card.create(
      [
        # HUMAN ATTACKER CARDS
        # WEAK
        { name: "Squire", side: "light", cat: "weak", unlocked: true, prestige: 1, next_prestige: 25, skillset: 1 }.merge(attr_weak_slow),
        { name: "Crossbowman", side: "light", cat: "weak", unlocked: true, prestige: 1, next_prestige: 25, skillset: 2 }.merge(attr_weak_slow),
        { name: "Militia", side: "light", cat: "weak", unlocked: true, prestige: 1, next_prestige: 25, skillset: 1 }.merge(attr_weak_normal),
        { name: "Footman", side: "light", cat: "weak", unlocked: true, prestige: 1, next_prestige: 25, skillset: 2 }.merge(attr_weak_normal),
        { name: "Archer", side: "light", cat: "weak", unlocked: true, prestige: 1, next_prestige: 25, skillset: 1 }.merge(attr_weak_quick),
        { name: "Scout", side: "light", cat: "weak", skillset: 2 }.merge(attr_weak_quick),
        # NORMAL
        { name: "Swordsman", side: "light", cat: "normal", skillset: 1 }.merge(attr_normal_slow),
        { name: "Axeman", side: "light", cat: "normal", skillset: 3 }.merge(attr_normal_slow),
        { name: "Spearman", side: "light", cat: "normal", skillset: 1 }.merge(attr_normal_normal),
        { name: "Mage Apprentice", side: "light", cat: "normal", skillset: 3 }.merge(attr_normal_normal),
        { name: "Cavalry", side: "light", cat: "normal", skillset: 1 }.merge(attr_normal_quick),
        { name: "Marksman", side: "light", cat: "normal", skillset: 3 }.merge(attr_normal_quick),
        # STRONG
        { name: "Paladin", side: "light", cat: "strong", skillset: 4 }.merge(attr_strong_slow),
        { name: "Berserker", side: "light", cat: "strong", skillset: 5 }.merge(attr_strong_slow),
        { name: "Knight", side: "light", cat: "strong", skillset: 6 }.merge(attr_strong_normal),
        { name: "Mage", side: "light", cat: "strong", skillset: 7 }.merge(attr_strong_normal),
        { name: "Captain", side: "light", cat: "strong", skillset: 8 }.merge(attr_strong_quick),
        { name: "Commander", side: "light", cat: "strong", skillset: 9 }.merge(attr_strong_quick),
        # ELITE
        { name: "King", side: "light", cat: "elite", skillset: 10 }.merge(attr_elite_slow),
        { name: "Queen", side: "light", cat: "elite", skillset: 11 }.merge(attr_elite_quick),
        # HUMAN HEALER CARDS
        # WEAK
        { name: "Priest", side: "light", cat: "weak", skillset: 12 }.merge(weak_heal_s),
        { name: "Herbalist", side: "light", cat: "weak", skillset: 12 }.merge(weak_heal_s),
        { name: "Medic", side: "light", cat: "weak", skillset: 12 }.merge(weak_heal_q),
        { name: "Acolyte", side: "light", cat: "weak", skillset: 12 }.merge(weak_heal_q),
        # NORMAL
        { name: "Priestess", side: "light", cat: "normal", skillset: 13 }.merge(normal_heal_s),
        { name: "Cleric", side: "light", cat: "normal", skillset: 13 }.merge(normal_heal_s),
        { name: "Alchemist", side: "light", cat: "normal", skillset: 13 }.merge(normal_heal_q),
        { name: "Druid", side: "light", cat: "normal", skillset: 13 }.merge(normal_heal_q),
        # STRONG
        { name: "High Priest", side: "light", cat: "strong", skillset: 15 }.merge(strong_heal_s),
        { name: "Battle Medic", side: "light", cat: "strong", skillset: 17 }.merge(strong_heal_q),
        # HUMAN TANK CARDS
        # WEAK
        { name: "Shieldbearer", side: "light", cat: "weak", skillset: 18 }.merge(weak_tank_s),
        { name: "Brute", side: "light", cat: "weak", skillset: 18 }.merge(weak_tank_q),
        # NORMAL
        { name: "Guardian", side: "light", cat: "normal", skillset: 19 }.merge(normal_tank_s),
        { name: "Crusader", side: "light", cat: "normal", skillset: 19 }.merge(normal_tank_q),
        # STRONG
        { name: "Juggernaut", side: "light", cat: "strong", skillset: 20 }.merge(strong_tank_s),
        { name: "Warden", side: "light", cat: "strong", skillset: 21 }.merge(strong_tank_q),

        # UNDEAD ATTACKER CARDS
        # WEAK
        { name: "Skeleton Warrior", side: "dark", cat: "weak", unlocked: true, prestige: 1, next_prestige: 25, skillset: 1 }.merge(attr_weak_slow),
        { name: "Zombie", side: "dark", cat: "weak", unlocked: true, prestige: 1, next_prestige: 25, skillset: 2 }.merge(attr_weak_slow),
        { name: "Rotting Corpse", side: "dark", cat: "weak", unlocked: true, prestige: 1, next_prestige: 25, skillset: 1 }.merge(attr_weak_normal),
        { name: "Wraith", side: "dark", cat: "weak", unlocked: true, prestige: 1, next_prestige: 25, skillset: 2 }.merge(attr_weak_normal),
        { name: "Skeletal Archer", side: "dark", cat: "weak", unlocked: true, prestige: 1, next_prestige: 25, skillset: 1}.merge(attr_weak_quick),
        { name: "Ghoul", side: "dark", cat: "weak", skillset: 2 }.merge(attr_weak_quick),
        # NORMAL
        { name: "Death Knight", side: "dark", cat: "normal", skillset: 1 }.merge(attr_normal_slow),
        { name: "Mummy", side: "dark", cat: "normal", skillset: 3 }.merge(attr_normal_slow),
        { name: "Specter", side: "dark", cat: "normal", skillset: 1 }.merge(attr_normal_normal),
        { name: "Lich", side: "dark", cat: "normal", skillset: 3 }.merge(attr_normal_normal),
        { name: "Banshee", side: "dark", cat: "normal", skillset: 1 }.merge(attr_normal_quick),
        { name: "Vampire", side: "dark", cat: "normal", skillset: 3 }.merge(attr_normal_quick),
        # STRONG
        { name: "Bone Golem", side: "dark", cat: "strong", skillset: 4 }.merge(attr_strong_slow),
        { name: "Bone Dragon", side: "dark", cat: "strong", skillset: 5 }.merge(attr_strong_slow),
        { name: "Revenant", side: "dark", cat: "strong", skillset: 6 }.merge(attr_strong_normal),
        { name: "Death Weaver", side: "dark", cat: "strong", skillset: 7 }.merge(attr_strong_normal),
        { name: "Wight", side: "dark", cat: "strong", skillset: 8 }.merge(attr_strong_quick),
        { name: "Necrophage", side: "dark", cat: "strong", skillset: 9 }.merge(attr_strong_quick),
        # ELITE
        { name: "Grave Lord", side: "dark", cat: "elite", skillset: 10 }.merge(attr_elite_slow),
        { name: "Lich King", side: "dark", cat: "elite", skillset: 11 }.merge(attr_elite_quick),
        # UNDEAD HEALER CARDS
        # WEAK
        { name: "Necromancer Acolyte", side: "dark", cat: "weak", skillset: 12 }.merge(weak_heal_s),
        { name: "Plaguebearer", side: "dark", cat: "weak", skillset: 12 }.merge(weak_heal_s),
        { name: "Graveyard Wisp", side: "dark", cat: "weak", skillset: 12 }.merge(weak_heal_q),
        { name: "Bone Mender", side: "dark", cat: "weak", skillset: 12 }.merge(weak_heal_q),
        # NORMAL
        { name: "Necromancer", side: "dark", cat: "normal", skillset: 13 }.merge(normal_heal_s),
        { name: "Plague Doctor", side: "dark", cat: "normal", skillset: 13 }.merge(normal_heal_s),
        { name: "Death Priest", side: "dark", cat: "normal", skillset: 13 }.merge(normal_heal_q),
        { name: "Bone Weaver", side: "dark", cat: "normal", skillset: 13 }.merge(normal_heal_q),
        # STRONG
        { name: "Inferior Lich", side: "dark", cat: "strong", skillset: 14 }.merge(strong_heal_s),
        { name: "Crypt Keeper", side: "dark", cat: "strong", skillset: 16 }.merge(strong_heal_q),
        # UNDEAD TANK CARDS
        # WEAK
        { name: "Skeleton Shieldbearer", side: "dark", cat: "weak", skillset: 18 }.merge(weak_tank_s),
        { name: "Zombie Brute", side: "dark", cat: "weak", skillset: 18 }.merge(weak_tank_q),
        # NORMAL
        { name: "Crypt Sentinel", side: "dark", cat: "normal", skillset: 19 }.merge(normal_tank_s),
        { name: "Mummy Guardian", side: "dark", cat: "normal", skillset: 19 }.merge(normal_tank_q),
        # STRONG
        { name: "Wight Juggernaut", side: "dark", cat: "strong", skillset: 20 }.merge(strong_tank_s),
        { name: "Spectral Guardian", side: "dark", cat: "strong", skillset: 21 }.merge(strong_tank_q)
      ]
    )
  end

  def create_challenges(player)
    attr_light_one = { category: "light", player:, reward: 5, shards: "weak" }
    attr_light_two = { category: "light", player:, reward: 10, shards: "normal" }
    attr_light_three = { category: "light", player:, reward: 15, shards: "strong" }

    attr_dark_one = { category: "dark", player:, reward: 5, shards: "weak" }
    attr_dark_two = { category: "dark", player:, reward: 10, shards: "normal" }
    attr_dark_three = { category: "dark", player:, reward: 15, shards: "strong" }

    Challenge.create(
      [
        { computer: Player.where(code: "light 1").first, rank: 1, unlocked: true }.merge(attr_light_one),
        { computer: Player.where(code: "light 2").first, rank: 2 }.merge(attr_light_one),
        { computer: Player.where(code: "light 3").first, rank: 3 }.merge(attr_light_one),
        { computer: Player.where(code: "light 4").first, rank: 4 }.merge(attr_light_one),
        { computer: Player.where(code: "light 5").first, rank: 5 }.merge(attr_light_one),
        { computer: Player.where(code: "light 6").first, rank: 6 }.merge(attr_light_one),
        { computer: Player.where(code: "light 7").first, rank: 7 }.merge(attr_light_one),
        { computer: Player.where(code: "light 8").first, rank: 8 }.merge(attr_light_one),
        { computer: Player.where(code: "light 9").first, rank: 9 }.merge(attr_light_one),
        { computer: Player.where(code: "light 10").first, rank: 10 }.merge(attr_light_two),
        { computer: Player.where(code: "light 11").first, rank: 11 }.merge(attr_light_one),
        { computer: Player.where(code: "light 12").first, rank: 12 }.merge(attr_light_one),
        { computer: Player.where(code: "light 13").first, rank: 13 }.merge(attr_light_one),
        { computer: Player.where(code: "light 14").first, rank: 14 }.merge(attr_light_one),
        { computer: Player.where(code: "light 15").first, rank: 15 }.merge(attr_light_two),
        { computer: Player.where(code: "light 16").first, rank: 16 }.merge(attr_light_two),
        { computer: Player.where(code: "light 17").first, rank: 17 }.merge(attr_light_two),
        { computer: Player.where(code: "light 18").first, rank: 18 }.merge(attr_light_two),
        { computer: Player.where(code: "light 19").first, rank: 19 }.merge(attr_light_two),
        { computer: Player.where(code: "light 20").first, rank: 20 }.merge(attr_light_three),
        # DARK CHALLENGES
        { computer: Player.where(code: "dark 1").first, rank: 1 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 2").first, rank: 2 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 3").first, rank: 3 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 4").first, rank: 4 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 5").first, rank: 5 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 6").first, rank: 6 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 7").first, rank: 7 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 8").first, rank: 8 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 9").first, rank: 9 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 10").first, rank: 10 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 11").first, rank: 11 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 12").first, rank: 12 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 13").first, rank: 13 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 14").first, rank: 14 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 15").first, rank: 15 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 16").first, rank: 16 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 17").first, rank: 17 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 18").first, rank: 18 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 19").first, rank: 19 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 20").first, rank: 20 }.merge(attr_dark_three)
      ]
    )
  end
end
