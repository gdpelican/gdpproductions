class ScaffoldController < ProtectedController
  
  def index
    set_instance model.all, true
    respond
  end

  def show
    load_instance
    respond
  end
  
  def new
    set_instance model.new
    respond
  end

  def edit
    load_instance
    respond
  end

  def create
    set_instance model.new(params[controller_name.singularize.to_sym])

    respond_to do |format|
      if instance.save
        format.html { redirect_to instance, notice: "#{controller_name.singularize.humanize} was successfully created." }
        format.json { render json: instance, status: :created, location: instance }
      else
        format.html { render action: "new" }
        format.json { render json: instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /socials/1
  # PUT /socials/1.json
  def update
    load_instance

    respond_to do |format|
      if instance.update_attributes(params[controller_name.singluarize.to_sym])
        format.html { redirect_to instance, notice: "#{controller_name.singularize.humanize} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: instance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    load_instance.destroy

    respond_to do |format|
      format.html { redirect_to send "#{controller_name.pluralize}_url" }
      format.json { head :no_content }
    end
  end
  
  private
  
  def respond(plural=false)
    respond_to do |format|
      format.html
      format.xml { render xml: instance(plural) }
      format.json { render json: instance(plural) }
    end
  end
  
  def instance(plural=false)
    instance_variable_get variable_name(plural)
  end
  
  def set_instance(value, plural=false)
    instance_variable_set variable_name(plural), value
  end
  
  def load_instance
    set_instance model.find(params[:id]) unless instance
  end
  
  def variable_name(plural=false)
    "@#{plural ? controller_name.pluralize : controller_name.singularize}"
  end
    
  def model
    controller_name.singularize.humanize.constantize
  end

end
