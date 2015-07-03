module Pig
  class ContentPackageCell < Pig::Cell
    property :author
    self.view_paths = ["#{Pig::Engine.root}/app/cells"]

    def list(options)
      @options = options
      render
    end

    private
    def author_name
      return '' unless author
      if author == @options[:current_user]
        "You"
      else
        "#{author.first_name} #{author.last_name}"
      end
    end
  end
end
