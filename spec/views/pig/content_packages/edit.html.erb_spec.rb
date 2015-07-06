require 'rails_helper'

module Pig
  RSpec.describe 'pig/content_packages/edit', type: :view do
    it "should order assigned to by surname, regardless of role" do
      user_a = FactoryGirl.create(:user, :author, last_name: 'A', first_name: 'A')
      user_b = FactoryGirl.create(:user, :admin, last_name: 'B', first_name: 'B')
      user_c = FactoryGirl.create(:user, :author, last_name: 'C', first_name: 'C')
      assign(:content_package, FactoryGirl.create(:content_package,
                                                  author: user_a,
                                                  requested_by: user_b))
      assign(:non_meta_content_attributes, [])
      assign(:persona_groups, [])
      assign(:activity_items, instance_double('ActivityItems',
                                              :total_pages => 0,
                                              :current_page => 1))
      view.stub(:current_user).and_return(user_b)
      render
      assigned_to_options = Nokogiri::HTML(rendered)
        .xpath("//select[@id='content_package_author_id']").text
      expect(assigned_to_options).to eq("\nA A (author)\nB B (admin)\nC C (author)")
    end
  end
end
