class GifsController < ApplicationController

  def index 
    @catergories = Category.all
    @gifs = Gif.gifs_sorted_by_category
    @gifs_slices = @gifs.all.each_slice(4)
  end
end