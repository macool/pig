module Pig
  class UserCell < Pig::Cell
    property :first_name, :last_name
    self.view_paths = ["#{Pig::Engine.root}/app/cells"]

    def show
      render
    end

    private
    def full_name
      "#{first_name} #{last_name}"
    end
  end
end
