Given(/^there (?:is|are) (\d+) tag (?:category|categories)$/) do |count|
  @tag_categories = []
  count.to_i.times do
    @tag_categories << FactoryGirl.create(:tag_category, :with_tags)
  end
  @tag_category = @tag_categories.first
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

When(/^I update the tag category's form and submit$/) do
  visit pig.tag_categories_path
  click_link @tag_category.name
  fill_in 'Name', with: 'New Foo'
  fill_in 'Unique identifier', with: 'new-foo'

  @tag_to_remove = @tag_category.taxonomy_list.first
  within('.select2-selection__rendered') do
    within('li', text: @tag_to_remove) do
      find('span.select2-selection__choice__remove').click
    end
  end
  # dismiss the select2 list hiding the save button
  find('body').native.send_key(:Escape)

  click_button 'Save'
end

Then(/^the tag category should be updated$/) do
  @tag_category.reload
  expect(@tag_category.name).to eq('New Foo')
  expect(@tag_category.slug).to eq('new-foo')
  expect(@tag_category.taxonomy_list).to_not include(@tag_to_remove)
end
