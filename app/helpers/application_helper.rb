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
  
  def show_pics_path(id)
    '/shows/' + id.to_s + '/pics'
  end
  
  def mobile?
    session[:mobile]
  end
  
  def get_picture
    @picture = @platform == 'mobile' ? Picture.get_picture(@picture_mode, nil) : nil
  end
  
end
  