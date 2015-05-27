module Pig
  class TagCategory < ActiveRecord::Base
    self.table_name = 'pig_tag_categories'

    acts_as_ordered_taggable_on :taxonomy
    acts_as_tagger
    has_many :resource_tag_categories
    has_many :content_types, :through => :resource_tag_categories, :source => :taggable_resource, :source_type => 'ContentType'


    def tag_count_for(tag)
      ActsAsTaggableOn::Tagging.where(tag: tag, tagger: self).count
    end

  end
end
