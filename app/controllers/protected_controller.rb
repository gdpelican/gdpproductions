class ProtectedController < ApplicationController
  protect_from_forgery
  
  before_filter :require_login, :only => [:new, :update, :destroy, :create]

  def require_login
    if session[:id].nil? and @contact.nil?
      flash[:error] = 'Please login to continue'
      redirect_to login_path
    end
  end

  def require_logout
    if session[:id]
      flash[:error] = 'You must be logged out to complete this action'
      redirect_to root_url
    end
  end
  
end
