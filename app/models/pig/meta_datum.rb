module Pig
  class MetaDatum < ActiveRecord::Base
    self.table_name = 'pig_meta_data'
    image_accessor :image
    validates :page_slug, presence: true

    def to_s
      "/#{page_slug}"
    end
  end
end
