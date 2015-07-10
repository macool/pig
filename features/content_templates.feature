Feature: Content Templates
  In order to define how content appears
  The CMS has content templates

@javascript
Scenario Outline: Add a content template
  Given I am logged in as an <role>
  And there are 0 content types
  When I fill in the new content type form and submit
  Then the content type is created
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Edit a content template
  Given I am logged in as an <role>
  And there is 1 content type
  When I update the content type
  Then the content type should change
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Destroy a content template
  Given I am logged in as an <role>
  And there is 1 content type
  When I destroy the content type
  Then the content type is destroyed
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: View Content templates
  Given I am logged in as an <role>
  And there are 3 content types
  When I go to the list of content types
  Then I see the content types
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |
    | author    |

@javascript
Scenario Outline: View Content packages grouped by content template
  Given I am logged in as an <role>
  And there is 1 content type
  And there is 1 content package of this type
  When I go to the list of content types
  And I open the tree for the type
  Then I should see the content package
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |
    | author    |

Scenario Outline: View the content template of a specific content package
  Given I am logged in as an <role>
  And there is 1 content package
  When I go to edit the content package
  Then I should can see the content template it is using
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |
    | author    |

@javascript
Scenario Outline: Duplicating a content type
  Given I am logged in as an <role>
  And there are 1 content type
  When I duplicate the content type
  Then I see a new content type with all the same attributes
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Create a content package from a content template
  Given I am logged in as an <role>
  And there is 1 content type
  When I go to the list of content types
  Then I can add a new content package from the content template
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Create a new content package choosing the template from a list
  Given I am logged in as an <role>
  And there is 1 content type
  When I go to create a new content package
  And choose the content template from a list
  And fill in the content package form
  Then the content package is created
  Examples:
    | role      |
    | developer |
    | admin     |

@sane
Scenario Outline: Adding the content attributes of one content type to another
  Given I am logged in as an <role>
  And there are 2 content types
  When I duplicate the first content type onto the second
  Then I see a second content type with all the attributes of the first
  Examples:
    | role      |
    | developer |
    | admin     |
