@non-nested
Feature: CMS Permalinks
  In order to give content packages nice pretty urls
  As a CMS admin
  the site should user permalinks to provide linkable urls

Scenario: I visit a content package via its permalink
  Given there is 1 content package
  When I visit its permalink
  Then I should see all its content

Scenario: I visit a content package via a case insensitive permalink
  Given there is 1 content package
  When I change the content package "permalink_path" to "a-lower-case-permalink"
  When I visit "/a-LoWeR-cAsE-pErMaLiNk"
  Then I should see all its content

Scenario: I can view a page by its original permalink even after it has changed
  Given there is 1 content package
  When I change the content package "permalink_path" to "new-permalink"
  And I visit "/new-permalink"
  Then I should see all its content

@allow-rescue
Scenario: I visit a permalink that doesn't exist I get a 404
  Given there is 1 content package
  When I visit "/non-existent-permalink"
  Then I should get a 404

@allow-rescue
Scenario: I can visit a content package without a permalink
  Given there is 1 content package
  When I visit "/non-existent-permalink"
  Then I should get a 404

Scenario: I can not visit an unpublished content package by its permalinks
  Given there is 1 unpublished content package
  When I visit its permalink
  Then I should get a 404

@javascript
Scenario Outline: I can delete permalinks
  Given I am logged in as an <role>
  And there is 1 content package
  And the content package has an old permalink alias
  When I visit the content package edit page
  And I delete the permalink alias
  Then the permalink alias should be removed
  Examples:
    | role      |
    | developer |

@javascript
Scenario Outline: I can delete permalinks as an admin when they are new
  Given I am logged in as an <role>
  And there is 1 content package
  And the content package has a new permalink alias
  When I visit the content package edit page
  And I delete the permalink alias
  Then the permalink alias should be removed
  Examples:
    | role   |
    | admin  |
    | editor |
    | author |

@javascript
Scenario Outline: I cannot delete permalinks as an admin when they are an hour old
  Given I am logged in as an <role>
  And there is 1 content package
  And the content package has an old permalink alias
  When I visit the content package edit page
  Then I should not be able to delete the permalink alias
  Examples:
    | role   |
    | admin  |
    | editor |
