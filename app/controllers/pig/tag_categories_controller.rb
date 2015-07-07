module Pig
  class TagCategoriesController < ApplicationController

    load_and_authorize_resource

    def new
    end

    def create
      if @tag_category.save
        redirect_to pig.tag_categories_path
      else
        render :new, error: "Sorry there was a problem saving this category: #{@tag_category.errors.full_messages.to_sentence}"
      end
    end

    def edit
    end

    def index
    end

    def update
      old_tags = @tag_category.taxonomy_list
      if @tag_category.update(tag_category_params)
        removed = old_tags - @tag_category.taxonomy_list
        ActsAsTaggableOn::Tagging.where(tagger: @tag_category, tag: ActsAsTaggableOn::Tag.where(name: removed)).destroy_all
        redirect_to pig.tag_categories_path
      else
        render 'edit'
      end
    end

    private

    def tag_category_params
      params.require(:tag_category).permit(:name, :slug, taxonomy_list: [])
    end

  end
end
