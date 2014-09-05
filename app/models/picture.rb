class Picture < ActiveRecord::Base

  belongs_to :show

  validates_presence_of :alt
  validates_presence_of :show_id
  #validates_presence_of :cover_photo_ind

  validates_attachment_presence :picture

  has_attached_file :picture,
    :path => "pictures/:style/:id/:filename",
    :styles => {
       :original => "1024x800",
       :mobile => "500x400",
       :thumb  => "250x250",
       :tiny => "100x100"}

  def as_json(mobile = false, options = nil)
    picture_photographer = photographer.presence || show.photographer
    data = { id: self.id, 
             show_id: show.id.to_s,
             caption: self.caption,
             photographer: if picture_photographer.presence then 'Photo Credit: ' + picture_photographer end,
             start_date: show.formatted_start_date,
             title: show.title,
             url: if mobile then picture.url(:thumb) else picture.url end }
     
    data[:has_others] = Picture.has_other_picture(show) unless mobile
    
    data
  end
  
  def traverse(direction)
    index = show.pictures.index(self)
    case(direction.to_sym)
    when :prev then show.pictures[index-1]
    when :next then show.pictures[index+1] || show.pictures[0]
    end
  end

  def self.find(id, direction = nil)
    picture = super(id)
    if direction then picture.traverse(direction) else picture end
  end

  def self.has_other_picture(show)
    if(show == nil)
      self.where(cover_photo_ind: true).count > 1
    else
      show.pictures.where(cover_photo_ind: true).count > 1
    end
  end
  
  private 
  
  def self.random(show, current)
    if (show == nil)
      self.where(:cover_photo_ind => true)
      .where('id NOT IN (?)', current || -1)
      .first(:order => "RANDOM()")
    else
      show.pictures.where(:cover_photo_ind => true)
      .where('id NOT IN (?)', current || -1)
      .first(:order => "RANDOM()")
    end
  end

end
