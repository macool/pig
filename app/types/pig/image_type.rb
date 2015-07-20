module Pig
  class ImageType

    # dragonfly_accessor :file

    def file_uid
      # read_attribute(:value)
      "2015/01/19/10/59/38/589/family.png"
    end

    def file_uid=(uid)
      self.value = uid
    end

    def self.build(value)
      # TODO
      puts "Building image"
      Dragonfly.app.fetch('2015/01/19/10/59/38/589/puppy.jpg')
    end

  end
end
