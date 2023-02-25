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
    Card.create(name: "Peasant", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player:, unlocked: true, experience: 0, next_level: 100)
    Card.create(name: "Squire", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player:, unlocked: true, experience: 0, next_level: 100)
    Card.create(name: "Priest", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player:, unlocked: true, experience: 0, next_level: 100)
    Card.create(name: "Archer", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player:, unlocked: true, experience: 0, next_level: 100)
    Card.create(name: "Footman", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player:, unlocked: true, experience: 0, next_level: 100)
    # LIGHT better cards
    Card.create(name: "Paladin", side: "light", card_type: "healer", hit_points: 120, armor: 15, power: 15, speed: 13, player:, unlocked: false, experience: 0, next_level: 100)
    Card.create(name: "Crusader", side: "light", card_type: "attacker", hit_points: 120, armor: 20, power: 15, speed: 15, player:, unlocked: false, experience: 0, next_level: 100)
    Card.create(name: "Cleric", side: "light", card_type: "healer", hit_points: 120, armor: 15, power: 17, speed: 12, player:, unlocked: false, experience: 0, next_level: 100)
    Card.create(name: "Captain", side: "light", card_type: "attacker", hit_points: 130, armor: 20, power: 15, speed: 15, player:, unlocked: false, experience: 0, next_level: 100)
    Card.create(name: "King", side: "light", card_type: "attacker", hit_points: 150, armor: 25, power: 20, speed: 20, player:, unlocked: false, experience: 0, next_level: 100)
    # DARK basic cards
    Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player:, unlocked: true, experience: 0, next_level: 100)
    Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player:, unlocked: true, experience: 0, next_level: 100)
    Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player:, unlocked: true, experience: 0, next_level: 100)
    Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player:, unlocked: true, experience: 0, next_level: 100)
    Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player:, unlocked: true, experience: 0, next_level: 100)
    # DARK better cards
    Card.create(name: "Demon", side: "dark", card_type: "attacker", hit_points: 100, armor: 20, power: 15, speed: 15, player:, unlocked: false, experience: 0, next_level: 100)
    Card.create(name: "Necromancer", side: "dark", card_type: "healer", hit_points: 100, armor: 15, power: 15, speed: 13, player:, unlocked: false, experience: 0, next_level: 100)
    Card.create(name: "Warlock", side: "dark", card_type: "healer", hit_points: 100, armor: 15, power: 17, speed: 12, player:, unlocked: false, experience: 0, next_level: 100)
    Card.create(name: "Hellhound", side: "dark", card_type: "attacker", hit_points: 100, armor: 20, power: 15, speed: 15, player:, unlocked: false, experience: 0, next_level: 100)
    Card.create(name: "Archfiend", side: "dark", card_type: "attacker", hit_points: 150, armor: 25, power: 20, speed: 20, player:, unlocked: false, experience: 0, next_level: 100)
  end

  def create_challenges(player)
    # LIGHT challenges
    computer = Player.where(code: "light 1").first
    Challenge.create(category: "light", unlocked: true, player:, computer:)
    computer = Player.where(code: "light 2").first
    Challenge.create(category: "light", unlocked: false, player:, computer:)
    computer = Player.where(code: "light 3").first
    Challenge.create(category: "light", unlocked: false, player:, computer:)
    computer = Player.where(code: "light 4").first
    Challenge.create(category: "light", unlocked: false, player:, computer:)
    computer = Player.where(code: "light 5").first
    Challenge.create(category: "light", unlocked: false, player:, computer:)
    computer = Player.where(code: "light 6").first
    Challenge.create(category: "light", unlocked: false, player:, computer:)
    computer = Player.where(code: "light 7").first
    Challenge.create(category: "light", unlocked: false, player:, computer:)
    computer = Player.where(code: "light 8").first
    Challenge.create(category: "light", unlocked: false, player:, computer:)
    computer = Player.where(code: "light 9").first
    Challenge.create(category: "light", unlocked: false, player:, computer:)
    computer = Player.where(code: "light 10").first
    Challenge.create(category: "light", unlocked: false, player:, computer:)
    # DARK challenges
    computer = Player.where(code: "dark 1").first
    Challenge.create(category: "dark", unlocked: true, player:, computer:)
    computer = Player.where(code: "dark 2").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:)
    computer = Player.where(code: "dark 3").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:)
    computer = Player.where(code: "dark 4").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:)
    computer = Player.where(code: "dark 5").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:)
    computer = Player.where(code: "dark 6").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:)
    computer = Player.where(code: "dark 7").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:)
    computer = Player.where(code: "dark 8").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:)
    computer = Player.where(code: "dark 9").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:)
    computer = Player.where(code: "dark 10").first
    Challenge.create(category: "dark", unlocked: false, player:, computer:)
  end
end
