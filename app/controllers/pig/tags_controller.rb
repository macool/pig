module Pig
  class TagsController < ApplicationController

    layout 'pig/application'
    load_and_authorize_resource

    def index
      @tag_categories = ::TagCategory.all
    end

  end
end
