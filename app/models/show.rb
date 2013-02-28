class Show < ActiveRecord::Base
  
  has_many :pictures              
  belongs_to :venue

  validates_presence_of :title 
  validates_presence_of :start_date 
  validates_presence_of :end_date
  validates_presence_of :description
  validates_presence_of :blurb
  validates_presence_of :venue_id
  validates_attachment_presence :thumb

  has_attached_file :thumb,
     :styles => {:thumb=> "250x250#"},
     :storage => :s3,
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => '/:style/:id/:filename',
     :bucket => 'GDProdThumbs-TEST'

  def self.current
    upcoming = where("shows.end_date > ?", Time.new).order('shows.end_date ASC')
    if (upcoming.any?)
      upcoming.first
    else
      last(:order => "end_date")
    end
  end

  def self.history
    find(:all, :order => 'start_date DESC')
  end
  
  def self.thumb
    image_tag self.thumb.url(:thumb)
  end
  
  def column_count
    count = self.pictures.count
    if count > 6
      3
    elsif count > 1
      2
    else
      1
    end
  end
  
end