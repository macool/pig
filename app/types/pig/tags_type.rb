module Pig
  class TagsType < Type
    def decorate(content_package)
      slug = @slug
      super(content_package)
      content_package.define_singleton_method("#{@slug.singularize}_list=") do |value|
        send("#{slug}=", value)
      end
      content_package.define_singleton_method("#{@slug.singularize}_list") do
        send(slug).join(', ')
      end
    end

    def get(content_package)
      content_value(content_package).split(',')
    end
  end
end
