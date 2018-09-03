class Admin::CategoriesController < Admin::BaseController
  def new 
    @catgory = Category.new
  end 
end