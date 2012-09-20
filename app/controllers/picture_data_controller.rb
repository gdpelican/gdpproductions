class PictureDataController < ApplicationController

  def index

   @picture_mode = params[:mode] || 'any'
   @past_id = params[:id] || -1

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @picture }
    end
  end

end
