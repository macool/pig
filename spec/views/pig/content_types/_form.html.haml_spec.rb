require 'rails_helper'

RSpec.describe "pig/content_types/_form", type: :view do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:content_type) { FactoryGirl.create(:content_type) }

  before(:each) do
    assign(:content_type, content_type)
    tag_categories = 5.times { FactoryGirl.create(:content_type) }
    assign(:tag_categories, tag_categories)
    @ability = Pig::Ability.new(admin)
    allow(controller).to receive(:current_ability).and_return(@ability)
    render
  end

  it "should have a template name field" do
    expect(rendered).to have_xpath("//input[@name='content_type[name]']")
  end

  it "should have a list of tag categories to choose from" do
    expect(rendered).to have_xpath("//div[@id='content_type_tag_categories_input']")
  end

  # it "should have a name field" do
  #   expect(rendered).to have_xpath("//input[@name='content_type[taxonomy_list][]']")
  # end

end
