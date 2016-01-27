module Pig
  module Concerns
    module Versionable
      extend ActiveSupport::Concern

      included do
        has_paper_trail class_name: 'Pig::Version',
                        if: proc { |t| t.status == 'published' }
      end

    end
  end
end
