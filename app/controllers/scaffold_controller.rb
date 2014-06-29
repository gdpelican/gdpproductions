class ScaffoldController < ProtectedController
  
  def index
    set_instance model.all
    get_respond
  end

  def show
    load_instance
    get_respond
  end
  
  def new
    set_instance model.new
    get_respond
  end

  def edit
    load_instance
    get_respond
  end

  def create
    set_instance model.new(params[controller_name.singularize.to_sym])
    post_respond instance.save, :new
  end

  def update
    load_instance
    post_respond instance.update_attributes(params[controller_name.singularize.to_sym]), :edit
  end

  def destroy
    load_instance.destroy
    respond_to do |format|
      format.html { redirect_to send "#{controller_name.pluralize}_url" }
      format.json { head :no_content }
    end
  end
  
  private
  
  def get_respond
    respond_to do |format|
      format.html
      format.xml { render xml: instance }
      format.json { render json: instance }
    end
  end

  def post_respond(success, failure_action)
    respond_to do |format|
      if success
        format.html { redirect_to instance, notice: success_notice }
        format.json { head :no_content }
      else
        format.html { render action: failure_action }
        format.json { render json: instance.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def instance
    instance_variable_get variable_name
  end
  
  def set_instance(value)
    instance_variable_set variable_name, value
  end
  
  def load_instance
    set_instance model.find(params[:id]) unless instance
  end
  
  def variable_name
    case action_name
    when 'index' then "@#{controller_name.pluralize}"
    else              "@#{controller_name.singularize}"
    end
  end
    
  def model
    controller_name.singularize.humanize.constantize
  end

  def success_notice
    "#{controller_name.singularize.humanize} was successfully #{action_name}d."
  end

end
