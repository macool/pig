require_dependency "pig/application_controller"

module Pig
  class TagsController < ApplicationController

    layout 'ym_content/application'
    load_and_authorize_resource

    def index
      @tag_categories = ::TagCategory.all
    end

  end
end
