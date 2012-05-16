class Social < ActiveRecord::Base
  
  validates_presence_of :name 
  validates_presence_of :alt 
  validates_presence_of :link
  validates_attachment_presence :icon

  has_attached_file :icon,
     :styles => {:icon => "100x100#"},
     :storage => :s3,
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => '/:style/:id/:filename',
     :bucket => 'GDProdSocials-TEST'
  
end
