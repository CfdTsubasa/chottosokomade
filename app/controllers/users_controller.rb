class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @spots = @user.spots
    @like = Like.new
    @current_location = CurrentLocation.new
    @current_location2 = Spot.within_box(5, 35.6586148, 140.0612764).last
  end
end
