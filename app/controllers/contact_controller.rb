class ContactController < ApplicationController

  def new
    @message = Email.new
    @title = 'Contact Us'
  end
  
  def create
    @message = Email.new(params[:email])
    
    respond_to do |format|
      if @message.save
        format.html { redirect_to root_path, notice: 'Message successfully sent. Thanks for getting in touch!' }
      else
        raise 'Broken!'
        format.html { render action: 'new', notice: 'Something went wrong! Please try again.' }
      end
    end

  end
end
