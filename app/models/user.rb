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
      hit_points: 100,
      card_type: "attacker",
      armor: 10,
      power: 16,
      speed: 8,
      player:
    }
    attr_weak_normal = {
      hit_points: 100,
      card_type: "attacker",
      armor: 10,
      power: 15,
      speed: 9,
      player:
    }
    attr_weak_quick = {
      hit_points: 100,
      card_type: "attacker",
      armor: 10,
      power: 14,
      speed: 10,
      player:
    }
    attr_normal_slow = {
      hit_points: 110,
      card_type: "attacker",
      armor: 12,
      power: 19,
      speed: 10,
      player:,
      experience_given: 40
    }
    attr_normal_normal = {
      hit_points: 110,
      card_type: "attacker",
      armor: 12,
      power: 18,
      speed: 11,
      player:,
      experience_given: 40
    }
    attr_normal_quick = {
      hit_points: 110,
      card_type: "attacker",
      armor: 12,
      power: 17,
      speed: 12,
      player:,
      experience_given: 40
    }
    attr_strong_slow = {
      hit_points: 120,
      card_type: "attacker",
      armor: 14,
      power: 22,
      speed: 12,
      player:,
      experience_given: 50
    }
    attr_strong_normal = {
      hit_points: 120,
      card_type: "attacker",
      armor: 14,
      power: 21,
      speed: 13,
      player:,
      experience_given: 50
    }
    attr_strong_quick = {
      hit_points: 120,
      card_type: "attacker",
      armor: 14,
      power: 20,
      speed: 14,
      player:,
      experience_given: 50
    }
    attr_elite_slow = {
      hit_points: 125,
      card_type: "attacker",
      armor: 14,
      power: 24,
      speed: 14,
      player:,
      experience_given: 60
    }
    attr_elite_quick = {
      hit_points: 125,
      card_type: "attacker",
      armor: 14,
      power: 23,
      speed: 15,
      player:,
      experience_given: 60
    }
    # Attributes Healers
    weak_heal_s = {
      hit_points: 90,
      card_type: "healer",
      armor: 8,
      power: 10,
      speed: 8,
      player:
    }
    weak_heal_q = {
      hit_points: 90,
      card_type: "healer",
      armor: 8,
      power: 9,
      speed: 10,
      player:
    }
    normal_heal_s = {
      hit_points: 100,
      card_type: "healer",
      armor: 10,
      power: 12,
      speed: 10,
      player:,
      experience_given: 40
    }
    normal_heal_q = {
      hit_points: 100,
      card_type: "healer",
      armor: 10,
      power: 11,
      speed: 12,
      player:,
      experience_given: 40
    }
    strong_heal_s = {
      hit_points: 110,
      card_type: "healer",
      armor: 12,
      power: 14,
      speed: 12,
      player:,
      experience_given: 50
    }
    strong_heal_q = {
      hit_points: 110,
      card_type: "healer",
      armor: 12,
      power: 13,
      speed: 14,
      player:,
      experience_given: 50
    }
    # Attributes Tanks
    weak_tank_s = {
      hit_points: 125,
      card_type: "tank",
      armor: 14,
      power: 5,
      speed: 8,
      player:
    }
    weak_tank_q = {
      hit_points: 125,
      card_type: "tank",
      armor: 14,
      power: 4,
      speed: 9,
      player:
    }
    normal_tank_s = {
      hit_points: 135,
      card_type: "tank",
      armor: 16,
      power: 7,
      speed: 10,
      player:,
      experience_given: 40
    }
    normal_tank_q = {
      hit_points: 135,
      card_type: "tank",
      armor: 16,
      power: 6,
      speed: 11,
      player:,
      experience_given: 40
    }
    strong_tank_s = {
      hit_points: 145,
      card_type: "tank",
      armor: 18,
      power: 9,
      speed: 12,
      player:,
      experience_given: 50
    }
    strong_tank_q = {
      hit_points: 145,
      card_type: "tank",
      armor: 18,
      power: 8,
      speed: 13,
      player:,
      experience_given: 50
    }

    Card.create(
      [
        # HUMAN ATTACKER CARDS
        # WEAK
        { name: "Squire", side: "light", cat: "normal weak", unlocked: true, prestige: 1, next_prestige: 5, skillset: 1 }.merge(attr_weak_slow),
        { name: "Crossbowman", side: "light", cat: "normal weak", unlocked: true, prestige: 1, next_prestige: 5, skillset: 2 }.merge(attr_weak_slow),
        { name: "Militia", side: "light", cat: "normal weak", unlocked: true, prestige: 1, next_prestige: 5, skillset: 1 }.merge(attr_weak_normal),
        { name: "Footman", side: "light", cat: "normal weak", unlocked: true, prestige: 1, next_prestige: 5, skillset: 2 }.merge(attr_weak_normal),
        { name: "Archer", side: "light", cat: "normal weak", unlocked: true, prestige: 1, next_prestige: 5, skillset: 1 }.merge(attr_weak_quick),
        { name: "Scout", side: "light", cat: "normal weak", skillset: 2 }.merge(attr_weak_quick),
        # NORMAL
        { name: "Swordsman", side: "light", cat: "normal normal", skillset: 1 }.merge(attr_normal_slow),
        { name: "Axeman", side: "light", cat: "normal normal", skillset: 3 }.merge(attr_normal_slow),
        { name: "Spearman", side: "light", cat: "normal normal", skillset: 1 }.merge(attr_normal_normal),
        { name: "Mage Apprentice", side: "light", cat: "normal normal", skillset: 3 }.merge(attr_normal_normal),
        { name: "Cavalry", side: "light", cat: "normal normal", skillset: 1 }.merge(attr_normal_quick),
        { name: "Marksman", side: "light", cat: "normal normal", skillset: 3 }.merge(attr_normal_quick),
        # STRONG
        { name: "Paladin", side: "light", cat: "epic", skillset: 4 }.merge(attr_strong_slow),
        { name: "Berserker", side: "light", cat: "epic", skillset: 5 }.merge(attr_strong_slow),
        { name: "Knight", side: "light", cat: "epic", skillset: 6 }.merge(attr_strong_normal),
        { name: "Mage", side: "light", cat: "epic", skillset: 7 }.merge(attr_strong_normal),
        { name: "Captain", side: "light", cat: "epic", skillset: 8 }.merge(attr_strong_quick),
        { name: "Commander", side: "light", cat: "epic", skillset: 9 }.merge(attr_strong_quick),
        # ELITE
        { name: "King", side: "light", cat: "elite", skillset: 10 }.merge(attr_elite_slow),
        { name: "Queen", side: "light", cat: "elite", skillset: 11 }.merge(attr_elite_quick),
        # HUMAN HEALER CARDS
        # WEAK
        { name: "Priest", side: "light", cat: "normal weak", skillset: 12 }.merge(weak_heal_s),
        { name: "Herbalist", side: "light", cat: "normal weak", skillset: 12 }.merge(weak_heal_s),
        { name: "Medic", side: "light", cat: "normal weak", skillset: 12 }.merge(weak_heal_q),
        { name: "Acolyte", side: "light", cat: "normal weak", skillset: 12 }.merge(weak_heal_q),
        # NORMAL
        { name: "Priestess", side: "light", cat: "normal normal", skillset: 13 }.merge(normal_heal_s),
        { name: "Cleric", side: "light", cat: "normal normal", skillset: 13 }.merge(normal_heal_s),
        { name: "Alchemist", side: "light", cat: "normal normal", skillset: 13 }.merge(normal_heal_q),
        { name: "Druid", side: "light", cat: "normal normal", skillset: 13 }.merge(normal_heal_q),
        # STRONG
        { name: "High Priest", side: "light", cat: "epic", skillset: 15 }.merge(strong_heal_s),
        { name: "Battle Medic", side: "light", cat: "epic", skillset: 17 }.merge(strong_heal_q),
        # HUMAN TANK CARDS
        # WEAK
        { name: "Shieldbearer", side: "light", cat: "daily weak", skillset: 18 }.merge(weak_tank_s),
        { name: "Brute", side: "light", cat: "daily weak", skillset: 18 }.merge(weak_tank_q),
        # NORMAL
        { name: "Guardian", side: "light", cat: "daily normal", skillset: 19 }.merge(normal_tank_s),
        { name: "Crusader", side: "light", cat: "daily normal", skillset: 19 }.merge(normal_tank_q),
        # STRONG
        { name: "Juggernaut", side: "light", cat: "epic", skillset: 20 }.merge(strong_tank_s),
        { name: "Warden", side: "light", cat: "epic", skillset: 21 }.merge(strong_tank_q),

        # UNDEAD ATTACKER CARDS
        # WEAK
        { name: "Skeleton Warrior", side: "dark", cat: "normal weak", unlocked: true, prestige: 1, next_prestige: 5, skillset: 1 }.merge(attr_weak_slow),
        { name: "Zombie", side: "dark", cat: "normal weak", unlocked: true, prestige: 1, next_prestige: 5, skillset: 2 }.merge(attr_weak_slow),
        { name: "Rotting Corpse", side: "dark", cat: "normal weak", unlocked: true, prestige: 1, next_prestige: 5, skillset: 1 }.merge(attr_weak_normal),
        { name: "Wraith", side: "dark", cat: "normal weak", unlocked: true, prestige: 1, next_prestige: 5, skillset: 2 }.merge(attr_weak_normal),
        { name: "Skeletal Archer", side: "dark", cat: "normal weak", unlocked: true, prestige: 1, next_prestige: 5, skillset: 1}.merge(attr_weak_quick),
        { name: "Ghoul", side: "dark", cat: "normal weak", skillset: 2 }.merge(attr_weak_quick),
        # NORMAL
        { name: "Death Knight", side: "dark", cat: "normal normal", skillset: 1 }.merge(attr_normal_slow),
        { name: "Mummy", side: "dark", cat: "normal normal", skillset: 3 }.merge(attr_normal_slow),
        { name: "Specter", side: "dark", cat: "normal normal", skillset: 1 }.merge(attr_normal_normal),
        { name: "Lich", side: "dark", cat: "normal normal", skillset: 3 }.merge(attr_normal_normal),
        { name: "Banshee", side: "dark", cat: "normal normal", skillset: 1 }.merge(attr_normal_quick),
        { name: "Vampire", side: "dark", cat: "normal normal", skillset: 3 }.merge(attr_normal_quick),
        # STRONG
        { name: "Bone Golem", side: "dark", cat: "epic", skillset: 4 }.merge(attr_strong_slow),
        { name: "Bone Dragon", side: "dark", cat: "epic", skillset: 5 }.merge(attr_strong_slow),
        { name: "Revenant", side: "dark", cat: "epic", skillset: 6 }.merge(attr_strong_normal),
        { name: "Death Weaver", side: "dark", cat: "epic", skillset: 7 }.merge(attr_strong_normal),
        { name: "Wight", side: "dark", cat: "epic", skillset: 8 }.merge(attr_strong_quick),
        { name: "Necrophage", side: "dark", cat: "epic", skillset: 9 }.merge(attr_strong_quick),
        # ELITE
        { name: "Grave Lord", side: "dark", cat: "elite", skillset: 10 }.merge(attr_elite_slow),
        { name: "Lich King", side: "dark", cat: "elite", skillset: 11 }.merge(attr_elite_quick),
        # UNDEAD HEALER CARDS
        # WEAK
        { name: "Necromancer Acolyte", side: "dark", cat: "normal weak", skillset: 12 }.merge(weak_heal_s),
        { name: "Plaguebearer", side: "dark", cat: "normal weak", skillset: 12 }.merge(weak_heal_s),
        { name: "Graveyard Wisp", side: "dark", cat: "normal weak", skillset: 12 }.merge(weak_heal_q),
        { name: "Bone Mender", side: "dark", cat: "normal weak", skillset: 12 }.merge(weak_heal_q),
        # NORMAL
        { name: "Necromancer", side: "dark", cat: "normal normal", skillset: 13 }.merge(normal_heal_s),
        { name: "Plague Doctor", side: "dark", cat: "normal normal", skillset: 13 }.merge(normal_heal_s),
        { name: "Death Priest", side: "dark", cat: "normal normal", skillset: 13 }.merge(normal_heal_q),
        { name: "Bone Weaver", side: "dark", cat: "normal normal", skillset: 13 }.merge(normal_heal_q),
        # STRONG
        { name: "Inferior Lich", side: "dark", cat: "epic", skillset: 14 }.merge(strong_heal_s),
        { name: "Crypt Keeper", side: "dark", cat: "epic", skillset: 16 }.merge(strong_heal_q),
        # UNDEAD TANK CARDS
        # WEAK
        { name: "Skeleton Shieldbearer", side: "dark", cat: "daily weak", skillset: 18 }.merge(weak_tank_s),
        { name: "Zombie Brute", side: "dark", cat: "daily weak", skillset: 18 }.merge(weak_tank_q),
        # NORMAL
        { name: "Crypt Sentinel", side: "dark", cat: "daily normal", skillset: 19 }.merge(normal_tank_s),
        { name: "Mummy Guardian", side: "dark", cat: "daily normal", skillset: 19 }.merge(normal_tank_q),
        # STRONG
        { name: "Wight Juggernaut", side: "dark", cat: "epic", skillset: 20 }.merge(strong_tank_s),
        { name: "Spectral Guardian", side: "dark", cat: "epic", skillset: 21 }.merge(strong_tank_q)
      ]
    )
  end

  def create_challenges(player)
    attr_light_one = { category: "light", player:, reward: 5, shards: "normal weak" }
    attr_light_two = { category: "light", player:, reward: 10, shards: "normal normal" }

    attr_dark_one = { category: "dark", player:, reward: 5, shards: "normal weak" }
    attr_dark_two = { category: "dark", player:, reward: 10, shards: "normal normal" }

    attr_epic = { category: "epic", player:, unlocked: false, done: false }

    attr_elite = { category: "elite", player:, unlocked: false, done: false }

    Challenge.create(
      [
        # LIGHT CHALLENGES
        { computer: Player.where(code: "light 1").first, rank: 1, unlocked: true }.merge(attr_light_one),
        { computer: Player.where(code: "light 2").first, rank: 2 }.merge(attr_light_one),
        { computer: Player.where(code: "light 3").first, rank: 3 }.merge(attr_light_one),
        { computer: Player.where(code: "light 4").first, rank: 4 }.merge(attr_light_one),
        { computer: Player.where(code: "light 5").first, rank: 5 }.merge(attr_light_one),
        { computer: Player.where(code: "light 6").first, rank: 6 }.merge(attr_light_one),
        { computer: Player.where(code: "light 7").first, rank: 7 }.merge(attr_light_one),
        { computer: Player.where(code: "light 8").first, rank: 8 }.merge(attr_light_one),
        { computer: Player.where(code: "light 9").first, rank: 9 }.merge(attr_light_one),
        { computer: Player.where(code: "light 10").first, rank: 10 }.merge(attr_light_one),
        { computer: Player.where(code: "light 11").first, rank: 11 }.merge(attr_light_one),
        { computer: Player.where(code: "light 12").first, rank: 12 }.merge(attr_light_one),
        { computer: Player.where(code: "light 13").first, rank: 13 }.merge(attr_light_one),
        { computer: Player.where(code: "light 14").first, rank: 14 }.merge(attr_light_one),
        { computer: Player.where(code: "light 15").first, rank: 15 }.merge(attr_light_one),
        { computer: Player.where(code: "light 16").first, rank: 16 }.merge(attr_light_one),
        { computer: Player.where(code: "light 17").first, rank: 17 }.merge(attr_light_one),
        { computer: Player.where(code: "light 18").first, rank: 18 }.merge(attr_light_one),
        { computer: Player.where(code: "light 19").first, rank: 19 }.merge(attr_light_one),
        { computer: Player.where(code: "light 20").first, rank: 20 }.merge(attr_light_one),
        { computer: Player.where(code: "light 21").first, rank: 21 }.merge(attr_light_one),
        { computer: Player.where(code: "light 22").first, rank: 22 }.merge(attr_light_one),
        { computer: Player.where(code: "light 23").first, rank: 23 }.merge(attr_light_one),
        { computer: Player.where(code: "light 24").first, rank: 24 }.merge(attr_light_one),
        { computer: Player.where(code: "light 25").first, rank: 25 }.merge(attr_light_two),
        { computer: Player.where(code: "light 26").first, rank: 26 }.merge(attr_light_two),
        { computer: Player.where(code: "light 27").first, rank: 27 }.merge(attr_light_two),
        { computer: Player.where(code: "light 28").first, rank: 28 }.merge(attr_light_two),
        { computer: Player.where(code: "light 29").first, rank: 29 }.merge(attr_light_two),
        { computer: Player.where(code: "light 30").first, rank: 30 }.merge(attr_light_two),
        { computer: Player.where(code: "light 31").first, rank: 31 }.merge(attr_light_two),
        { computer: Player.where(code: "light 32").first, rank: 32 }.merge(attr_light_two),
        { computer: Player.where(code: "light 33").first, rank: 33 }.merge(attr_light_two),
        { computer: Player.where(code: "light 34").first, rank: 34 }.merge(attr_light_two),
        { computer: Player.where(code: "light 35").first, rank: 35 }.merge(attr_light_two),
        { computer: Player.where(code: "light 36").first, rank: 36 }.merge(attr_light_two),
        { computer: Player.where(code: "light 37").first, rank: 37 }.merge(attr_light_two),
        { computer: Player.where(code: "light 38").first, rank: 38 }.merge(attr_light_two),
        { computer: Player.where(code: "light 39").first, rank: 39 }.merge(attr_light_two),
        { computer: Player.where(code: "light 40").first, rank: 40 }.merge(attr_light_two),
        { computer: Player.where(code: "light 41").first, rank: 41 }.merge(attr_light_one),
        { computer: Player.where(code: "light 42").first, rank: 42 }.merge(attr_light_one),
        { computer: Player.where(code: "light 43").first, rank: 43 }.merge(attr_light_one),
        { computer: Player.where(code: "light 44").first, rank: 44 }.merge(attr_light_one),
        { computer: Player.where(code: "light 45").first, rank: 45 }.merge(attr_light_two),
        { computer: Player.where(code: "light 46").first, rank: 46 }.merge(attr_light_two),
        { computer: Player.where(code: "light 47").first, rank: 47 }.merge(attr_light_two),
        { computer: Player.where(code: "light 48").first, rank: 48 }.merge(attr_light_two),
        { computer: Player.where(code: "light 49").first, rank: 49 }.merge(attr_light_two),
        { computer: Player.where(code: "light 50").first, rank: 50 }.merge(attr_light_two),

        # DARK CHALLENGES
        { computer: Player.where(code: "dark 1").first, rank: 1, unlocked: true }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 2").first, rank: 2 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 3").first, rank: 3 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 4").first, rank: 4 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 5").first, rank: 5 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 6").first, rank: 6 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 7").first, rank: 7 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 8").first, rank: 8 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 9").first, rank: 9 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 10").first, rank: 10 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 11").first, rank: 11 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 12").first, rank: 12 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 13").first, rank: 13 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 14").first, rank: 14 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 15").first, rank: 15 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 16").first, rank: 16 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 17").first, rank: 17 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 18").first, rank: 18 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 19").first, rank: 19 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 20").first, rank: 20 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 21").first, rank: 21 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 22").first, rank: 22 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 23").first, rank: 23 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 24").first, rank: 24 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 25").first, rank: 25 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 26").first, rank: 26 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 27").first, rank: 27 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 28").first, rank: 28 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 29").first, rank: 29 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 30").first, rank: 30 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 31").first, rank: 31 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 32").first, rank: 32 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 33").first, rank: 33 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 34").first, rank: 34 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 35").first, rank: 35 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 36").first, rank: 36 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 37").first, rank: 37 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 38").first, rank: 38 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 39").first, rank: 39 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 40").first, rank: 40 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 41").first, rank: 41 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 42").first, rank: 42 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 43").first, rank: 43 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 44").first, rank: 44 }.merge(attr_dark_one),
        { computer: Player.where(code: "dark 45").first, rank: 45 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 46").first, rank: 46 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 47").first, rank: 47 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 48").first, rank: 48 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 49").first, rank: 49 }.merge(attr_dark_two),
        { computer: Player.where(code: "dark 50").first, rank: 50 }.merge(attr_dark_two),

        # EPIC CHALLENGES
        # HUMAN
        # PALADIN
        { computer: Player.where(code: "epic Paladin 1").first, rank: 1, requirement: "Swordsman,Axeman,Spearman,Shieldbearer,Brute", epic_card: "Paladin" }.merge(attr_epic),
        { computer: Player.where(code: "epic Paladin 2").first, rank: 2, requirement: "Swordsman,Axeman,Spearman,Shieldbearer,Brute", epic_card: "Paladin" }.merge(attr_epic),
        { computer: Player.where(code: "epic Paladin 3").first, rank: 3, requirement: "Swordsman,Axeman,Spearman,Shieldbearer,Brute", epic_card: "Paladin" }.merge(attr_epic),
        { computer: Player.where(code: "epic Paladin 4").first, rank: 4, requirement: "Swordsman,Axeman,Spearman,Shieldbearer,Brute", epic_card: "Paladin" }.merge(attr_epic),
        { computer: Player.where(code: "epic Paladin 5").first, rank: 5, requirement: "Swordsman,Axeman,Spearman,Shieldbearer,Brute", epic_card: "Paladin" }.merge(attr_epic),
        # BERSERKER
        { computer: Player.where(code: "epic Berserker 1").first, rank: 1, requirement: "Cavalry,Mage Apprentice,Marksman,Priestess,Cleric", epic_card: "Berserker" }.merge(attr_epic),
        { computer: Player.where(code: "epic Berserker 2").first, rank: 2, requirement: "Cavalry,Mage Apprentice,Marksman,Priestess,Cleric", epic_card: "Berserker" }.merge(attr_epic),
        { computer: Player.where(code: "epic Berserker 3").first, rank: 3, requirement: "Cavalry,Mage Apprentice,Marksman,Priestess,Cleric", epic_card: "Berserker" }.merge(attr_epic),
        { computer: Player.where(code: "epic Berserker 4").first, rank: 4, requirement: "Cavalry,Mage Apprentice,Marksman,Priestess,Cleric", epic_card: "Berserker" }.merge(attr_epic),
        { computer: Player.where(code: "epic Berserker 5").first, rank: 5, requirement: "Cavalry,Mage Apprentice,Marksman,Priestess,Cleric", epic_card: "Berserker" }.merge(attr_epic),
        # KNIGHT
        { computer: Player.where(code: "epic Knight 1").first, rank: 1, requirement: "Swordsman,Alchemist,Herbalist,Guardian,Crossbowman", epic_card: "Knight" }.merge(attr_epic),
        { computer: Player.where(code: "epic Knight 2").first, rank: 2, requirement: "Swordsman,Alchemist,Herbalist,Guardian,Crossbowman", epic_card: "Knight" }.merge(attr_epic),
        { computer: Player.where(code: "epic Knight 3").first, rank: 3, requirement: "Swordsman,Alchemist,Herbalist,Guardian,Crossbowman", epic_card: "Knight" }.merge(attr_epic),
        { computer: Player.where(code: "epic Knight 4").first, rank: 4, requirement: "Swordsman,Alchemist,Herbalist,Guardian,Crossbowman", epic_card: "Knight" }.merge(attr_epic),
        { computer: Player.where(code: "epic Knight 5").first, rank: 5, requirement: "Swordsman,Alchemist,Herbalist,Guardian,Crossbowman", epic_card: "Knight" }.merge(attr_epic),
        # MAGE
        { computer: Player.where(code: "epic Mage 1").first, rank: 1, requirement: "Squire,Footman,Archer,Guardian,Crusader", epic_card: "Mage" }.merge(attr_epic),
        { computer: Player.where(code: "epic Mage 2").first, rank: 2, requirement: "Squire,Footman,Archer,Guardian,Crusader", epic_card: "Mage" }.merge(attr_epic),
        { computer: Player.where(code: "epic Mage 3").first, rank: 3, requirement: "Squire,Footman,Archer,Guardian,Crusader", epic_card: "Mage" }.merge(attr_epic),
        { computer: Player.where(code: "epic Mage 4").first, rank: 4, requirement: "Squire,Footman,Archer,Guardian,Crusader", epic_card: "Mage" }.merge(attr_epic),
        { computer: Player.where(code: "epic Mage 5").first, rank: 5, requirement: "Squire,Footman,Archer,Guardian,Crusader", epic_card: "Mage" }.merge(attr_epic),
        # CAPTAIN
        { computer: Player.where(code: "epic Captain 1").first, rank: 1, requirement: "Acolyte,Druid,Crusader,Commander,Cleric", epic_card: "Captain" }.merge(attr_epic),
        { computer: Player.where(code: "epic Captain 2").first, rank: 2, requirement: "Acolyte,Druid,Crusader,Commander,Cleric", epic_card: "Captain" }.merge(attr_epic),
        { computer: Player.where(code: "epic Captain 3").first, rank: 3, requirement: "Acolyte,Druid,Crusader,Commander,Cleric", epic_card: "Captain" }.merge(attr_epic),
        { computer: Player.where(code: "epic Captain 4").first, rank: 4, requirement: "Acolyte,Druid,Crusader,Commander,Cleric", epic_card: "Captain" }.merge(attr_epic),
        { computer: Player.where(code: "epic Captain 5").first, rank: 5, requirement: "Acolyte,Druid,Crusader,Commander,Cleric", epic_card: "Captain" }.merge(attr_epic),
        # COMMANDER
        { computer: Player.where(code: "epic Commander 1").first, rank: 1, requirement: "Militia,Scout,Alchemist,Herbalist,Shieldbearer", epic_card: "Commander" }.merge(attr_epic),
        { computer: Player.where(code: "epic Commander 2").first, rank: 2, requirement: "Militia,Scout,Alchemist,Herbalist,Shieldbearer", epic_card: "Commander" }.merge(attr_epic),
        { computer: Player.where(code: "epic Commander 3").first, rank: 3, requirement: "Militia,Scout,Alchemist,Herbalist,Shieldbearer", epic_card: "Commander" }.merge(attr_epic),
        { computer: Player.where(code: "epic Commander 4").first, rank: 4, requirement: "Militia,Scout,Alchemist,Herbalist,Shieldbearer", epic_card: "Commander" }.merge(attr_epic),
        { computer: Player.where(code: "epic Commander 5").first, rank: 5, requirement: "Militia,Scout,Alchemist,Herbalist,Shieldbearer", epic_card: "Commander" }.merge(attr_epic),
        # HIGH PRIEST
        { computer: Player.where(code: "epic High Priest 1").first, rank: 1, requirement: "Brute,Guardian,Swordsman,Marksman,Cleric", epic_card: "High Priest" }.merge(attr_epic),
        { computer: Player.where(code: "epic High Priest 2").first, rank: 2, requirement: "Brute,Guardian,Swordsman,Marksman,Cleric", epic_card: "High Priest" }.merge(attr_epic),
        { computer: Player.where(code: "epic High Priest 3").first, rank: 3, requirement: "Brute,Guardian,Swordsman,Marksman,Cleric", epic_card: "High Priest" }.merge(attr_epic),
        { computer: Player.where(code: "epic High Priest 4").first, rank: 4, requirement: "Brute,Guardian,Swordsman,Marksman,Cleric", epic_card: "High Priest" }.merge(attr_epic),
        { computer: Player.where(code: "epic High Priest 5").first, rank: 5, requirement: "Brute,Guardian,Swordsman,Marksman,Cleric", epic_card: "High Priest" }.merge(attr_epic),
        # BATTLE MEDIC
        { computer: Player.where(code: "epic Battle Medic 1").first, rank: 1, requirement: "Axeman,Mage Apprentice,Priestess,Priest,Medic", epic_card: "Battle Medic" }.merge(attr_epic),
        { computer: Player.where(code: "epic Battle Medic 2").first, rank: 2, requirement: "Axeman,Mage Apprentice,Priestess,Priest,Medic", epic_card: "Battle Medic" }.merge(attr_epic),
        { computer: Player.where(code: "epic Battle Medic 3").first, rank: 3, requirement: "Axeman,Mage Apprentice,Priestess,Priest,Medic", epic_card: "Battle Medic" }.merge(attr_epic),
        { computer: Player.where(code: "epic Battle Medic 4").first, rank: 4, requirement: "Axeman,Mage Apprentice,Priestess,Priest,Medic", epic_card: "Battle Medic" }.merge(attr_epic),
        { computer: Player.where(code: "epic Battle Medic 5").first, rank: 5, requirement: "Axeman,Mage Apprentice,Priestess,Priest,Medic", epic_card: "Battle Medic" }.merge(attr_epic),
        # JUGGERNAUT
        { computer: Player.where(code: "epic Juggernaut 1").first, rank: 1, requirement: "Shieldbearer,Brute,Guardian,Druid,Cavalry", epic_card: "Juggernaut" }.merge(attr_epic),
        { computer: Player.where(code: "epic Juggernaut 2").first, rank: 2, requirement: "Shieldbearer,Brute,Guardian,Druid,Cavalry", epic_card: "Juggernaut" }.merge(attr_epic),
        { computer: Player.where(code: "epic Juggernaut 3").first, rank: 3, requirement: "Shieldbearer,Brute,Guardian,Druid,Cavalry", epic_card: "Juggernaut" }.merge(attr_epic),
        { computer: Player.where(code: "epic Juggernaut 4").first, rank: 4, requirement: "Shieldbearer,Brute,Guardian,Druid,Cavalry", epic_card: "Juggernaut" }.merge(attr_epic),
        { computer: Player.where(code: "epic Juggernaut 5").first, rank: 5, requirement: "Shieldbearer,Brute,Guardian,Druid,Cavalry", epic_card: "Juggernaut" }.merge(attr_epic),
        # WARDEN
        { computer: Player.where(code: "epic Warden 1").first, rank: 1, requirement: "Archer,Medic,Spearman,Alchemist,Crusader", epic_card: "Warden" }.merge(attr_epic),
        { computer: Player.where(code: "epic Warden 2").first, rank: 2, requirement: "Archer,Medic,Spearman,Alchemist,Crusader", epic_card: "Warden" }.merge(attr_epic),
        { computer: Player.where(code: "epic Warden 3").first, rank: 3, requirement: "Archer,Medic,Spearman,Alchemist,Crusader", epic_card: "Warden" }.merge(attr_epic),
        { computer: Player.where(code: "epic Warden 4").first, rank: 4, requirement: "Archer,Medic,Spearman,Alchemist,Crusader", epic_card: "Warden" }.merge(attr_epic),
        { computer: Player.where(code: "epic Warden 5").first, rank: 5, requirement: "Archer,Medic,Spearman,Alchemist,Crusader", epic_card: "Warden" }.merge(attr_epic),
        # KING
        { computer: Player.where(code: "epic King 1").first, rank: 1, requirement: "Paladin,Berserker,Knight,High Priest,Juggernaut", epic_card: "King" }.merge(attr_elite),
        { computer: Player.where(code: "epic King 2").first, rank: 2, requirement: "Paladin,Berserker,Knight,High Priest,Juggernaut", epic_card: "King" }.merge(attr_elite),
        { computer: Player.where(code: "epic King 3").first, rank: 3, requirement: "Paladin,Berserker,Knight,High Priest,Juggernaut", epic_card: "King" }.merge(attr_elite),
        { computer: Player.where(code: "epic King 4").first, rank: 4, requirement: "Paladin,Berserker,Knight,High Priest,Juggernaut", epic_card: "King" }.merge(attr_elite),
        { computer: Player.where(code: "epic King 5").first, rank: 5, requirement: "Paladin,Berserker,Knight,High Priest,Juggernaut", epic_card: "King" }.merge(attr_elite),
        # QUEEN
        { computer: Player.where(code: "epic Queen 1").first, rank: 1, requirement: "Mage,Captain,Commander,Battle Medic,Warden", epic_card: "Queen" }.merge(attr_elite),
        { computer: Player.where(code: "epic Queen 2").first, rank: 2, requirement: "Mage,Captain,Commander,Battle Medic,Warden", epic_card: "Queen" }.merge(attr_elite),
        { computer: Player.where(code: "epic Queen 3").first, rank: 3, requirement: "Mage,Captain,Commander,Battle Medic,Warden", epic_card: "Queen" }.merge(attr_elite),
        { computer: Player.where(code: "epic Queen 4").first, rank: 4, requirement: "Mage,Captain,Commander,Battle Medic,Warden", epic_card: "Queen" }.merge(attr_elite),
        { computer: Player.where(code: "epic Queen 5").first, rank: 5, requirement: "Mage,Captain,Commander,Battle Medic,Warden", epic_card: "Queen" }.merge(attr_elite)
      ]
    )
  end
end
