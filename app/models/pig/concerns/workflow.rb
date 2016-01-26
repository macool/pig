require 'active_support/concern'

module Pig
  module Concerns
    module Workflow
      extend ActiveSupport::Concern

      included do
        before_save :execute_transitions
      end

      class_methods do
        def statuses(user)
          statuses_for(user, self)
        end

        def check_ability(ability, instance, user)
          (ability || user).can? :manage, instance
        end

        def statuses_for(user, instance, ability = nil)
          statuses = {}
          statuses[:draft] = 'Draft' if check_ability(ability, instance, user)
          statuses[:pending] = 'Ready to review'
          statuses[:published] = 'Published' if check_ability(ability, instance, user)
          statuses[:expiring] = 'Getting old' if check_ability(ability, instance, user)
          statuses
        end

      end

      def statuses(user, ability)
        self.class.statuses_for(user, self, ability)
      end

      def execute_transitions
        execute_status_transition if status_changed?
        execute_author_transition if author_id_changed?
      end

      def execute_status_transition
        transitions = {
          draft: {
            pending: :ready_to_review,
            published: :notify_author_of_publish
          },
          pending: {
            draft: :assign_to_author,
            published: :notify_author_of_publish
          },
          published: {
            draft: :assign_to_author,
            published: :notify_author_of_publish
          }
        }
        event = transitions[status_was.to_sym][status.to_sym]
        send(event) if event
      end

      def execute_author_transition
        return if author.nil?
        assign_to_author
      end

      def notify_author_of_publish
        return if editing_user == last_edited_by
        ContentPackageMailer.published(self, last_edited_by).deliver_now
      end

      def ready_to_review
        self.last_edited_by_id = author_id
        self.author_id = nil
        puts "LAST_EDITED_BY_ID: #{self.last_edited_by_id}"
        ContentPackageMailer.assigned(self, requested_by).deliver_now
      end

      def assign_to_author
        return if @author_already_notified
        ContentPackageMailer.assigned(self, author).deliver_now
        @author_already_notified = true
      end

    end
  end
end
