class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    @spot = Spot.find(params[:spot_id])
    current_user.follow(user)
    @user = User.find(current_user.id)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
      format.js  # create.js.erbが呼び出される
    end
  end

  def destroy
    user = User.find(params[:followed_id])
    current_user.unfollow(user)
    @spot = Spot.find(params[:spot_id])
    @user = User.find(current_user.id)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
      format.js  # create.js.erbが呼び出される
    end
    # redirect_to user_show_path(user)
  end
end