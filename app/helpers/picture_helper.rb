module PictureHelper

  def swap_picture_path(show_id, picture_id, direction)
    "/shows/#{show_id}/pictures/#{picture_id}/#{direction}"
  end
  
end
  