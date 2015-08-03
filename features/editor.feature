Feature: CMS editor
  In order to manage great content
  As an editor
  I want to manage content assigned to me and assign content to others

Scenario: Viewing a list of content packages I need to write
  Given I am logged in as an editor
  And there are 3 content packages assigned to me
  When I go to the dashboard
  Then I see the content packages

Scenario: Viewing a list of my content packages
  Given I am logged in as an editor
  And there are 3 content packages assigned to me
  When I go to the sitemap
  Then I can edit the content packages

Scenario: Set content package as published
  Given I am logged in as an editor
  And there is 1 content package assigned to me
  When I mark the content package as published
  And I log out
  And I go to the content package
  Then I should see all its content
