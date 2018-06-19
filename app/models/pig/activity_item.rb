module Pig
  class ActivityItem < ActiveRecord::Base

    belongs_to :user
    belongs_to :resource, :polymorphic => true
    belongs_to :parent_resource, :polymorphic => true
    validates :user, :presence => true

    def next
      next_activity = user.activity_items.where(resource_id: resource_id).where("id > ?", id).last
      if next_activity
        next_activity
      else
        self
      end
    end


    def previous
      previous_activity = user.activity_items.where(resource_id: resource_id).where("id < ?", id).first
      if previous_activity
        previous_activity
      else
        self
      end
    end

    class << self

      def default_scope
        order("created_at DESC")
      end

    end

  end
end
