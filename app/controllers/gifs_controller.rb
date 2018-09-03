class GifsController < ApplicationController

  def index 
    @categories = Category.all
    @gifs = Gif.all
  end

end