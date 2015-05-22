module PigMetaDatum
  class MetaDatum < ActiveRecord::Base

    image_accessor :image
    validates :page_slug, presence: true

    def to_s
      "/#{page_slug}"
    end
  end
end
