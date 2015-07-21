module Pig
  class StringType < Type
    def get(content_package)
      super(content_package).try(:html_safe)
    end
  end
end
