class PicturesController < ProtectedController
  
  before_filter :get_show
  
  def get_show
    @show = Show.find(params[:show_id])
    @background = Background.new session[:mobile], params[:show_id]
  end
  
  # GET /pictures
  # GET /pictures.xml
  def index
    @thumb_size = :thumb
    respond_to do |format|
      format.html
    end

  end

  # GET /pictures/1
  # GET /pictures/1.xml
  def show

    @picture = Picture.find(params[:id])
    @footer = false

    respond_to do |format|
      format.html # show.html.erb
      format.js { render 'show', locals: { picture: @picture.as_json(session[:mobile]) } }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.xml
  def new
    @picture = Picture.new

    respond_to do |format|
      format.html # new.html.erb
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
    @picture.show_id = @show.id
  
    respond_to do |format|
      if @picture.save
        format.html { redirect_to(show_pictures_url(@picture), :notice => 'Picture was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.xml
  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to(show_pictures_url(@picture), :notice => 'Picture was successfully updated.') }
      else
        format.html { render :action => "edit" }
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
    end
  end
end
