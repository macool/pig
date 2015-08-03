module Pig
  class EmbeddableType < Type
    def decorate(content_package)
      super
      slug = @slug
      content_package.define_singleton_method("#{@slug}_url") do
        send(slug)
      end
      content_package.define_singleton_method("#{@slug}_url=") do |value|
        send("#{slug}=", value)
      end
    end
  end
end
