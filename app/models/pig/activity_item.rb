module Pig
  class ActivityItem < ActiveRecord::Base
    self.table_name = 'pig_activity_items'

    belongs_to :user
    belongs_to :resource, :polymorphic => true
    belongs_to :parent_resource, :polymorphic => true
    validates :user, :presence => true

    class << self

      def default_scope
        order("created_at DESC")
      end

    end

  end
end
