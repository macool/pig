module Pig
  class BooleanType < Type
    def decorate(content_package)
      slug = @slug
      super(content_package)
      content_package.define_singleton_method("#{@slug}?") do
        send(slug)
      end
    end

    def get(content_package)
      !content_value(content_package).to_i.zero?
    end
  end
end
