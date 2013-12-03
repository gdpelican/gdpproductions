class AboutController < ApplicationController

  before_filter :init_descriptions

  def index
    @title = 'About Us' 
  end

  def init_descriptions
    @description = Hash.new
    @description['fast'] = 'We believe in making theatre quickly and without abandon. We strive to be prolific, and create sensational work under duress.'
    @description['twisted'] = 'Our work is designed to appeal to the dark side of your inner child. Remember all those shows you weren\'t allowed to watch growing up? The girls you weren\'t allowed to kiss? The games that were \'for the big kids\'? Now\'s your chance. Come join us.'
    @description['cool'] = 'We strive to include and promote skillsets other than \'Acting\' - Stage combat, puppetry, clowning, circus skills, and burlesque are a mainstay of our productions, and we\'re always on the lookout for new and vivid art forms to include in our work.'
    @description['cheap'] = 'We want you to come see us. That\'s the most important thing. We think theatre should be like good bread, not fine wine, so we do everything we can to keep our production and entrance costs low. It\'s imperative that our shows are accessible to everyone, even those on a budget. (Hey, isn\'t that all of us?)'
  end

end
