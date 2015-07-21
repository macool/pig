module Pig
  class TextType < Type
    def get
      super.html_safe
    end
  end
end
