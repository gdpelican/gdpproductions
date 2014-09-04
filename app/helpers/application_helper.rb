module ApplicationHelper

  def render_locale_partial(partial)
    return unless locale = ENV.fetch('LOCALE', nil)
    render "partials/locales/#{locale.downcase}/#{partial}", locale: locale
  end

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
  
end
  