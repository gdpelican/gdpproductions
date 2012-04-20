class SessionsController < ApplicationController
  
  before_filter :require_logout, :only => [:new, :create]

  # GET /sessions
  def index
    redirect_to new_session_path
  end

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # POST /sessions
  def create
    @session = Session.new(params[:session])
    if @session.save
      session[:id] = @session.id
      redirect_to root_url
    else
      redirect_to login_path
    end
  end

  # DELETE /sessions/1
  def destroy
    if session[:id]
      Session.find(session[:id]).destroy
      session[:id] = @user = nil
    end
    redirect_to root_url
  end

  def require_logout
    if session[:id]
      flash[:error] = 'You must be logged out to complete this action'
      redirect_to root_url
    end
  end

end
