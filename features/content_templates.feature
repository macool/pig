Feature: Content Templates
  In order to define how content appears
  The CMS has content templates

@admin
@javascript
Scenario: Add a content template
  Given there are 0 content types
  When I fill in the new content type form and submit
  Then the content type is created

@admin
Scenario: Edit a content template
  Given there is 1 content type
  When I update the content type
  Then the content type should change

@admin
Scenario: Destroy a content template
  Given there is 1 content type
  When I destroy the content type
  Then the content type is destroyed

@editor
Scenario: View Content templates
  Given there are 3 content types
  When I go to the list of content types
  Then I see the content types

@editor
@javascript
Scenario: View Content packages grouped by content template
  Given there is 1 content type
  And there is 1 content package of this type
  When I go to the list of content types
  And I open the tree for the type
  Then I should see the content package

@author
Scenario: View the content template of a specific content package
  Given there is 1 content package
  When I go to edit the content package
  Then I should can see the content template it is using

@admin
Scenario: View the content template of a specific content package
  Given there is 1 content package
  When I go to edit the content package
  Then I should can see the content template it is using as a link

@admin
@javascript
Scenario: Duplicating a content type
  Given there are 1 content type
  When I duplicate the content type
  Then I see a new content type with all the same attributes

@admin
Scenario: Create a content package from a content template
  Given there is 1 content type
  When I go to the list of content types
  Then I can add a new content package from the content template

@admin
Scenario: Create a new content package choosing the template from a list
  Given there is 1 content type
  When I go to create a new content package
  And choose the content template from a list
  And fill in the content package form
  Then the content package is created

@admin, @sane
Scenario: Adding the content attributes of one content type to another
  Given there are 2 content types
  When I duplicate the first content type onto the second
  Then I see a second content type with all the attributes of the first

@author, @sane
Scenario: View Content templates
  Given there are 3 content types
  When I go to the list of content types
  Then I see the content types
