class Admin::GifsController < ApplicationController
  
  def new
    @gifs = Gif.new
  end

  def create
    gif = Gif.new(gif_params)
    if gif.save
      flash[:notice] = "Successfully created Gif!"
      redirect_to admin_gifs_path
    else
      flash[:alert] = "Didn't work, try again!"
      redirect_to new_admin_gif_path
    end
  end
  
  def destroy
    gif = Gif.find(params[:id])
    gif.destroy
    redirect_to admin_gifs_path
  end
  
  private

    def gif_params
      params.require(:gif).permit(:image_path)
    end
end