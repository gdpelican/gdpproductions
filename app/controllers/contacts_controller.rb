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
    @fields['greeting'] = 'If you\'ve got a question, comment, proposition, or otherwise want to get in touch, we\'re excited to hear from you! Just fill out the form below and you\'ll hear from us shortly.'
    @fields['name'] = 'Your Name: '
    @fields['email'] = 'Email: '
    @fields['subject'] = 'Subject: '
    @fields['message'] = 'Message: '
    @fields['submit'] = 'Send!'
    @fields['success'] = 'Message successfully sent'
    @fields['error'] = 'Sorry, something went wrong! Please try again in a few minutes'
    @fields['recipient'] = 'james.kiesel@gmail.com'
  end

end