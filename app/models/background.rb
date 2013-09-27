class Background

  attr_accessor :picture, :mode
  
  def initialize(mobile=false, mode='any', past_id=nil)
    @picture = get_picture(mobile, mode, past_id)
    @mode = mode 
  end
  
  private
  
  def get_picture(mobile, mode, past_id)
    case mode
      when 'any'
        Picture.random(nil, past_id).as_json(mobile)
      when 'current'
        Picture.random(Show.current, past_id).as_json(mobile)
      else
        Picture.random(Show.find(mode), past_id).as_json(mobile)
    end
  end

end