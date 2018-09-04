class FavoritesController < ApplicationController
  
  # def index
  #   @user = User.find(params[:user_id])
  #   @favorites = @user.gifs
  # end 
  
  def create
    @favorite = Favorite.create(favorite_params)
    redirect_to user_path(params[:user_id])
  end
  
  private 
    def favorite_params 
      params.require(:favorite).permit(:user_id, :gif_id)
    end
end