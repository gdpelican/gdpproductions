class ContactMailer < ActionMailer::Base
  default :to => 'james.kiesel@gmail.com',
          :from => 'contact@gdpproductions.com',
          :template_path => 'contacts'

  def contact_email(contact)
    @contact = contact
    mail :subject => contact.subject
  end

end