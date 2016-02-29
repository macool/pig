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
      content_package.define_singleton_method(@slug) { this.get(self) }
      content_package.define_singleton_method("#{@slug}=") do |value|
        this.set(self, value)
      end
      content_package.define_singleton_method("#{@slug}_valid?") do |content_package|
        this.valid?(content_package)
      end
    end

    def get(content_package)
      content_value(content_package)
    end

    def set(content_package, value)
      content_package.json_content['content_chunks'] ||= {}
      content_package.json_content['content_chunks'][@slug] = {
        'value' => value,
        'field_type' => @field_type
      }
      content_package.json_content_will_change! if Rails.version.to_f < 4.2
    end

    def content_value(content_package)
      content_package.json_content['content_chunks'] ||= {}
      content_package.json_content['content_chunks'][@slug] ||= {}
      content_package.json_content['content_chunks'][@slug]['value'] || ''
    end

    def content_chunk(content_package)
      content_package.json_content['content_chunks'] ||= {}
      content_package.json_content['content_chunks'][@slug] ||= {}
    end

    def valid?(content_package)
      true
    end
  end
end
