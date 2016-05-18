class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 #available to our views
  helper_method :current_user, :logged_in?
  def current_user
    # if current user already exists in the database than return current user
    #if not current_user than find the user stored in the session
    # return the user if sessions[:user_id] there is user_id stored in the browser in session hash
    # if its true find the user in the database return the user object
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    #convert boolean return true if have current_user otherwise false to check whether user log in or not
    !!current_user
  end

  def require_user
    #if user not logged in display message and redirect root_path
    if !logged_in? 
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
