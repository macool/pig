module Pig
  class TagsType < Type
    def decorate(content_package)
      super(content_package)
      content_package.class.send(:alias_method, "#{@slug.singularize}_list=", "#{@slug}=")
      content_package.class.send(:alias_method, "#{@slug.singularize}_list", @slug)
    end

    def get(content_package)
      content_value(content_package).split(',')
    end
  end
end
