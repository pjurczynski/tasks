require 'mini_magick'

class Person < ActiveRecord::Base
  has_many :tasks, :conditions => { :date_finish => nil } 

  IMG_PATH = "public/images/people/"
  IMG_SIZE = '200x200'
  RATIO = { :height => 1, :width => 1 }
  def self.upload_img file
    fn = file.original_filename
    fp = File.join IMG_PATH, fn
    written = File.open(fp, 'wb') { |f| f.write file.read }

    return written
  end

  def self.create_min_image filename

    fp = IMG_PATH + filename
    img = MiniMagick::Image.open(fp)

    crop_image img

    #create miniature
    img.resize IMG_SIZE 
    img.write File.join( IMG_PATH, filename)
  end
  
  def self.crop_image image
    #crop
    rx = image['width'] / RATIO[:width]
    ry = image['height'] / RATIO[:height]

    if rx > ry
      shave_y = 0
      shave_x = (image['width'] - (ry * RATIO[ :width ])) / 2
    else
      shave_y = (image['height'] - (rx * RATIO[ :height ])) / 2
      shave_x = 0
    end

    return image.shave("#{shave_x}x#{shave_y}")
  end

end
