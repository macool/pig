module Pig
  module Admin
    class PasswordsController < Devise::PasswordsController
      layout 'pig/simple'

      helper Pig::ApplicationHelper
      helper Pig::MetaTagsHelper
      helper Pig::LayoutHelper
      helper Pig::NavigationHelper
      helper Pig::ContentHelper
      helper Pig::TitleHelper
      helper Pig::ImageHelper
    end
  end
end
