module ApplicationHelper
  
  def getPicture
    case @picture_mode
      when 'any'
        @picture = Picture.random(nil)
      when 'current'
        @picture = Picture.random(Show.current)
      else
        @picture = Picture.random(Show.find(@picture_mode))
    end
  end

  def login_path
    '/login'
  end

  def logout_path
    '/logout'
  end

  def message_sent_path
    '/high_voltage/pages#show, :id => "sent"'
  end
  
end
