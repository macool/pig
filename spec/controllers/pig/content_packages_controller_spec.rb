require 'rails_helper'

module Pig
  RSpec.describe ContentPackagesController, type: :controller do
    render_views
    routes { Pig::Engine.routes }

    context "not signed in" do
      requests = ['update']

      let(:content_package) { FactoryGirl.create(:content_package) }
      let(:update) { patch :update, id: content_package.id }

      requests.each do |request|
        it "should redirect #{request} to sign in" do
          eval(request)
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

    context "signed in" do
      login_admin

      describe "PATCH #update" do
        let(:content_package) { FactoryGirl.create(:content_package) }
        it "redirects to content package" do
          patch :update, id: content_package.id, content_package: {name: 'Foo'}
          expect(response).to redirect_to(content_package_path(content_package))
        end

        it "calls update attributes on the content package" do
          allow(Pig::ContentPackage).to receive(:find).and_return(content_package)
          expect(content_package).to receive(:update_attributes)
            .with(name: 'Foo')
          patch :update, id: content_package.id, content_package: {name: 'Foo'}
        end
        
        it "passed parent_id to update attributes" do
          allow(Pig::ContentPackage).to receive(:find).and_return(content_package)
          expect(content_package).to receive(:update_attributes)
            .with(parent_id: "2")
          patch :update, id: content_package.id, content_package: {parent_id: "2"}
        end
      end
    end

  end
end
