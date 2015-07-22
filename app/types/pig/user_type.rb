module Pig
  # Type which return nil instead of blank string
  class UserType < Type
    def decorate(content_package)
      this = self
      super(content_package)
      content_package.class.send(:alias_method, "#{@slug}_id=", "#{@slug}=")
      content_package.class.send(:define_method, "#{@slug}_id") do
        this.content_value(self)
      end
    end

    def get(content_package)
      id = content_value(content_package)
      if Pig::User.exists?(id)
        Pig::User.find(id)
      else
        nil
      end
    end
  end
end
