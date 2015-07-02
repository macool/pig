module Pig
  module Core
    class Plugins
      attr_accessor :name, :title, :url, :preferred_position, :icon, :active, :visible

      def initialize(*args)
        @plugins = Array.new(*args)
      end

      def self.register
        yield(plugin = new)

        registered << plugin
      end

      def self.registered
        @registered_plugins ||= []
      end
    end
  end
end
