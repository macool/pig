@admin
Feature: CMS tag management
  As an admin
  In order to manage tag categories and there tags
  I want a tag managemnent interdace

@javascript
Scenario: Creating a tag category
  Given there are 0 tag categories
  When I fill in the new tag category form and submit
  Then the tag category is created
