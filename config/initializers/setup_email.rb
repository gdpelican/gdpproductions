
email_settings = YAML::load(File.open("#{Rails.root.to_s}/config/email.yml"))
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = email_settings[Rails.env] unless email_settings[Rails.env].nil?
