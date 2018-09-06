class FavoritesController < ApplicationController
  
  def create
    @favorite = Favorite.create(favorite_params)
    redirect_to user_path(params[:user_id])
  end
  
  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to user_path(params[:user_id])
  end
  
  private 
    def favorite_params 
      params.require(:favorite).permit(:user_id, :gif_id)
    end
end