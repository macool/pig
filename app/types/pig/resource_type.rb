# the "resource" type is for linking to internal pig content,
# call the _path appended version of attribute for the link

module Pig
  class ResourceType < Type
    def decorate(content_package)
      this = self
      content_package.define_singleton_method(@slug) { this.get(self) }
      content_package.define_singleton_method("#{@slug}=") do |value|
        this.set(self, value)
      end
      content_package.define_singleton_method("#{@slug}_valid?") do |content_package|
        this.valid?(content_package)
      end
      content_package.define_singleton_method("#{@slug}_path") do
        if this.content_value(self).present?
          cp_path = Pig::ContentPackage.find(this.content_value(self)).to_param
          "/#{cp_path}".squeeze "/"
        end
      end
    end
  end
end
