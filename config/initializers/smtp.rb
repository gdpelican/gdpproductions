
smtp_server = 'smtpout.secureserver.net'
smtp_port = 25
smtp_domain = 'gdpproductions.com'
smtp_user = 'contact'
smtp_password = ''

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
 :address => smtp_server,
 :port => smtp_port,
 :domain => smtp_domain,
 :authentication => :login,
 :user_name => smtp_user,
 :password => smtp_password
}
