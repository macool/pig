module Pig
  class TagsType < Type
    def decorate(content_package)
      super
      slug = @slug
      content_package.class.send(:define_method, "#{@slug.singularize}_list=") do |value|
        send("#{slug}=", value)
      end
      content_package.class.send(:define_method, "#{@slug.singularize}_list") do
        send(slug)
      end
    end

    def get
      content_value.split(',')
    end
  end
end
