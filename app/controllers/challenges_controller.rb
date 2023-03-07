class ChallengesController < ApplicationController
  def index
    user = current_user
    player = user.player
    daily_challenges = player.player_challenges.where(category: "daily")
    if daily_challenges.empty?
      create_daily_challenges(daily_challenges, player)
    end
    if daily_challenges.last && !daily_challenges.last.created_at.today?
      create_daily_challenges(daily_challenges, player)
    end
    @challenges = player.player_challenges.where(unlocked: true)
    @challenges_locked = player.player_challenges.where(unlocked: false)
    if params[:side].present?
      if params[:side] == "epic"
        all_challenges = player.player_challenges.where(category: params[:side])
        paladin_challenges = all_challenges.where(epic_card: "Paladin")
        berserker_challenges = all_challenges.where(epic_card: "Berserker")
        knight_challenges = all_challenges.where(epic_card: "Knight")
        mage_challenges = all_challenges.where(epic_card: "Mage")
        captain_challenges = all_challenges.where(epic_card: "Captain")
        commander_challenges = all_challenges.where(epic_card: "Commander")
        highpriest_challenges = all_challenges.where(epic_card: "High Priest")
        battlemedic_challenges = all_challenges.where(epic_card: "Battle Medic")
        juggernaut_challenges = all_challenges.where(epic_card: "Juggernaut")
        warden_challenges = all_challenges.where(epic_card: "Warden")
        @all_challenges = [
          paladin_challenges,
          berserker_challenges,
          knight_challenges,
          mage_challenges,
          captain_challenges,
          commander_challenges,
          highpriest_challenges,
          battlemedic_challenges,
          juggernaut_challenges,
          warden_challenges
        ]
      elsif params[:side] == "elite"
        all_challenges = player.player_challenges.where(category: params[:side])
        king_challenges = all_challenges.where(epic_card: "King")
        queen_challenges = all_challenges.where(epic_card: "Queen")
        @all_challenges = [
          king_challenges,
          queen_challenges
        ]
      else
        @challenges = @challenges.where(category: params[:side])
        @challenges = @challenges.sort_by(&:rank)
        @challenges_locked = @challenges_locked.where(category: params[:side])
        @challenges_locked = @challenges_locked.sort_by(&:rank)
      end
      # raise
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @bt_computer = @challenge.computer.cards
    if @challenge.category == "daily"
      players_cards = @challenge.player.cards.where(unlocked: true)
      @players_cards = players_cards.sort_by(&:war_power).reverse
    else
      players_cards = @challenge.player.cards.where.not(side: @bt_computer.first.side).and(@challenge.player.cards.where(unlocked: true))
      @players_cards = players_cards.sort_by(&:war_power).reverse
    end
  end

  private

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

  def create_daily_challenges(challenges, player)
    challenges.destroy_all unless challenges.empty?

    code = (1..20).to_a
    lvl = (25..45).to_a
    attacker_names = ["Paladin", "Berserker", "Knight", "Mage", "Captain", "Commander"]
    healer_names = ["High Priest", "Battle Medic"]
    tank_names = ["Juggernaut", "Warden"]

    hit_points_attacker = (40..70).to_a
    hit_points_healer = (35..60).to_a
    hit_points_tank = (50..78).to_a

    skillset_attacker = (1..3).to_a
    skillset_healer = (12..13).to_a
    skillset_tank = (18..19).to_a

    armor_attacker = (15..23).to_a
    armor_healer = (10..15).to_a
    armor_tank = (20..25).to_a

    power_attacker = (10..18).to_a
    power_healer = (11..18).to_a
    power_tank = (4..12).to_a

    speed_attacker = (8..14).to_a
    speed_healer = (9..13).to_a
    speed_tank = (7..10).to_a

    code.each do |code_nb|
      computer = Player.create(name: "Computer", code: "daily #{code_nb}")

      card_creator(
        computer,
        attacker_names.sample,
        lvl.sample,
        hit_points_attacker.sample,
        [
          armor_attacker.sample,
          power_attacker.sample,
          speed_attacker.sample,
          30,
          "attacker",
          "light"
        ],
        skillset_attacker.sample
      )

      card_creator(
        computer,
        attacker_names.sample,
        lvl.sample,
        hit_points_attacker.sample,
        [
          armor_attacker.sample,
          power_attacker.sample,
          speed_attacker.sample,
          30,
          "attacker",
          "light"
        ],
        skillset_attacker.sample
      )

      card_creator(
        computer,
        attacker_names.sample,
        lvl.sample,
        hit_points_attacker.sample,
        [
          armor_attacker.sample,
          power_attacker.sample,
          speed_attacker.sample,
          30,
          "attacker",
          "light"
        ],
        skillset_attacker.sample
      )

      card_creator(
        computer,
        tank_names.sample,
        lvl.sample,
        hit_points_tank.sample,
        [
          armor_tank.sample,
          power_tank.sample,
          speed_tank.sample,
          30,
          "tank",
          "light"
        ],
        skillset_tank.sample
      )

      card_creator(
        computer,
        healer_names.sample,
        lvl.sample,
        hit_points_healer.sample,
        [
          armor_healer.sample,
          power_healer.sample,
          speed_healer.sample,
          30,
          "healer",
          "light"
        ],
        skillset_healer.sample
      )
    end

    attr_weak = { category: "daily", player:, reward: 5, shards: "daily weak" }
    attr_normal = { category: "daily", player:, reward: 10, shards: "daily normal" }

    Challenge.create(
      [
        { computer: Player.where(code: "daily 1").last, rank: 1, unlocked: true }.merge(attr_weak),
        { computer: Player.where(code: "daily 2").last, rank: 2 }.merge(attr_weak),
        { computer: Player.where(code: "daily 3").last, rank: 3 }.merge(attr_weak),
        { computer: Player.where(code: "daily 4").last, rank: 4 }.merge(attr_weak),
        { computer: Player.where(code: "daily 5").last, rank: 5 }.merge(attr_weak),
        { computer: Player.where(code: "daily 6").last, rank: 6 }.merge(attr_weak),
        { computer: Player.where(code: "daily 7").last, rank: 7 }.merge(attr_weak),
        { computer: Player.where(code: "daily 8").last, rank: 8 }.merge(attr_weak),
        { computer: Player.where(code: "daily 9").last, rank: 9 }.merge(attr_weak),
        { computer: Player.where(code: "daily 10").last, rank: 10 }.merge(attr_weak),
        { computer: Player.where(code: "daily 11").last, rank: 11 }.merge(attr_normal),
        { computer: Player.where(code: "daily 12").last, rank: 12 }.merge(attr_normal),
        { computer: Player.where(code: "daily 13").last, rank: 13 }.merge(attr_normal),
        { computer: Player.where(code: "daily 14").last, rank: 14 }.merge(attr_normal),
        { computer: Player.where(code: "daily 15").last, rank: 15 }.merge(attr_normal),
        { computer: Player.where(code: "daily 16").last, rank: 16 }.merge(attr_normal),
        { computer: Player.where(code: "daily 17").last, rank: 17 }.merge(attr_normal),
        { computer: Player.where(code: "daily 18").last, rank: 18 }.merge(attr_normal),
        { computer: Player.where(code: "daily 19").last, rank: 19 }.merge(attr_normal),
        { computer: Player.where(code: "daily 20").last, rank: 20 }.merge(attr_normal)
      ]
    )
  end
end
