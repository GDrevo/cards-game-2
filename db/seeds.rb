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

# Create the light challenges computer players
computer = Player.create(name: "Computer", code: "light 1")
computer.save
p computer
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 8, speed: 12, player: computer, unlocked: true, level: 1)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 9, speed: 11, player: computer, unlocked: true, level: 1)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 10, speed: 10, player: computer, unlocked: true, level: 1)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 8, speed: 12, player: computer, unlocked: true, level: 1)
card = Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 12, speed: 8, player: computer, unlocked: true, level: 1)
p card

computer = Player.create(name: "Computer", code: "light 2")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 66, armor: 10, power: 11, speed: 12, player: computer, unlocked: true, level: 5, experience_given: 41)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 66, armor: 10, power: 12, speed: 11, player: computer, unlocked: true, level: 5, experience_given: 41)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 66, armor: 15, power: 14, speed: 10, player: computer, unlocked: true, level: 5, experience_given: 41)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 66, armor: 15, power: 11, speed: 12, player: computer, unlocked: true, level: 5, experience_given: 41)
card = Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 66, armor: 15, power: 16, speed: 8, player: computer, unlocked: true, level: 5, experience_given: 41)

computer = Player.create(name: "Computer", code: "light 3")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 92, armor: 11, power: 16, speed: 13, player: computer, unlocked: true, level: 10, experience_given: 60)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 92, armor: 11, power: 18, speed: 12, player: computer, unlocked: true, level: 10, experience_given: 60)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 92, armor: 16, power: 20, speed: 11, player: computer, unlocked: true, level: 10, experience_given: 60)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 92, armor: 16, power: 16, speed: 13, player: computer, unlocked: true, level: 10, experience_given: 60)
card = Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 92, armor: 16, power: 24, speed: 9, player: computer, unlocked: true, level: 10, experience_given: 60)

computer = Player.create(name: "Computer", code: "light 4")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 129, armor: 11, power: 23, speed: 13, player: computer, unlocked: true, level: 15, experience_given: 88)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 129, armor: 11, power: 26, speed: 12, player: computer, unlocked: true, level: 15, experience_given: 88)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 129, armor: 16, power: 29, speed: 11, player: computer, unlocked: true, level: 15, experience_given: 88)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 129, armor: 16, power: 23, speed: 13, player: computer, unlocked: true, level: 15, experience_given: 88)
card = Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 129, armor: 16, power: 35, speed: 9, player: computer, unlocked: true, level: 15, experience_given: 88)

computer = Player.create(name: "Computer", code: "light 5")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 8, speed: 12, player: computer, unlocked: true, level: 1)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 9, speed: 11, player: computer, unlocked: true, level: 1)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 10, speed: 10, player: computer, unlocked: true, level: 1)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 8, speed: 12, player: computer, unlocked: true, level: 1)
card = Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 12, speed: 8, player: computer, unlocked: true, level: 1)

computer = Player.create(name: "Computer", code: "light 6")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 8, speed: 12, player: computer, unlocked: true, level: 1)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 9, speed: 11, player: computer, unlocked: true, level: 1)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 10, speed: 10, player: computer, unlocked: true, level: 1)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 8, speed: 12, player: computer, unlocked: true, level: 1)
card = Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 12, speed: 8, player: computer, unlocked: true, level: 1)

computer = Player.create(name: "Computer", code: "light 7")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 8, speed: 12, player: computer, unlocked: true, level: 1)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 9, speed: 11, player: computer, unlocked: true, level: 1)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 10, speed: 10, player: computer, unlocked: true, level: 1)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 8, speed: 12, player: computer, unlocked: true, level: 1)
card = Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 12, speed: 8, player: computer, unlocked: true, level: 1)

computer = Player.create(name: "Computer", code: "light 8")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 8, speed: 12, player: computer, unlocked: true, level: 1)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 9, speed: 11, player: computer, unlocked: true, level: 1)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 10, speed: 10, player: computer, unlocked: true, level: 1)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 8, speed: 12, player: computer, unlocked: true, level: 1)
card = Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 12, speed: 8, player: computer, unlocked: true, level: 1)

computer = Player.create(name: "Computer", code: "light 9")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 8, speed: 12, player: computer, unlocked: true, level: 1)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 9, speed: 11, player: computer, unlocked: true, level: 1)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 10, speed: 10, player: computer, unlocked: true, level: 1)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 8, speed: 12, player: computer, unlocked: true, level: 1)
card = Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 12, speed: 8, player: computer, unlocked: true, level: 1)

computer = Player.create(name: "Computer", code: "light 10")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 8, speed: 12, player: computer, unlocked: true, level: 1)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 50, armor: 10, power: 9, speed: 11, player: computer, unlocked: true, level: 1)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 10, speed: 10, player: computer, unlocked: true, level: 1)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 8, speed: 12, player: computer, unlocked: true, level: 1)
card = Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 50, armor: 15, power: 12, speed: 8, player: computer, unlocked: true, level: 1)

# ////////////////////////////////////////////////////////////////////////
# ///////////////////////////////////////////////////////////////////////
# Create the dark challenges computer players
computer = Player.create(name: "Computer", code: "dark 1")
# Create the cards
Card.create(name: "Peasant", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Squire", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Priest", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Archer", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)
Card.create(name: "Footman", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "dark 2")
# Create the cards
Card.create(name: "Peasant", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Squire", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Priest", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Archer", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)
Card.create(name: "Footman", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "dark 3")
# Create the cards
Card.create(name: "Peasant", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Squire", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Priest", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Archer", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)
Card.create(name: "Footman", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "dark 4")
# Create the cards
Card.create(name: "Peasant", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Squire", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Priest", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Archer", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)
Card.create(name: "Footman", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "dark 5")
# Create the cards
Card.create(name: "Peasant", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Squire", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Priest", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Archer", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)
Card.create(name: "Footman", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "dark 6")
# Create the cards
Card.create(name: "Peasant", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Squire", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Priest", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Archer", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)
Card.create(name: "Footman", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "dark 7")
# Create the cards
Card.create(name: "Peasant", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Squire", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Priest", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Archer", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)
Card.create(name: "Footman", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "dark 8")
# Create the cards
Card.create(name: "Peasant", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Squire", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Priest", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Archer", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)
Card.create(name: "Footman", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "dark 9")
# Create the cards
Card.create(name: "Peasant", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Squire", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Priest", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Archer", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)
Card.create(name: "Footman", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "dark 10")
# Create the cards
Card.create(name: "Peasant", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Squire", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Priest", side: "light", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Archer", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)
Card.create(name: "Footman", side: "light", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)
