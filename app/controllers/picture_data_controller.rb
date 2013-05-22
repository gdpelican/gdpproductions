class PictureDataController < ApplicationController

  def index

   @picture_mode = params[:mode] || 'any'
   @past_id = params[:id] || -1
   get_picture

    respond_to do |format|
      format.json { render :json => build_json }
    end
  end
  
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
  
  def build_json
    if @picture
      photographer = @picture.get_photographer
      { url: @picture.picture.url,
        caption: @picture.caption, 
        showTitle: @picture.show.title, 
        showDate: @picture.show.formatted_start_date, 
        photographer: photographer.to_s.empty? ? '' : 'Photo credit: ' + photographer }
    end
  end

end
