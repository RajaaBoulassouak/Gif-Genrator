class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @user.email.downcase!
    if @user.save
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
      flash[:notice] = "Successfully created account for #{@user.name}!"
    else
      flash[:alert] = "Oops, couldn't create account. Please use a valid email and password and try again."
      redirect_to new_user_path
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
