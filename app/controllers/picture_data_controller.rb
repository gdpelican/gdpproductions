class PictureDataController < ApplicationController

  def index

   @picture = Picture.get_picture(params[:mode] || 'any', params[:id] || -1)

    respond_to do |format|
      format.json { render :json => build_json(@picture) }
    end
  end
  
  def build_json(picture)
    if picture
      photographer = @picture.get_photographer
      { url: @picture.picture.url,
        caption: @picture.caption, 
        showTitle: @picture.show.title, 
        showDate: @picture.show.formatted_start_date, 
        photographer: photographer.to_s.empty? ? '' : 'Photo credit: ' + photographer }
    end
  end

end
