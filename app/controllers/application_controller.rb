class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :init
  before_filter :require_login, :only => [:new, :update, :destroy, :create]

  def init

    if session[:id]
      @user = Session.find_by_id(session[:id]).person
    else
      @user = nil
    end

    @links = Link.all
    @current = Show.current
    @picture_mode = 'current'
    
  end

  def require_login
    if session[:id].nil?
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
