class Link < ActiveRecord::Base
  
  validates_presence_of :text 
  validates_presence_of :link 
  
end
