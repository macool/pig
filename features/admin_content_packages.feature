@admin
Feature: CMS admin content packages
  In order to create great content packages
  As an admin
  I want to manage the all aspects of the sites content packages

@javascript
Scenario: Searching for a content package
  Given there are 3 content packages
  And one of the content packages is named "Foo"
  When I go to the list of content packages
  And I search for "Foo"
  Then I should see the content package named "Foo" highlighted
