module Pig
  class LinkType < Type
    def get
      Pig::Link.new(super)
    end
  end
end
