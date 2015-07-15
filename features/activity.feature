Feature: Records activity
  In order to see what changes have been made
  The cms should record activity

Scenario: When a content package is created an activity should be recorded
  Given I am logged in as any user
  And there is 1 content package
  When I visit the dashboard
  Then I should see the "created" activity

Scenario: When a content package is updated an activity should be recorded
  Given I am logged in as any user
  And there is 1 content package
  When the content package is updated
  And I go to edit the content package
  Then I should see the "updated" activity

Scenario: When a content package is deleted an activity should be recorded
  Given I am logged in as any user
  And there is 1 content packages
  When the content package is deleted
  And I visit the dashboard
  Then I should see the "deleted" activity

Scenario: When a content package is destroyed an activity should be recorded
  Given I am logged in as any user
  And there is 1 content packages
  When the content package is destroyed
  And I visit the dashboard
  Then I should see the "permanently deleted" activity

Scenario: When a content package is destroyed an activity should be recorded
  Given I am logged in as any user
  And there is 1 deleted content packages
  When the content package is restored
  And I visit the dashboard
  Then I should see the "restored" activity

Scenario: When a content package is destroyed its activities are still visible
  Given I am logged in as any user
  And there is 1 content package
  When the content package is destroyed
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
  And the content package is updated
  When I go to edit the content package
  Then I should see the recent activity

@javascript
Scenario: I can see more activity on the content package form
  Given I am logged in as any user
  And there is 1 content package
  And the content package has recent activity
  When I go to edit the content package
  And I am on the activity tab
  And I choose to see older activity
  Then I should see more activity
