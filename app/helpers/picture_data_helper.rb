module PictureDataHelper

  def get_picture
      
      case @picture_mode
        when 'any'
          @picture = Picture.random(nil, @past_id)
        when 'current'
          @picture = Picture.random(Show.current, @past_id)
        else
          @picture = Picture.random(Show.find(@picture_mode), @past_id)
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
