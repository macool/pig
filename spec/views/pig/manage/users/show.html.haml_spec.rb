require 'rails_helper'

module Pig
  RSpec.describe 'pig/manage/users/show', type: :view do
    it "should content authored by the user" do
      user = FactoryGirl.create(:user, :author)
      content_package = FactoryGirl.create(:content_package, author: user)
      assign(:user, user)
      assign(:assigned_content, [content_package])
      allow(view).to receive(:can?).and_return(true)
      render
      expect(rendered).to have_content(content_package.name)
    end
  end
end
