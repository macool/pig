require 'active_support/concern'

module Pig
  module Concerns
    module Workflow
      extend ActiveSupport::Concern

      included do
        before_save :execute_transition
      end

      def execute_transition
        return unless status_changed?
        transitions = {
          draft: {
            pending: :ready_to_review
          },
          pending: {
            draft: :assign_to_author
          },
          published: {
            draft: :assign_to_author
          }
        }
        event = transitions[status_was.to_sym][status.to_sym]
        send(event) if event
      end

      def ready_to_review
        self.author_id = nil
        ContentPackageMailer.assigned(self, requested_by).deliver
      end

      def assign_to_author
        ContentPackageMailer.assigned(self, author).deliver
      end

    end
  end
end
