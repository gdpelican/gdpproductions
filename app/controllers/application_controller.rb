class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :init

  private
  
  def init
        
    @platform = (session[:mobile]) ? 'mobile' : 'desktop'
    
    @user =  session[:id] ? Session.find_by_id(session[:id]).person : nil
    @links = Link.all
    @socials = Social.all
    @current = Show.current
    @picture_mode = 'any'
    
  end
  
end
