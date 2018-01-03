class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorized

  helper_method :logged_in?, :current_user

  helper :all


  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end


  def logged_in?
     !!current_user
  end

  def authorized
    redirect_to signin_path unless logged_in?
  end


end
