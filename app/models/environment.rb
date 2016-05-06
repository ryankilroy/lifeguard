class Environment < ActiveRecord::Base
  belongs_to :user

  delegate :team, to: :user

  IMAGE_MAP = {
    'kitkat' => 'http://i.giphy.com/lXiRrD2S7wYHI2ePu.gif',
    'smarties' => 'http://s3.amazonaws.com/spoonflower/public/design_thumbnails/0306/9689/Smarties_pattern_small_shop_thumb.png',
    'aero' => 'https://cocoanibs.files.wordpress.com/2012/06/aero4.jpeg',
    'twix' => 'http://i5.walmartimages.com/dfw/dce07b8c-f0c7/k2-_7eb8c0fa-d77e-4b9d-aece-daefa9c4b975.v5.jpg',
    'nerds' => 'http://thumbs1.ebaystatic.com/d/l225/m/m-ucuVwvAq5eRP8pBbDImCQ.jpg',
    'skor' => 'https://www.hersheycanada.com/images/hersheycanada/main/brands/skor/hero-bar.png',
    'pocky' => 'http://ecx.images-amazon.com/images/I/51XZ4Z77L3L._SX425_.jpg',
    'butterfinger' => 'http://scene7.targetimg1.com/is/image/Target/13204178?wid=480&hei=480',
    'pringles' => 'http://i.giphy.com/PBXmBAONkbiXC.gif',
    'bounty' => 'http://londonpride.com/wp-content/uploads/2013/08/milk-bounty-bar-2.jpg'
  }
end
