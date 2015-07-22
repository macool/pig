module Pig
  class BooleanType < Type
    def decorate(content_package)
      super(content_package)
      content_package.class.send(:alias_method, "#{@slug}?", @slug)
    end

    def get(content_package)
      !content_value(content_package).to_i.zero?
    end
  end
end
