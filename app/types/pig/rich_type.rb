module Pig
  class RichType < Type
    def get(content_package)
      super(content_package).html_safe
    end
  end
end
