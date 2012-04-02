class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :init

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
  
end
