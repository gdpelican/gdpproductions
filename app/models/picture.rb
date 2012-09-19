class Picture < ActiveRecord::Base
  
  belongs_to :show 
  
  validates_presence_of :alt 
  validates_presence_of :show_id
  #validates_presence_of :cover_photo_ind
  
  validates_attachment_presence :picture

  has_attached_file :picture,
     :styles => {
       :original => "1024x800",
       :thumb  => "250x250",
       :tiny => "100x100"},
     :storage => :s3,
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename",
     :bucket => 'GDProd-TEST'

  def self.random(show, current)
    if (show == nil)
      self.first(:order => "RANDOM()")
    else
      show.pictures.first(:order => "RANDOM()")
    end
  end
  
  def self.has_other_picture(show)
    if(show == nil)
      self.where(:cover_photo_ind => true).count > 1
    else
      show.pictures.where(:cover_photo_ind => true).count > 1
    end
  end
  
end
