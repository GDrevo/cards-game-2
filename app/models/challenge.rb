class Challenge < ApplicationRecord
  belongs_to :player, class_name: 'Player', inverse_of: :player_challenges
  belongs_to :computer, class_name: 'Player', inverse_of: :computer_challenges
  has_many :battles, dependent: :destroy

  def next(category)
    return if category.include?("epic") || category.include?("elite")

    rank = self.rank
    Challenge.where(player:, rank: rank + 1, category:).first
  end

  # def epic_card
  #   match = category.match(/epic\s+(\w+(\s+\w+)*)\s+\d+/)
  #   match ? result = match[1] : nil
  #   result # Ex; "Paladin"
  # end
end
