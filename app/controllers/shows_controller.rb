class ShowsController < ProtectedController
  
  before_filter :one_show, :only => [:show, :page]

  def one_show
    mode = (params[:id] == 'current' and @current.end_date.nil?) ? 'any' : params[:id]
    @background = Background.new session[:mobile], mode
  end
  
  # GET /shows
  # GET /shows.xml
  def index
    @shows = Show.history
    @title = 'Our Productions'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shows }
    end
  end

  # GET /shows/1
  # GET /shows/1.xml
  def show
    if (params[:id] == 'current')
      @show = Show.current
    else
      @show = Show.find(params[:id])
    end

    @title = @show.title

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @show }
    end
  end

  # GET /shows/new
  # GET /shows/new.xml
  def new
    @show = Show.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @show }
    end
  end

  # GET /shows/1/edit
  def edit
    @show = Show.find(params[:id])
  end

  # POST /shows
  # POST /shows.xml
  def create
    
    @show = Show.create(params[:show])
    @title = 'Create a new show'
    
    respond_to do |format|
      if @show.save
        format.html { redirect_to(@show, :notice => 'Show was successfully created.') }
        format.xml  { render :xml => @show, :status => :created, :location => @show }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @show.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shows/1
  # PUT /shows/1.xml
  def update
    @show = Show.find(params[:id])
    @title = 'Update a show'

    respond_to do |format|
      if @show.update_attributes(params[:show])
        format.html { redirect_to(@show, :notice => 'Show was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @show.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.xml
  def destroy
    @show = Show.find(params[:id])
    @show.destroy

    respond_to do |format|
      format.html { redirect_to(shows_url) }
      format.xml  { head :ok }
    end
  end
  
  def info
    @show = Show.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
end
