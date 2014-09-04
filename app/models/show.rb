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
     :default_url => "/images/missing-#{ENV['LOCALE'].downcase}.jpg",
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => '/:style/:id/:filename',
     :bucket => 'GDProdThumbs-TEST'

  scope :history, -> { order(start_date: :desc) }

  def formatted_start_date
    self.start_date.strftime("%b %Y").tr('0', 'O')
  end

  def self.current
    upcoming = where("shows.end_date > ?", Time.new).order('shows.end_date ASC')
    if (upcoming.any?)
      upcoming.first
    else
      hiatus
    end
  end
  
  def self.hiatus
    hiatus = case ENV['LOCALE']
    when 'US' then { title: 'We\'ve gone international!', 
                     blurb: 'We\'re currently off in Wellington, New Zealand, doing some really cool stuff! ' + 
                    'Be sure to check it out, and watch this space for news, we\'ll be back stateside with ' +
                    'more fast, twisted, cool, cheap theater soon.' }
    when 'NZ' then { title: 'Stay tuned!', 
                     blurb: 'We\'ve got more fast, twisted, cool, cheap theater in the pipeline, watch this space!' }
    end
    Show.new hiatus if hiatus
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