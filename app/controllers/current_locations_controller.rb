class CurrentLocationsController < ApplicationController
  def create
    current_location = CurrentLocation.new(current_location_params)
    if current_location.save!
      redirect_to user_show_path(current_user),notice: '登録しました'
    else
      redirect_to user_show_path
    end
  end

  def index
    
  end

  def current_location_params
    params.require(:current_location).permit(:latitude, :longitude).merge(user_id:current_user.id)
  end
end
