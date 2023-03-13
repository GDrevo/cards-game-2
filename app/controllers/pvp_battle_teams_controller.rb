class PvpBattleTeamsController < ApplicationController
  def index
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
      @second_opponent = find_opponent(rank - 2, rank - 2)
      @third_opponent = find_opponent(rank - 4, rank - 3)
    when 20..99
      @first_opponent = find_opponent(rank - 1, rank - 1)
      @second_opponent = find_opponent(rank - 5, rank - 2)
      @third_opponent = find_opponent(rank - 16, rank - 6)
    else
      @first_opponent = find_opponent(rank - 10, rank - 1)
      @second_opponent = find_opponent(rank - 15, rank - 11)
      @third_opponent = find_opponent(rank - 25, rank - 16)
    end
  end

  private

  def find_opponent(min, max)
    random = (min..max).to_a.sample
    PvpBattleTeam.where(rank: random).first
  end
end
