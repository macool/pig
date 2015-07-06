require 'rails_helper'

module Pig
  RSpec.describe 'pig/manage/users/show', type: :view do
    let(:user) { FactoryGirl.create(:user, :author, first_name: "Jimmy",
                                                    last_name: "Foo") }
    let(:content_package) { FactoryGirl.create(:content_package, author: user) }

    before(:each) do
      assign(:user, user)
      assign(:assigned_content, [content_package])
      allow(view).to receive(:can?).and_return(true)
      render
    end

    it "should show the name of the user" do
      expect(rendered).to have_text("Jimmy Foo")
    end

    it "should show content authored by the user" do
      expect(rendered).to have_content(content_package.name)
    end
  end
end
