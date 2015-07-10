Feature: Content Packages
  In order to have content on my website
  The CMS has content packages

@author
Scenario: Viewing a list of content packages
  Given there are 3 content packages
  When I go to the sitemap
  Then I see the content packages

@admin
Scenario: Creating a content package
  Given there is 1 content type
  And there are 0 content packages
  When I fill in the new content package form and submit
  Then I am taken to edit the content package

@editor
@sane
Scenario: Requesting a content package
  Given there is 1 content type
  When I request a new content package of this type
  Then the request is created

@author
Scenario: Fulfill a content package request
  Given there is 1 content package request
  When I create a content package for the request
  Then I the requester is notified

@author
Scenario: Edit a content package
  Given there is 1 content package
  When I update the content package
  Then the content package should change

Scenario: Viewing a content package
  Given there is 1 content package
  When I go to the content package
  Then I should see all its content

@editor
Scenario: Deleting a content package
  Given there is 1 content package
  When I delete the content package
  Then It should no longer be visible in the sitemap
  And it shouldn't appear in the list of deleted content packages

@editor
Scenario: Restoring a content package
  Given there is 1 deleted content package
  When I restore the content package
  Then it should appear in the sitemap
  And It shouldn't appear in the list of deleted content packages

@editor
Scenario: Destroying a content package
  Given there is 1 deleted content package
  When I destroy the content package
  When I go to the content package
  Then I should get a 404

@author
@javascript
Scenario: Searching for a content package
  Given there are 3 content packages
  And one of the content packages is named "Foo"
  When I go to the list of content packages
  And I search for "Foo"
  Then I should see the content package named "Foo" highlighted

@editor
Scenario: Adding a content package as a child of another content package
  Given there is 1 content package
  When I add a child to the content package
  Then the content package should appear as a child in the sitemap

@editor
Scenario: Moving a child content package to another parent
  Given there are 1 content package
  And there is a content package with a parent
  When I add move the child to a new parent
  Then the content package should move to the new parent

@javascript
@wip
Scenario: Discussing a content package
  Given there is 1 content package
  When I discuss the content package
  Then the discussion count should increase

@javascript
Scenario: I can assign a content package to an author
  Given there is 1 content package
  When I assign it to an author
  Then the content package author should change
  And the author should be emailed
