class SocialsController < ApplicationController
  # GET /socials
  # GET /socials.json
  def index
    @socials = Social.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @socials }
    end
  end

  # GET /socials/1
  # GET /socials/1.json
  def show
    @social = Social.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @social }
    end
  end

  # GET /socials/new
  # GET /socials/new.json
  def new
    @social = Social.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @social }
    end
  end

  # GET /socials/1/edit
  def edit
    @social = Social.find(params[:id])
  end

  # POST /socials
  # POST /socials.json
  def create
    @social = Social.new(params[:social])

    respond_to do |format|
      if @social.save
        format.html { redirect_to @social, notice: 'Social was successfully created.' }
        format.json { render json: @social, status: :created, location: @social }
      else
        format.html { render action: "new" }
        format.json { render json: @social.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /socials/1
  # PUT /socials/1.json
  def update
    @social = Social.find(params[:id])

    respond_to do |format|
      if @social.update_attributes(params[:social])
        format.html { redirect_to @social, notice: 'Social was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @social.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /socials/1
  # DELETE /socials/1.json
  def destroy
    @social = Social.find(params[:id])
    @social.destroy

    respond_to do |format|
      format.html { redirect_to socials_url }
      format.json { head :no_content }
    end
  end
end
