module Pig
  class RedactorImageUpload < ActiveRecord::Base

    dragonfly_accessor :file
    validates_property :format, :of => :image, :in => [:jpeg, :jpg, :png, :gif, :JPEG, :JPG, :PNG, :GIF], :message => "must be an image"
    validates :file_uid, :presence => true

    def image
      file_type == 'image' ? file : nil
    end
  end
end
