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
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true, level: 1)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true, level: 1)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true, level: 1)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true, level: 1)
Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true, level: 1)

computer = Player.create(name: "Computer", code: "light 2")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 102, armor: 10, power: 10, speed: 8, player: computer, unlocked: true, level: 2)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 102, armor: 15, power: 10, speed: 10, player: computer, unlocked: true, level: 2)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 102, armor: 10, power: 12, speed: 7, player: computer, unlocked: true, level: 2)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 102, armor: 15, power: 10, speed: 12, player: computer, unlocked: true, level: 2)
Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 102, armor: 15, power: 10, speed: 13, player: computer, unlocked: true, level: 2)

computer = Player.create(name: "Computer", code: "light 3")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 105, armor: 10, power: 10, speed: 8, player: computer, unlocked: true, level: 3)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 105, armor: 15, power: 10, speed: 10, player: computer, unlocked: true, level: 3)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 105, armor: 10, power: 12, speed: 7, player: computer, unlocked: true, level: 3)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 105, armor: 15, power: 10, speed: 12, player: computer, unlocked: true, level: 3)
Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 105, armor: 15, power: 10, speed: 13, player: computer, unlocked: true, level: 3)

computer = Player.create(name: "Computer", code: "light 4")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)
Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "light 5")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)
Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "light 6")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)
Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "light 7")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)
Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "light 8")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)
Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "light 9")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)
Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)

computer = Player.create(name: "Computer", code: "light 10")
# Create the cards
Card.create(name: "Imp", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 10, speed: 8, player: computer, unlocked: true)
Card.create(name: "Skeleton", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 10, player: computer, unlocked: true)
Card.create(name: "Cultist", side: "dark", card_type: "healer", hit_points: 100, armor: 10, power: 12, speed: 7, player: computer, unlocked: true)
Card.create(name: "Zombie", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 12, player: computer, unlocked: true)
Card.create(name: "Ghoul", side: "dark", card_type: "attacker", hit_points: 100, armor: 15, power: 10, speed: 13, player: computer, unlocked: true)

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
