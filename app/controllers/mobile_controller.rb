class MobileController < ApplicationController
  
  def on
    session[:mobile] = true
    redirect_to :controller => :links, :action => :index
  end
  
  def off
    session[:mobile] = nil
    redirect_to :controller => :about , :action => :index
  end
  
  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
end
