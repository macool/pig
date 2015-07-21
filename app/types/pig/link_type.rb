module Pig
  class LinkType < Type
    def get(content_package)
      Pig::Link.new(super(content_package))
    end
  end
end
