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
