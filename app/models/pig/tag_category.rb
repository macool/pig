module Pig
  class TagCategory < ActiveRecord::Base

    acts_as_ordered_taggable_on :taxonomy
    acts_as_tagger
    has_many :resource_tag_categories
    has_many :content_types, through: :resource_tag_categories, source: :taggable_resource, source_type: 'ContentType'
    before_validation :set_slug, on: :create

    validates :name, :slug, presence: true, uniqueness: true

    def tag_count_for(tag)
      ActsAsTaggableOn::Tagging.where(tag: tag, tagger: self).count
    end

    private

    def set_slug
      return unless name
      self.slug = name.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
    end

  end
end
