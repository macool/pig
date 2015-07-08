require 'rails_helper'

RSpec.describe "pig/content_types/new", type: :view do
  let(:admin) { FactoryGirl.create(:user, :admin) }

  before(:each) do
    assign(:content_type, Pig::ContentType.new())
    @ability = Pig::Ability.new(admin)
    allow(controller).to receive(:current_ability).and_return(@ability)
  end

  it "renders new content_type form" do
    render

    assert_select "form[action=?][method=?]", pig.content_types_path, "post" do
    end
  end
end
