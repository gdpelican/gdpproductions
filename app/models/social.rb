class Social < ActiveRecord::Base
  
  validates_presence_of :name 
  validates_presence_of :alt 
  validates_presence_of :link
  validates_attachment_presence :icon

  has_attached_file :icon, 
    :path => "socials/:style/:id/:filename",
    :styles => {:icon => "100x100#"}
  
end
