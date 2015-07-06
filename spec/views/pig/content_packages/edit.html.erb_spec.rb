require 'rails_helper'

module Pig
  RSpec.describe 'pig/content_packages/edit', type: :view do
    let(:admin) { FactoryGirl.create(:user, :admin, last_name: 'A', first_name: 'A') }

    before(:each) do
      assign(:non_meta_content_attributes, [])
      assign(:persona_groups, [])
      assign(:activity_items, instance_double('ActivityItems',
                                              total_pages: 0,
                                              current_page: 1))
      view.stub(:current_user).and_return(admin)
    end

    it 'should order assigned to by surname, regardless of role' do
      FactoryGirl.create(:user, :admin, last_name: 'C', first_name: 'C')
      FactoryGirl.create(:user, :author, last_name: 'B', first_name: 'B')
      assign(:content_package, FactoryGirl.create(:content_package,
                                                  author: admin,
                                                  requested_by: admin))
      render
      assigned_to_options = Nokogiri::HTML(rendered)
        .xpath("//select[@id='content_package_author_id']").text
      expect(assigned_to_options).to eq("\nA A (admin)\nB B (author)\nC C (admin)")
    end

    it 'should order requested_by by surname' do
      FactoryGirl.create(:user, :admin, last_name: 'C', first_name: 'C')
      FactoryGirl.create(:user, :admin, last_name: 'B', first_name: 'B')
      assign(:content_package, FactoryGirl.create(:content_package,
                                                  author: admin,
                                                  requested_by: admin))
      render
      assigned_to_options = Nokogiri::HTML(rendered)
        .xpath("//select[@id='content_package_requested_by_id']").text
      expect(assigned_to_options).to eq("\nA A\nB B\nC C")
    end
  end
end
