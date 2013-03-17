class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :init

  private
  
  def init
        
    session[:mobile] = params[:mobile] || 
                       session[:mobile] ||
                       request.user_agent =~ /WebOS|mobile/
    
    @user =  session[:id] ? Session.find_by_id(session[:id]).person : nil
    @links = Link.all
    @socials = Social.all
    @current = Show.current
    @picture_mode = 'any'
    
  end
  
end
