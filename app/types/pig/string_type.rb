module Pig
  class StringType

    def self.build(value)
      puts "Building string"
      value.try(:html_safe)
    end

  end
end
