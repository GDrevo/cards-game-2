class GearsController < ApplicationController
  def index
    params[:gear_type] && gear_type = params[:gear_type]
    gear_type && @gears = current_user.player.gears.where(gear_type:).where(used: false)
    @gears && used_gear = current_user.player.gears.where(gear_type:).where(used: true)
    used_gear && used_gear.empty? ? @used_gear = nil : @used_gear = used_gear.first
    if params[:gear_type].starts_with?("weapon")
      @gear_photo = "weapon"
    elsif params[:gear_type].starts_with?("armor")
      @gear_photo = "armor"
    else
      @gear_photo = "artifact"
    end
    @card = Card.find(params[:card_id])
    # raise
  end

  def modify_used_gear
    card = Card.find(params[:card_id])
    used_gear = Gear.find(params[:id]) if params[:id].to_i.positive?
    new_gear = Gear.find(params[:ngear_id])
    if used_gear
      used_gear.used = false
      used_gear.gear_set = nil
      used_gear.save
    end
    new_gear.used = true
    new_gear.gear_set = card.gear_set
    new_gear.save
    # ADD BEFORE_SAVE IN THE GEARSET MODEL IN ORDER TO CALCULATE BONUSES
    redirect_to card_path(card)
  end
end
