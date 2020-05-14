class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @favorite = current_user.favorites.create(micropost_id: params[:micropost_id])
    redirect_back(fallback_location: root_url)
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @favorite = current_user.favorites.find_by(micropost_id: @micropost.id)
    @favorite.destroy
    redirect_back(fallback_location: root_url)
  end
end
