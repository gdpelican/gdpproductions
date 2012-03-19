class Venue < ActiveRecord::Base

  has_many :shows

  validates_presence_of :name
  validates_presence_of :address
  
  validates_uniqueness_of :name

  geocoded_by :address

  after_validation :geocode

end
