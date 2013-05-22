module PictureDataHelper
  
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
