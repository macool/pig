module Pig
  class StringType < Type
    def get
      super.try(:html_safe)
    end
  end
end
