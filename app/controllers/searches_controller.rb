class SearchesController < ApplicationController
  def search
    @q = params[:q]
    @users = User.ransack(name_cont: @q).result
    @spots = Spot.ransack(name_cont: @q).result
  end
end
