Then(/^I should see the (\d+) activity items$/) do |n|
  expect(page.all("ul.cms-activities li").count).to eql(n.to_i)
end

When(/^I choose to see older activity$/) do
  click_link "See older activity"
  wait_for_ajax
end

When(/^I am on the activity tab$/) do
  click_link "Activity"
end

Then(/^I should see the "(.*?)" activity$/) do |action|
  expect(page).to have_content("#{@content_package.name} was #{action} by #{@current_user.full_name}")
end
