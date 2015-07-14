require 'active_support/concern'

module Pig
  module Concerns
    module Recordable
      extend ActiveSupport::Concern

      included do
        has_many :activity_items, :as => :resource, :class_name => "ActivityItem"
        attr_accessor :editing_user
        validates :editing_user, presence: true
        after_create { record_activity!(self.editing_user, "#{self.name} was created") }
        after_update :record_update
        before_destroy { record_activity!(self.editing_user, "#{self.name} was permanently deleted") }
      end

      def record_update
        if self.deleted_at_changed?
          record_activity!(self.editing_user,  "#{self.name} was deleted")
        else
          record_activity!(self.editing_user,  "#{self.name} was updated")
        end
      end

      def record_activity!(user, text)
        self.activity_items.create(user_id: user.id, text: text)
      end
    end
  end
end
