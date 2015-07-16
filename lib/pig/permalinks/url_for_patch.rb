module ActionDispatch
  module Routing
    module UrlFor

      def url_for_with_permalinks(options = nil)
        permalink = extract_permalink(options)
        url = url_for_without_permalinks(options)
        if permalink && !permalink.changed?
          url.sub(permalink.resource_path, Pig.configuration.nested_permalinks ? permalink.full_path : "/#{permalink.path}")
        else
          url
        end
      end
      alias_method_chain :url_for, :permalinks

      private
      def extract_permalink(options)
        case options
        when Hash
          return nil if options.delete(:permalink) == false
          if options[:controller] && options[:id]
            resource_type = options[:controller].classify
            #TODO - Remove once controllers are moved to classes
            if resource_type == "ContentPackage"
              resource_type = "Pig::ContentPackage"
            end
            begin
              permalinkable = resource_type.constantize.included_modules.include?(Pig::Permalinkable)
            rescue NameError
              permalinkable = nil
            end
            if permalinkable
              return Pig::Permalink.active.find_by_resource_type_and_resource_id(resource_type, options[:id])
            end
          elsif options[:_positional_args]
            resource = options[:_positional_args].first
            if resource.respond_to?(:permalink) && resource.permalink
              return resource.permalink
            end
          end
        else
          if options.respond_to?(:permalink)
            return options.permalink
          end
        end
        nil
      end

    end
  end
end
