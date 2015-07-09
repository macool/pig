require "rails_helper"

module Pig
  RSpec.describe ContentPackagesController, type: :routing do
    routes { Pig::Engine.routes }
    describe "routing" do

      it "routes to #index" do
        expect(:get => "/content_packages").to route_to("pig/content_packages#index")
      end

      it "routes to #new" do
        expect(:get => "/content_packages/new").to route_to("pig/content_packages#new")
      end

      it "routes to #show" do
        expect(:get => "/content_packages/1").to route_to("pig/content_packages#show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/content_packages/1/edit").to route_to("pig/content_packages#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/content_packages").to route_to("pig/content_packages#create")
      end

      it "routes to #update" do
        expect(:put => "/content_packages/1").to route_to("pig/content_packages#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/content_packages/1").to route_to("pig/content_packages#destroy", :id => "1")
      end

    end
  end
end
