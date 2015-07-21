module Pig
  class RichContentType < Type
    def get
      super.html_safe
    end
  end
end
