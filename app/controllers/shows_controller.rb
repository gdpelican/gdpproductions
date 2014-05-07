class ShowsController < ScaffoldController
  
  before_filter :one_show, :only => [:show, :page]
  
  def index
    @title = 'Our Productions'
    @shows = Show.history
    super
  end

  def show
    @show = params[:id] == 'current' ? Show.current : Show.find(params[:id])
    @title = @show.title
    super
  end

  def create
    @title = 'Create a new show'
    super
  end

  def update
    @title = 'Update a show'
    super
  end
  
  def info
    @show = Show.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
  private

  def one_show
    mode = (params[:id] == 'current' and @current.end_date.nil?) ? 'any' : params[:id]
    @background = Background.new session[:mobile], mode
  end
  
end
