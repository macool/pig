Feature: CMS author
  In order to create great content
  As an author
  I want to manage content assigned to me

Scenario: Viewing a list of content packages I need to write
  Given I am logged in as an author
  And there are 3 content packages assigned to me
  When I go to the dashboard
  Then I see the content packages

@wip
Scenario: Viewing a list of content packages which someone needs to write
  Given I am logged in as an author
  And there are 3 content packages assigned to no one
  When I go to the dashboard
  Then I see the content packages in the open requests area

Scenario: Viewing a list of my content packages
  Given I am logged in as an author
  And there are 3 content packages assigned to me
  When I go to the sitemap
  Then I can edit the content packages

@javascript
Scenario: Set content package as ready to review
  Given I am logged in as an author
  And there is 1 content package assigned to me
  When I mark the content package as ready to review
  Then it is assigned back to the requester

Scenario: Edit a content package assigned to me
  Given I am logged in as an author
  And there is 1 content package assigned to me
  When I update the content package
  Then the content package should change
