class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @spot = @user.spots.first
  end
end
