class Admin::GifsController < ApplicationController
  
  def new
    @gifs = Gif.new
  end

  def create
    
  end

end