module Pig
  module Concerns
    module Models
      module Name

        extend ActiveSupport::Concern

        def full_name
          "#{first_name} #{last_name}".strip
        end

        def full_name=(val)
          names = val.split(" ")
          self.last_name = names.pop if names.length > 1
          self.first_name = names.join(" ")
          val
        end

      end
    end
  end
end
