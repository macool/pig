require "rails_helper"

module Pig
  RSpec.describe TagCategoriesController, type: :routing do
    routes { Pig::Engine.routes }

    describe "routing" do
      it "routes to #index" do
        expect(:get => "/tags").to route_to("pig/tag_categories#index")
      end

      it "routes to #new" do
        expect(:get => "/tags/new").to route_to("pig/tag_categories#new")
      end

      it "routes to #edit" do
        expect(:get => "/tags/1/edit").to route_to("pig/tag_categories#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/tags").to route_to("pig/tag_categories#create")
      end

      it "routes to #update" do
        expect(:put => "/tags/1").to route_to("pig/tag_categories#update", :id => "1")
      end
    end
  end
end
