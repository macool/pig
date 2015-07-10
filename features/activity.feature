Feature: Records activity
  In order to see what changes have been made
  The cms should record activity

Scenario: When a content package is created an activity should be recorded
  Given I am logged in as any user
  And there is 1 content type
  And there are 0 content packages
  When I fill in the new content package form and submit
  Then I should see the "created" activity

Scenario: When a content package is updated an activity should be recorded
  Given I am logged in as any user
  And there is 1 content packages
  When I update the content package
  And I go to edit the content package
  Then I should see the "updated" activity

Scenario: When a content package is deleted an activity should be recorded
  Given I am logged in as any user
  And there is 1 content packages
  When I delete the content package
  And I visit the dashboard
  Then I should see the "deleted" activity

Scenario: When a content package is destroyed an activity should be recorded
  Given I am logged in as any user
  And there is 1 content packages
  When I destroy the content package
  And I visit the dashboard
  Then I should see the "destroyed" activity

Scenario: When a content package is destroyed its activities are still visible
  Given I am logged in as any user
  And there is 1 content packages
  When I destroy the content package
  And I visit the dashboard
  Then I should see the "created" activity

Scenario: I can see recent activity on the dashboard
  Given I am logged in as any user
  And there are 10 content packages
  When I go to the dashboard
  Then I should see the 5 activity items

@javascript
Scenario: I can see older activity on the dashboard
  Given I am logged in as any user
  And there are 10 content packages
  When I go to the dashboard
  And I choose to see older activity
  Then I should see the 10 activity items

Scenario: I can see recent activity on the content package form
  Given I am logged in as any user
  And there is 1 content package
  And the content package has has recent activity
  When I go to edit the content package
  Then I should see the recent activity

Scenario: I can see more activity on the content package form
  Given I am logged in as any user
  And there is 1 content package
  And the content package has has recent activity
  When I go to edit the content package
  And I choose to see older activity
  Then I should see the more activity
