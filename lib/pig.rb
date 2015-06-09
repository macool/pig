require "pig/engine"
require "pig/config"
require 'stringex'
require 'formtastic-bootstrap'
# require 'ym_core'
require 'ym_users'
# require 'ym_tags'
# require 'ym_activity' #TODO
# require 'pig/engine'
# require 'ym_posts'
require 'rack/cache'
require 'dragonfly'
require 'geocoder'
require 'acts-as-taggable-on'
# if defined?(YmDocuments)
#   require 'ym_documents'
# end

require_relative 'pig/routing'
require_relative "pig/permalinkable"
require_relative "pig/activity/recordable"

module Pig

  class << self
    attr_writer :configuration
  end

  module_function
  def configuration
    @configuration ||= Config.new
  end

  def setup
    yield(configuration)
  end

end


# Dir[File.dirname(__FILE__) + '/pig/models/*.rb'].each {|file| require file }
# Dir[File.dirname(__FILE__) + '/pig/controllers/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/pig/permalinks/*.rb'].each {|file| require file }
# # if defined?(YmDocuments)
# #   Dir[File.dirname(__FILE__) + '/ym_documents/**/*.rb'].each {|file| require file }
# # end

require 'cocoon'
# require 'oembed'
# OEmbed::Providers.register(OEmbed::Providers::Flickr,OEmbed::Providers::Instagram,OEmbed::Providers::Scribd,OEmbed::Providers::SoundCloud,OEmbed::Providers::Slideshare,OEmbed::Providers::Youtube,OEmbed::Providers::Vimeo)
