module Pig
  class ResourceTagCategory < ActiveRecord::Base
    self.table_name = 'pig_resource_tag_categories'
    belongs_to :tag_category
    belongs_to :taggable_resource, :polymorphic => true
  end
end