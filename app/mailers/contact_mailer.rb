class ContactMailer < ActionMailer::Base
  default to: 'contact@gdpproductions.com'
  
  def contact_email(message)
    @message = message
    mail(from: message.email, subject: 'New message from #{message.name}')
  end
end
