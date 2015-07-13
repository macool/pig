@javascript
@admin
Feature: CMS tag management
  As an admin
  In order to manage tag categories and there tags
  I want a tag managemnent interdace

Scenario Outline: Creating a tag category
  Given I am logged in as an <role>
  And there are 0 tag categories
  When I fill in the new tag category form and submit
  Then the tag category is created
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Update a tag category
  Given I am logged in as an <role>
  And there is 1 tag category
  When I update the tag category's form and submit
  Then the tag category should be updated
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Assigning a tag category to a content type
  Given I am logged in as an <role>
  And there is 1 tag category
  When I assign the tag category to a content type
  Then the tag is available when creating an instance of the content type
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

Scenario Outline: Choosing a tag when creating a content package
  Given I am logged in as an <role>
  And there is 1 content type with a tag category
  When I create a content package and tag it
  Then the content package is created with the tag
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |
    | author    |
