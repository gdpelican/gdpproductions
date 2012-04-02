class ContactMailer < ActionMailer::Base
  def contact_email(contact)
    @contact = contact

    mail :from    => (ContactUs.mailer_from || @contact.email),
         :subject => ( @contact.subject if ContactUs.require_subject),
         :to      => ContactUs.mailer_to
  end
end
