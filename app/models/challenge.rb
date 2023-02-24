class Challenge < ApplicationRecord
  belongs_to :player, class_name: 'Player', inverse_of: :player_challenges
  belongs_to :computer, class_name: 'Player', inverse_of: :computer_challenges
  has_many :battles
end
