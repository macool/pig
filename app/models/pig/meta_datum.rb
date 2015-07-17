module Pig
  class MetaDatum < ActiveRecord::Base

    dragonfly_accessor :image
    validates :page_slug, presence: true

    def to_s
      "/#{page_slug}"
    end
  end
end
