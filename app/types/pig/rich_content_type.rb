module Pig
  class RichContentType < Type
    def get(content_package)
      super(content_package).html_safe
    end
  end
end
