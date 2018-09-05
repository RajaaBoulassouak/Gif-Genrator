class GifsController < ApplicationController

  def index 
    @catergories = Category.all
    @gifs = Gif.all
  end
end