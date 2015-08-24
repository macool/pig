Then(/^I can see the discussion about the content package$/) do
  within('#cms-comments') do
    expect(page).to have_content(@content_package.comments.first.comment)
  end
end

When(/^I comment on the content package$/) do
  visit pig.edit_admin_content_package_path(@content_package)
  fill_in('comment_text', :with => "Some sample text")
  click_button("comment_button")
end

Then(/^the comment should appear$/) do
  expect(page).to have_content("Some sample text")
end
