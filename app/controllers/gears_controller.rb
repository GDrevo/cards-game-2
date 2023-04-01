class GearsController < ApplicationController
  def index
    params[:gear_type] && gear_type = params[:gear_type]
    gear_type && @gears = current_user.player.gears.where(gear_type:)
  end
end
