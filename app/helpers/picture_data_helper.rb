module PictureDataHelper

  def get_picture
      case @picture_mode
        when 'any'
          @picture = Picture.random(nil)
        when 'current'
          @picture = Picture.random(Show.current)
        else
          @picture = Picture.random(Show.find(@picture_mode))
      end
  end

end
