<<<<<<< HEAD
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
=======
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
>>>>>>> a1a21b67793ea5c220162c3159b73dd9ccf2f233
