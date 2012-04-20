class Contact
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :email, :message, :name, :subject

  validates :email,   :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i },
                      :presence => true
  validates :message, :presence => true
  validates :name,    :presence => true
  validates :subject, :presence => true

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end
  
  def save
    if self.valid?
      deliver_message
      return true
    end
    return false
  end

  def deliver_message
    ContactMailer.contact_email(self).deliver
  end

  def persisted?
    false
  end

end