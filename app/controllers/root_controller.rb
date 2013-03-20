class RootController < ActionController::Base
  protect_from_forgery
  
  def index
  		redirect_to :controller => (session[:mobile]) ? :links : :about, :action => :index
  end
  
end
