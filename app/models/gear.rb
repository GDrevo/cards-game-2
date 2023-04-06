class Gear < ApplicationRecord
  belongs_to :gear_set, optional: true
  belongs_to :player
  has_one_attached :photo

  after_create :attach_photo

  private

  def attach_photo
    return if photo.attached?

    case gear_type
    when "weapon 0"
      photo.attach(io: File.open('app/assets/images/weapon-gear 0.png'), filename: 'weapon-gear 0.png', content_type: "image/png")
    when "weapon 1"
      photo.attach(io: File.open('app/assets/images/weapon-gear 1.png'), filename: 'weapon-gear 1.png', content_type: "image/png")
    when "weapon 2"
      photo.attach(io: File.open('app/assets/images/weapon-gear 2.png'), filename: 'weapon-gear 2.png', content_type: "image/png")
    when "armor 0"
      photo.attach(io: File.open('app/assets/images/armor-gear 0.png'), filename: 'armor-gear 0.png', content_type: "image/png")
    when "armor 1"
      photo.attach(io: File.open('app/assets/images/armor-gear 1.png'), filename: 'armor-gear 1.png', content_type: "image/png")
    when "armor 2"
      photo.attach(io: File.open('app/assets/images/armor-gear 2.png'), filename: 'armor-gear 2.png', content_type: "image/png")
    when "artifact 0"
      photo.attach(io: File.open('app/assets/images/artifact-gear 0.png'), filename: 'artifact-gear 0.png', content_type: "image/png")
    when "artifact 1"
      photo.attach(io: File.open('app/assets/images/artifact-gear 1.png'), filename: 'artifact-gear 1.png', content_type: "image/png")
    when "artifact 2"
      photo.attach(io: File.open('app/assets/images/artifact-gear 2.png'), filename: 'artifact-gear 2.png', content_type: "image/png")
    end
    save
  end
end
