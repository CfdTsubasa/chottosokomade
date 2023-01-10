class SearchesController < ApplicationController
  def search
    @q = params[:q]
    @users = User.ransack(name_cont: @q).result
    @tags = Spot.tag_counts_on(:tags).most_used(20)
    if current_user.current_location.present?
      @neighborhood_spots = Spot.within_box(1.86411, current_user.current_location.last.latitude, current_user.current_location.last.longitude).limit(4)
    end
    if params[:tags]
      @spots = Spot.tagged_with(params[:tags])
    else
      @spots = Spot.ransack(name_cont: @q).result
    end
  end
end
