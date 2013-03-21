class PicturesController < ProtectedController
  
  before_filter :one_show, :only => [:show, :page]
  before_filter :any_show, :only => [:index]

  def one_show
    begin
      @picture_mode = Picture.find(params[:id]).show.id
    rescue
      @picture_mode = 'current'
    end
  end
      
  def any_show
    @picture_mode = 'any'
  end
  
  # GET /pictures
  # GET /pictures.xml
  def index
        
    if (params[:mode].nil?)
      params[:mode] = 'any'
    end 
       
    case params[:mode]
      when 'any'
        @picture = Picture.random(nil)
      when 'current'
        @picture = Picture.random(Show.current)
      else
        @picture = Picture.random(Show.find(params[:mode]))
    end
    
    if @picture.nil?
      @picture = Picture.random(nil)
    end
        
    respond_to do |format|
      format.html { render :show, :id => @picture.id, :layout => false }
      format.xml  { render :xml => @picture }
      format.json { render :json => @picture }
    end

  end

  # GET /pictures/1
  # GET /pictures/1.xml
  def show

    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @picture }
      format.json { render :json => @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.xml
  def new
    @picture = Picture.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.xml
  def create
    @picture = Picture.create(params[:picture])
  
    respond_to do |format|
      if @picture.save
        format.html { redirect_to(@picture, :notice => 'Picture was successfully created.') }
        format.xml  { render :xml => @picture, :status => :created, :location => @picture }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.xml
  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to(@picture, :notice => 'Picture was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.xml
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to(pictures_url) }
      format.xml  { head :ok }
    end
  end
end
