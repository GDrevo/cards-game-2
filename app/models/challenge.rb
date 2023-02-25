class Challenge < ApplicationRecord
  belongs_to :player, class_name: 'Player', inverse_of: :player_challenges
  belongs_to :computer, class_name: 'Player', inverse_of: :computer_challenges
  has_many :battles

  def next(category)
    rank = self.rank
    Challenge.where(player:, rank: rank + 1, category:).first
  end
end
