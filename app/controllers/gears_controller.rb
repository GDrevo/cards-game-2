class GearsController < ApplicationController
  def index
    params[:gear_type] && gear_type = params[:gear_type]
    gear_type && @gears = current_user.player.gears.where(gear_type:)
    @gears && used_gear = @gears.where(used: true)
    used_gear && used_gear.empty? ? @used_gear = nil : @used_gear = used_gear
    if params[:gear_type].starts_with?("weapon")
      @gear_photo = "weapon-gear 0"
    elsif params[:gear_type].starts_with?("armor")
      @gear_photo = "armor-gear 0"
    else
      @gear_photo = "artifact-gear 0"
    end
  end
end
