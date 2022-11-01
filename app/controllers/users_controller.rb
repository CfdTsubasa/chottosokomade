class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @spots = @user.spots
    @like = Like.new
  end
end
