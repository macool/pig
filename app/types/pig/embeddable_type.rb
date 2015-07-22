module Pig
  class EmbeddableType < Type
    def decorate(content_package)
      super
      slug = @slug
      content_package.class.send(:alias_method, "#{@slug}_url", @slug)
      content_package.class.send(:define_method, "#{@slug}_url=") do |value|
        send("#{slug}=", value)
      end
    end
  end
end
