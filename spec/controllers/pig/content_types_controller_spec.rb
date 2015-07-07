require 'rails_helper'

module Pig
  RSpec.describe ContentTypesController, type: :controller do
    render_views
    routes { Pig::Engine.routes }

    context "not signed in" do
      requests = ['index']

      let(:index) { get :index }

      requests.each do |request|
        it "should redirect #{request} to sign in" do
          eval(request)
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

    context "signed in with user of role without permission to view page" do
      login_no_role
      requests = ['index']

      let(:index) { get :index }

      requests.each do |request|
        it "should redirect #{request} to not authorized page" do
          eval(request)
          expect(response).to redirect_to(not_authorized_path)
        end
      end
    end

    context "signed in" do
      login_admin

      describe "GET #index" do
        it "returns http success" do
          get :index
          expect(response).to have_http_status(:success)
        end
      end

      describe "GET #reorder" do
        let(:content_type) { FactoryGirl.create :content_type}
        it "returns http success" do
          get :reorder, id: content_type.id
          expect(response).to have_http_status(:success)
        end
      end
    end

  end
end
