class ContactMailer < ActionMailer::Base
  def contact_email(contact)
    mail :from    => contact.email,
         :subject => contact.subject,
         :to      => email_recipient
  end

  def email_recipient
    'james.kiesel@gmail.com'
  end

end
