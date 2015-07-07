module Pig
  class ResourceTagCategory < ActiveRecord::Base

    belongs_to :tag_category
    belongs_to :taggable_resource, :polymorphic => true
  end
end
