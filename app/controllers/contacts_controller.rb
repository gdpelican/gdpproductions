class ContactsController < ApplicationController

  before_filter :define_fields

  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      flash[:notice] = @fields['success']
    else
      flash[:error] = @fields['error']
    end
    render :show
  end

  def show
    @contact = Contact.new
  end

  def define_fields
    @fields = Hash.new
    @fields['name'] = 'Your Name: '
    @fields['email'] = 'Email: '
    @fields['subject'] = 'Subject: '
    @fields['message'] = 'Message: '
    @fields['submit'] = 'Send!'
    @fields['success'] = 'Message successfully sent'
    @fields['error'] = 'Sorry, something went wrong! Please try again in a few minutes'
  end

end