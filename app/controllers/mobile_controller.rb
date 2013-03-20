class MobileController < ApplicationController
  
  def on
    session[:mobile] = true
    redirect_to :controller => :mobile , :action => :show
  end
  
  def off
    session[:mobile] = nil
    redirect_to :controller => :mobile , :action => :show
  end
  
  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
end
