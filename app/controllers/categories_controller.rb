class CategoriesController < ApplicationController

  def index
    @gifs_sorted_by_category = Category.gifs_sorted_by_category
  end

end 