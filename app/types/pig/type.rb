module Pig
  # Generic type which adds a get and set method to the content package which
  # it decorates
  class Type
    def initialize(content_package, slug, field_type)
      @slug = slug
      @field_type = field_type
      decorate(content_package)
    end

    def decorate(content_package)
      this = self
      content_package.class.send(:define_method, @slug) { this.get(self) }
      content_package.class.send(:define_method, "#{@slug}=") do |value|
        this.set(self, value)
      end
    end

    def get(content_package)
      content_value(content_package)
    end

    def set(content_package, value)
      content_package.content['content_chunks'][@slug] = {
        'value' => value,
        'field_type' => @field_type
      }
    end

    protected

    def content_value(content_package)
      chunk = content_package.content['content_chunks'][@slug]
      chunk['value'] || ''
    end
  end
end
