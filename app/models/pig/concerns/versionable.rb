module Pig
  module Concerns
    module Versionable
      extend ActiveSupport::Concern

      included do
        has_paper_trail class_name: 'Pig::Version',
                        if: proc { |t| t.status_was == 'published' }
      end

      def live_version

        if self.versions.any?
          return self.versions.last.reify
        end
        self
      end

    end
  end
end
