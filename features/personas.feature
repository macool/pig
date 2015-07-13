Feature: Personas
  In order to target content at specific audiences
  The CMS has personas

Scenario Outline: Create a persona
  Given I am logged in as an <role>
  And there are 0 personas
  When I fill in the new persona form and submit
  Then the persona is created
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Viewing a list of persona groups
  Given I am logged in as an <role>
  And there are 3 persona groups
  When I go to the list of personas
  Then I see the persona groups
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Viewing a list of personas
  Given I am logged in as an <role>
  And there are 3 personas
  When I go to the list of personas
  Then I see the personas
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Edit a persona
  Given I am logged in as an <role>
  And there is 1 persona
  When I edit the persona
  And I update the persona form and submit
  Then the persona should be updated
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Destroy a persona
  Given I am logged in as an <role>
  And there is 1 persona
  When I edit the persona
  And I choose to destroy the persona
  Then the persona should be destroyed
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Assign personas to a content package
  Given I am logged in as an <role>
  And there is 1 persona
  And there is 1 content package
  When I edit the content package
  And I select the persona on the form
  Then the persona should be applied to the content package
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: View personas for a content package
  Given there is 1 persona
  And there is 1 content package using this persona
  When I edit the content package
  Then I should see the persona
  And I should see a link to find out more about the persona
  Examples:
    | role      |
    | developer |
    | admin     |
    | Editor    |
    | Author    |
