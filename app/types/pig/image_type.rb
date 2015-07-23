module Pig
  class ImageType < Type
    def decorate(content_package)
      this = self
      slug = @slug
      field_type = @field_type
      super(content_package)
      # content_package.class.send(:extend, Dragonfly::Model)
      # content_package.class.send(:dragonfly_accessor, @slug.to_sym)
      content_package.define_singleton_method("#{@slug}_uid") do
        this.content_value(content_package)
      end
      content_package.define_singleton_method("#{@slug}_uid=") do |value|
        content_package.content['content_chunks'] ||= {}
        content_package.content['content_chunks'][slug] = {
          'value' => value,
          'field_type' => field_type
        }
        content_package.content_will_change! if Rails.version.to_f < 4.2
      end
    end

    def get(content_package)
      if super(content_package).blank?
        nil
      else
        Dragonfly.app.fetch(super(content_package))
      end
    end

    def set(content_package, value)
      # TODO fix this - at the moment it writes the file to disk as soon as you
      # call the image= method, this should write a temp file and only store
      # after save?
      temp_file = Tempfile.new('image')
      temp_file.write(value)
      temp_file.close
      uid = Dragonfly.app.fetch_file(temp_file.path).store
      super(content_package, uid)
    end
  end
end
