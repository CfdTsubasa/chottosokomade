class SearchesController < ApplicationController
  def search
    @q = params[:q]
    @users = User.ransack(name_cont: @q).result
    @tags = Spot.tag_counts_on(:tags).most_used(20)
    @neighborhood_spots = Spot.within_box(5, 35.645856, 140.036135)
    if params[:tags]
      @spots = Spot.tagged_with(params[:tags])
    else
      @spots = Spot.ransack(name_cont: @q).result
    end
  end
end
