require 'rails_helper'

module Pig
  RSpec.describe Admin::CommentsController, type: :routing do
    routes { Pig::Engine.routes }

    describe 'routing' do

      it 'routes to #create' do
        cp = FactoryGirl.create(:content_package)
        {post: "/admin/content_packages/#{cp.permalink.full_path}/comments"}.should
          route_to(controller: 'pig/admin/comments', action: 'create', content_package_id: cp.permalink.full_path)
      end

    end
  end
end
