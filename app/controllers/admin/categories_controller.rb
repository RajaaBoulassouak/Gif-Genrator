class Admin::CategoriesController < Admin::BaseController
  
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save
      redirect_to admin_categories_path
      flash[:notice] = "Category #{category.name} successfully created!"
    else
      flash[:alert] = "Didn't work, try again."
      redirect_to new_admin_category_path
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admin_categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end 
