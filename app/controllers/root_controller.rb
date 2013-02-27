class RootController < ApplicationController
  
  def index
    case @platform
    when 'mobile' 
      redirect_to :action => 'index', :controller => 'links'
    when 'desktop'
      redirect_to :action => 'index', :controller => 'about'
    end
  end

end
