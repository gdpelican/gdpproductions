class PicturesController < ScaffoldController
  
  before_filter :get_show
  
  def new
    @picture = Picture.new
    @show = Show.find(params[:show_id])
  end

  def index
    @thumb_size = :thumb
    respond_to do |format|
      format.html
    end
  end

  def show

    @picture = Picture.find(params[:id], params[:direction])
    @footer = false

    respond_to do |format|
      format.html # show.html.erb
      format.js { render 'show', locals: { instant: false, picture: @picture.as_json(session[:mobile]) } }
    end
  end

  def create
    @picture = Picture.new(params[:picture].merge(show_id: @show.id))
    respond_to do |format|
      if @picture.save
        format.html { redirect_to [@show, @picture], notice: success_notice }
      else
        format.html { render action: :new }
      end
    end
  end

  private
  
  def get_show
    @show = Show.find(params[:show_id])
    @background = Background.new session[:mobile], params[:show_id]
  end
  
end
