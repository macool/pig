module Pig
  module Concerns
    module Versionable
      extend ActiveSupport::Concern

      included do
        has_paper_trail class_name: 'Pig::Version',
                        if: proc { |t| t.status_was == 'published' }
      end

      def live_version
        return self if published?
        return versions.last.reify if versions.any?
        self
      end

      def preview_version
        self
      end

    end
  end
end
