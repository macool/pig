require 'rails_helper'

module Pig
  RSpec.describe PersonasController, type: :controller do

    routes { Pig::Engine.routes }

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

  end
end
