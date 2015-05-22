require "pig/engine"
# require 'stringex'
# require 'ym_core'
# require 'ym_users'
# require 'ym_tags'
# require 'ym_activity'
# require 'pig/engine'
# require 'ym_posts'
require 'geocoder'
# require 'dragonfly'
# require 'acts-as-taggable-on'
# if defined?(YmDocuments)
#   require 'ym_documents'
# end

require_relative 'pig/routing'
require_relative "pig/permalinkable"

module Pig
   def self.config(&block)
    yield Engine.config if block
    Engine.config
  end
end


# Dir[File.dirname(__FILE__) + '/pig/models/*.rb'].each {|file| require file }
# Dir[File.dirname(__FILE__) + '/pig/controllers/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/pig/permalinks/*.rb'].each {|file| require file }
# # if defined?(YmDocuments)
# #   Dir[File.dirname(__FILE__) + '/ym_documents/**/*.rb'].each {|file| require file }
# # end

# require 'cocoon'
# require 'oembed'
# OEmbed::Providers.register(OEmbed::Providers::Flickr,OEmbed::Providers::Instagram,OEmbed::Providers::Scribd,OEmbed::Providers::SoundCloud,OEmbed::Providers::Slideshare,OEmbed::Providers::Youtube,OEmbed::Providers::Vimeo)
