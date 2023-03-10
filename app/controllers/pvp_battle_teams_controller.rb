class PvpBattleTeamsController < ApplicationController
  def index
    # Display 3 pvp_battle_teams to play against
    # When the player clicks on one, it triggers pvp_battles#new
    # where the player can choose his pvp_battle_team
    # then it creates the pvp_battle
    # If player wins the battle, his rank is set to his opponent's rank and vice versa
    # The pvp_battle_team is saved with the new player.rank and all other pvp_battle_teams from this player are deleted
    rank = current_user.player.rank
    rank ||= 1000
    case rank
    when 1000
      @first_opponent = PvpBattleTeam.where(code: 1).first
      @second_opponent = PvpBattleTeam.where(code: 2).first
      @third_opponent = PvpBattleTeam.where(code: 3).first
    when 1
      @first_opponent = find_opponent(4, 4)
      @second_opponent = find_opponent(3, 3)
      @third_opponent = find_opponent(2, 2)
    when 2..4
      @first_opponent = find_opponent(8, 8)
      @second_opponent = find_opponent(5, 5)
      @third_opponent = find_opponent(1, 1)
    when 5..19
      @first_opponent = find_opponent(rank - 1, rank - 1)
      @second_opponent = find_opponent(3, 3)
      @third_opponent = find_opponent(2, 2)
    when 20..99
      @first_opponent = find_opponent(rank - 1, rank - 1)
      @second_opponent = find_opponent(rank - 2, rank - 5)
      @third_opponent = find_opponent(rank - 6, rank - 15)
    else
      @first_opponent = find_opponent(rank - 1, rank - 10)
      @second_opponent = find_opponent(rank - 11, rank - 15)
      @third_opponent = find_opponent(rank - 16, rank - 25)
    end
  end

  private

  def find_opponent(min, max)
    random = (min..max).to_a.sample
    PvpBattleTeam.where(rank: random).first
  end
end
