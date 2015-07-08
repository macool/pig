Given(/^there are (\d+) tag categories$/) do |count|
  @tag_categories = []
  count.to_i.times do
    @tag_categories << FactoryGirl.create(:tag_category)
  end
end

When(/^I fill in the new tag category form and submit$/) do
  visit pig.tag_categories_path
  click_link 'New Tag Category'
  fill_in 'Name', with: 'Foo'
  fill_in 'Unique identifier', with: 'foo'
  select2input = find('.select2-search__field')

  select2input.set('banana')
  within ".select2-results__options" do
    find("li", text: 'banana').click
  end

  click_button 'Save'
end

Then(/^the tag category is created$/) do
  expect(page).to have_text('Foo')
  expect(Pig::TagCategory.where(name: 'Foo').count).to eq(1)
  expect(ActsAsTaggableOn::Tag.where(name: 'banana').count).to eq(1)
end
