
class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  before_filter :init

  def change_background
    @background = Background.new session[:mobile], params[:mode], params[:id]
  
    respond_to do |format|
      format.js
    end
  end
  
  private
  
  def init
        
    @platform = (session[:mobile]) ? 'mobile' : 'desktop'
    
    @user =  session[:id] ? Session.find_by_id(session[:id]).person : nil
    @links = Link.all
    @socials = Social.all
    @current = Show.current   
    @background = Background.new session[:mobile] 
  end
  
end
