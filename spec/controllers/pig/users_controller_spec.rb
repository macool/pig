require 'rails_helper'

module Pig
  RSpec.describe Manage::UsersController, type: :controller do
    render_views
    routes { Pig::Engine.routes }

    context "signed in" do
      login_admin

      describe "PATCH #update" do
        let(:user) { FactoryGirl.create(:user) }
        it "redirects to user" do
          patch :update, id: user.id, user: { bio: 'Hi my name is test' }
          expect(response).to redirect_to(manage_user_path(user))
        end

        it "updates bio" do
          expect_any_instance_of(Pig::User).to receive(:update_attributes)
            .with(bio: 'Hi my name is test')
          patch :update, id: user.id, user: { bio: 'Hi my name is test' }
        end
      end

      describe "GET #show" do
        let(:user) { FactoryGirl.create(:user) }
        it "shows the user" do
          get :show, id: user.id
          expect(response).to be_success
        end

        it "assigns user" do
          get :show, id: user.id
          expect(assigns(:user)).to eq(user)
        end
      end
    end

  end
end
