class PictureDataController < ApplicationController

  def index

   if (params[:mode].nil?)
     @picture_mode = 'any'
   else
     @picture_mode = params[:mode]
   end

   @past_id = params[:id]

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @picture }
    end
  end

end
