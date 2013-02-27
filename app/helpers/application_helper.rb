module ApplicationHelper

  def login_path
    '/login'
  end

  def logout_path
    '/logout'
  end

  def contact_path
    '/contact'
  end

  def fb_link
    'http://www.facebook.com/GDPProductions'
  end

  def twitter_link
    'http://twitter.com/#!/@GDP_Productions'
  end
  
  def mobile?
    session[:mobile]
  end
  
end
  