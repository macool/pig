module Pig
  class BooleanType < Type
    def get
      !content_value.to_i.zero?
    end
  end
end
