class ReviewsController < ApplicationController
  def create
    @reviews = Review.where(spot_id: params[:review][:spot_id])
    @review = Review.new(review_params)
    if @review.save
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
        format.js  # create.js.erbが呼び出される
      end
    else
      redirect_to root_path
    end
  end

  def delete
  end

  private 

  def review_params
    params.require(:review).permit(:comment,:spot_id).merge(user_id:current_user.id,spot_id: params[:review][:spot_id])
  end
end
