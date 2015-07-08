@javascript
@admin
Feature: CMS tag management
  As an admin
  In order to manage tag categories and there tags
  I want a tag managemnent interdace

Scenario: Creating a tag category
  Given there are 0 tag categories
  When I fill in the new tag category form and submit
  Then the tag category is created

Scenario: Update a tag category
  Given there is 1 tag category
  When I update the tag category's form and submit
  Then the tag category should be updated
