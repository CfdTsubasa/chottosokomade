class SpotsController < ApplicationController
  def index
    # @spots = Spot.order("RANDOM()").all
    @spots = Spot.all
    
  end

  def new
    @spot = Spot.new
  end

  def create
    spot = Spot.new(spot_params)
    if spot.save!
      redirect_to root_path,notice: '登録しました'
    else
      redirect_to spots_path
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @reviews = Review.where(spot_id: params[:id])
    @review = Review.new
    @like = Like.new
    @user = User.find(current_user.id)
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    spot = Spot.find(params[:id])
    spot.update!(spot_params)
    redirect_to spots_url, notice: "タスク「#{spot.name}」を更新しました。"
  end

  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_to spots_url
  end

  private 

  def spot_params
    params.require(:spot).permit(:name, :comment, :address, :latitude, :longitude, { images: [] }).merge(user_id:current_user.id)
  end
end
