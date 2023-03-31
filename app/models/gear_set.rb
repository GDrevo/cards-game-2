class GearSet < ApplicationRecord
  belongs_to :card
  has_many :gears
end
