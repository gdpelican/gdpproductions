class MobileController < ApplicationController
  
  def on
    session[:mobile] = true
    redirect
  end
  
  def off
    session[:mobile] = nil
    redirect
  end
  
  def redirect
    redirect_to controller: :root, action: :show
  end
  
end
