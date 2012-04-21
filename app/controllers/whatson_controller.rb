<<<<<<< HEAD
class WhatsOnController < ApplicationController
  # GET /pictures
  # GET /pictures.xml
  def index
    
    @show = Show.current

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.xml
  def show
    
    @show = Show.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @picture }
    end
  end

end
=======
class WhatsOnController < ApplicationController
  # GET /pictures
  # GET /pictures.xml
  def index
    
    @show = Show.current

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.xml
  def show
    
    @show = Show.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @picture }
    end
  end

end
>>>>>>> a1a21b67793ea5c220162c3159b73dd9ccf2f233
