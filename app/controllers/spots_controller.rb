class SpotsController < ApplicationController
  def index
    @spots = Spot.all.order(id: "DESC").page(params[:page]).per(21)
  end

  def new
    @spot = Spot.new
  end

  def create
    spot = Spot.new(spot_params)
    if spot.save!
      redirect_to root_path,notice: '投稿が完了しました'
    else
      redirect_to spots_path
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @tags = @spot.tag_counts_on(:tags)
    @reviews = Review.where(spot_id: params[:id])
    @review = Review.new
    @like = Like.new
    @user = User.find(current_user.id)
    @current_location = CurrentLocation.where(user_id: current_user.id).last
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    spot = Spot.find(params[:id])
    spot.update!(spot_params)
    redirect_to spots_url, notice: "スポット「#{spot.name}」を更新しました。"
  end

  def destroy
    spot = Spot.find(params[:id])
    spotName = spot.name
    spot.destroy
    redirect_to user_show_path(current_user), notice: "スポット「#{spotName}」を削除しました。"
  end

  def following_users_spots
    @spots = current_user.following_users_spots.order(id: "DESC").page(params[:page]).per(21)
  end

  private 

  def spot_params
    params.require(:spot).permit(:name, :comment, :address, :latitude, :longitude, :tag_list, { images: [] }).merge(user_id:current_user.id)
  end
end
