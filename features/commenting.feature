Feature: Content Package commenting
  In order to have a discussion about a content package
  The cms has commenting functionality

@javascript
Scenario Outline: Viewing the comments regarding a content package
  Given I am logged in as an <role>
  And there is 1 content package with comments
  When I go to edit the content package
  Then I can see the discussion about the content package
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |


@javascript
Scenario Outline: Commenting on a content package
  Given I am logged in as an <role>
  And there is 1 content package assigned to me
  When I comment on the content package
  Then the comment should appear
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |
    | author    |
