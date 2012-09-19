module PictureDataHelper

  def get_picture
      if !@picture.nil?
        current = @picture.id
      else
        current = -1
      end
      
      case @picture_mode
        when 'any'
          @picture = Picture.random(nil, current)
        when 'current'
          @picture = Picture.random(Show.current, current)
        else
          @picture = Picture.random(Show.find(@picture_mode), current)
      end
  end
  
  def has_other_picture
    case @picture_mode
      when 'any'
        Picture.has_other_picture(nil)
      when 'current'
        Picture.has_other_picture(Show.current)
      else
        Picture.has_other_picture(Show.find(@picture_mode))
    end
  end

end
