module Pig
  class ImageType < Type
    def get
      Dragonfly.app.fetch(super)
    end

    def decorate(content_package)
      super
      content_package.class.send(:extend, Dragonfly::Model)
      content_package.class.send(:dragonfly_accessor, @slug.to_sym)
      content_package.class.send(:define_method, "#{@slug}_uid") do
        @content_value
      end
    end
  end
end
