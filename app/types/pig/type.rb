module Pig
  # Generic type which adds a get and set method to the content package which
  # it decorates
  class Type
    def initialize(content_package, slug)
      @slug = slug
      @content_package = content_package
      @chunk = content_package.content['content_chunks'][@slug]
      @content_value = @chunk['value'] || ''
      decorate(content_package)
    end

    def decorate(content_package)
      this = self
      content_package.class.send(:define_method, @slug) { this.get }
      content_package.class.send(:define_method, "#{@slug}=") do |value|
        this.set(value)
      end
    end

    def get
      @content_value
    end

    def set(value)
      @content_package.content['content_chunks'][@slug] = {
        value: value,
        field_type: attribute.field_type
      }
    end

    private

    def attribute
      Pig::ContentAttribute.find_by(slug: @slug)
    end
  end
end
