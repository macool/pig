@admin
Feature: CMS user management
  In order to manage users
  I want a user management interface

@javascript
Scenario Outline: Creating a user
  Given I am logged in as an <role>
  And there are 0 users
  When I fill in the new cms user form and submit
  Then the user is created but not confirmed
    Examples:
      | role      |
      | developer |
      | admin     |

Scenario: Receiving an email to confirm my account
  Given I am logged in as an developer
  And there are 0 users
  When I fill in the new cms user form and submit
  Then the user should received an email to confirm their account

Scenario: Confirming my account from the link in the email
  Given I have received an email to confirm my account
  When I visit the confirmation url
  And I choose a password
  Then my account should be confirmed

@javascript
Scenario Outline: Editing another user
  Given I am logged in as an <role>
  And there are 1 users
  When I fill in the edit cms user form and submit
  Then the user is updated
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario: Editing my own account
  Given I am logged in as an author
  When I visit the manage account page
  And I make a change to my account
  Then my account is updated

@javascript
Scenario Outline: Make a user inactive
  Given I am logged in as an <role>
  And there are 1 users
  When I visit the cms user index 
  And I set the user as inactive
  Then the user is inactive
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Try to change a user to a new role
  Given I am logged in as an <my_role>
  And there is 1 user
  And the user is a <user_start_role>
  When I change the role of the user to <user_end_role>
  Then the user <status> be made an <user_end_role>
  Examples:
    | my_role   | user_start_role | user_end_role | status     |
    | developer | author          | editor        | should     |
    | developer | author          | admin         | should     |
    | developer | author          | developer     | should     |
    | developer | editor          | author        | should     |
    | developer | editor          | admin         | should     |
    | developer | editor          | developer     | should     |
    | developer | admin           | author        | should     |
    | developer | admin           | editor        | should     |
    | developer | admin           | developer     | should     |
    | developer | developer       | author        | should     |
    | developer | developer       | editor        | should     |
    | developer | developer       | admin         | should     |
    | developer | developer       | admin         | should     |
    | admin     | author          | editor        | should     |
    | admin     | author          | admin         | should     |
    | admin     | author          | developer     | should not |
    | admin     | editor          | author        | should     |
    | admin     | editor          | admin         | should     |
    | admin     | editor          | developer     | should not |
    | admin     | admin           | author        | should     |
    | admin     | admin           | editor        | should     |
    | admin     | admin           | developer     | should not |
    | admin     | developer       | author        | should not |
    | admin     | developer       | editor        | should not |
    | admin     | developer       | admin         | should not |
