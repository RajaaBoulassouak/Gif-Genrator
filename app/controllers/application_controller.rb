class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # Make the current_user method available to views also, not just controllers:
  helper_method :current_user, :current_admin?
 
 # Define the current_user method:
  def current_user
    # Look up the current user based on user_id in the session cookie:
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # ||= ensures this helper doesn't hit the database every time a user hits a web page. It will look it up once, then cache it in the @current_user variable (Memoization)
  end
  
  def current_admin?
    current_user && current_user.admin?
  end
  
  
  # authroize method redirects user to login page if not logged in:
  # def authorize
  #   redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
  # end
    
end
