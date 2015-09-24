module Pig
  class DateType < Type
    def get(content_package)
      return nil unless content_value(content_package).present?
      Date.parse(content_value(content_package))
    end
  end
end
