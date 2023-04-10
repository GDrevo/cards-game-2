class GearsController < ApplicationController
  def index
    params[:gear_type] && gear_type = params[:gear_type]
    params[:card_id] && card = Card.find(params[:card_id])
    gear_type && @gears = current_user.player.gears.where(gear_type:).where(used: false)
    @gears && used_gear = card.gear_set.gears.where(gear_type:).where(used: true)
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
    card.gear_set.save
    redirect_to card_path(card)
  end

  def sell_gear
    card = Card.find(params[:card_id])
    gear = Gear.find(params[:sgear_id])
    gear_type = gear.gear_type
    if gear
      current_user.player.coins += gear.coins_value
      current_user.player.save
      gear.delete
    end
    redirect_to gears_path(card_id: card.id, gear_type:)
  end
end
