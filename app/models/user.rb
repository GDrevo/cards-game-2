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
    # LIGHT basic cards
    Card.create(name: "Peasant", side: "light", card_type: "attacker", hit_points: 50, armor: 15, power: 12, speed: 8, player:, unlocked: true)
    Card.create(name: "Archer", side: "light", card_type: "attacker", hit_points: 50, armor: 15, power: 8, speed: 12, player:, unlocked: true)
    Card.create(name: "Footman", side: "light", card_type: "attacker", hit_points: 50, armor: 15, power: 10, speed: 10, player:, unlocked: true)
    Card.create(name: "Squire", side: "light", card_type: "healer", hit_points: 50, armor: 10, power: 9, speed: 11, player:, unlocked: true)
    Card.create(name: "Priest", side: "light", card_type: "healer", hit_points: 50, armor: 10, power: 8, speed: 12, player:, unlocked: true)
    # LIGHT better cards
    Card.create(name: "Crusader", side: "light", card_type: "attacker", hit_points: 75, armor: 20, power: 17, speed: 13, player:, unlocked: false, experience: 0, next_level: 50, experience_given: 40)
    Card.create(name: "Captain", side: "light", card_type: "attacker", hit_points: 75, armor: 20, power: 13, speed: 17, player:, unlocked: false, experience: 0, next_level: 50, experience_given: 40)
    Card.create(name: "King", side: "light", card_type: "attacker", hit_points: 100, armor: 25, power: 20, speed: 20, player:, unlocked: false, experience: 0, next_level: 50, experience_given: 60)
    Card.create(name: "Cleric", side: "light", card_type: "healer", hit_points: 70, armor: 15, power: 14, speed: 16, player:, unlocked: false, experience: 0, next_level: 50, experience_given: 40)
    Card.create(name: "Paladin", side: "light", card_type: "healer", hit_points: 70, armor: 15, power: 16, speed: 14, player:, unlocked: false, experience: 0, next_level: 50, experience_given: 40)
    # DARK basic cards
    Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 10, speed: 10, player:, unlocked: true, experience: 0, next_level: 50)
    Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 8, speed: 12, player:, unlocked: true, experience: 0, next_level: 50)
    Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 12, speed: 8, player:, unlocked: true, experience: 0, next_level: 50)
    Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 9, speed: 11, player:, unlocked: true, experience: 0, next_level: 50)
    Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 8, speed: 12, player:, unlocked: true, experience: 0, next_level: 50)
    # DARK better cards
    Card.create(name: "Demon", side: "dark", card_type: "attacker", hit_points: 75, armor: 20, power: 17, speed: 13, player:, unlocked: false, experience: 0, next_level: 50, experience_given: 40)
    Card.create(name: "Hellhound", side: "dark", card_type: "attacker", hit_points: 75, armor: 20, power: 13, speed: 17, player:, unlocked: false, experience: 0, next_level: 50, experience_given: 40)
    Card.create(name: "Archfiend", side: "dark", card_type: "attacker", hit_points: 100, armor: 25, power: 20, speed: 20, player:, unlocked: false, experience: 0, next_level: 50, experience_given: 60)
    Card.create(name: "Necromancer", side: "dark", card_type: "healer", hit_points: 70, armor: 15, power: 16, speed: 14, player:, unlocked: false, experience: 0, next_level: 50, experience_given: 40)
    Card.create(name: "Warlock", side: "dark", card_type: "healer", hit_points: 70, armor: 15, power: 14, speed: 16, player:, unlocked: false, experience: 0, next_level: 50, experience_given: 40)
  end

  def create_challenges(player)
    # LIGHT challenges
    computer = Player.where(code: "light 1").first
    Challenge.create(category: "light", unlocked: true, player:, computer:, rank: 1)
    computer = Player.where(code: "light 2").first
    Challenge.create(category: "light", unlocked: false, player:, computer:, rank: 2)
    computer = Player.where(code: "light 3").first
    Challenge.create(category: "light", unlocked: false, player:, computer:, rank: 3)
    computer = Player.where(code: "light 4").first
    Challenge.create(category: "light", unlocked: false, player:, computer:, rank: 4)
    computer = Player.where(code: "light 5").first
    Challenge.create(category: "light", unlocked: false, player:, computer:, rank: 5)
    computer = Player.where(code: "light 6").first
    Challenge.create(category: "light", unlocked: false, player:, computer:, rank: 6)
    computer = Player.where(code: "light 7").first
    Challenge.create(category: "light", unlocked: false, player:, computer:, rank: 7)
    computer = Player.where(code: "light 8").first
    Challenge.create(category: "light", unlocked: false, player:, computer:, rank: 8)
    computer = Player.where(code: "light 9").first
    Challenge.create(category: "light", unlocked: false, player:, computer:, rank: 9)
    computer = Player.where(code: "light 10").first
    Challenge.create(category: "light", unlocked: false, player:, computer:, rank: 10)
    # DARK challenges
    computer = Player.where(code: "dark 1").first
    Challenge.create(category: "dark", unlocked: true, player:, computer:, rank: 1)
    computer = Player.where(code: "dark 2").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:, rank: 2)
    computer = Player.where(code: "dark 3").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:, rank: 3)
    computer = Player.where(code: "dark 4").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:, rank: 4)
    computer = Player.where(code: "dark 5").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:, rank: 5)
    computer = Player.where(code: "dark 6").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:, rank: 6)
    computer = Player.where(code: "dark 7").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:, rank: 7)
    computer = Player.where(code: "dark 8").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:, rank: 8)
    computer = Player.where(code: "dark 9").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:, rank: 9)
    computer = Player.where(code: "dark 10").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:, rank: 10)
  end
end
