require 'rails_helper'

module Pig
  RSpec.describe ContentPackage do

    describe 'creating new versions' do
      context 'when changing status to published' do
        it 'it creates a new version' do
          cp = ContentPackage.create(status: "draft")
          cp.status = 'published'
          cp.save
          expect(cp.versions.count).to eq(1)
        end
      end
    end

  end
end
