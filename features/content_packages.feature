Feature: Content Packages
  In order to have content on my website
  The CMS has content packages

Scenario Outline: Viewing a list of content packages
  Given I am logged in as an <role>
  And there are 2 content packages
  When I go to the sitemap
  Then I see the content packages
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

Scenario Outline: Creating a content package
  Given I am logged in as an <role>
  And there is 1 content type
  And there are 0 content packages
  When I fill in the new content package form and submit
  Then I am taken to edit the content package
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

@sane
@wip
Scenario Outline: Requesting a content package
  Given I am logged in as an <role>
  And there is 1 content type
  When I request a new content package of this type
  Then the request is created
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

@wip
Scenario Outline: Fulfill a content package request
  Given I am logged in as an <role>
  And there is 1 content package request
  When I create a content package for the request
  Then I the requester is notified
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |
    | author    |

Scenario Outline: Edit a content package
  Given I am logged in as an <role>
  And there is 1 content package
  When I update the content package
  Then the content package should change
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

Scenario Outline: Edit a nested content package
  Given I am logged in as an <role>
  And there is 1 nested content package
  When I update the content package
  Then the content package should change
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

@javascript
Scenario Outline: Save and continue editing a content package
  Given I am logged in as an <role>
  And there is 1 content package assigned to me
  When I visit the content package edit page
  And I click "Save and continue editing"
  Then I should be on the content package edit page
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |
    | author    |

@javascript
Scenario Outline: Save and view a content package
  Given I am logged in as an <role>
  And there is 1 content package assigned to me
  When I visit the content package edit page
  And I click "Save and view"
  Then I should be on the content package show page
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |
    | author    |


Scenario Outline: Publish a content package
  Given I am logged in as an <role>
  And there is 1 unpublished content package
  When I publish the content package
  Then the content package should be published
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

Scenario: Viewing a content package
  Given there is 1 content package
  When I go to the content package
  Then I should see all its content

Scenario Outline: Deleting a content package
  Given I am logged in as an <role>
  And there is 1 content package
  When I archive the content package
  Then It should no longer be visible in the sitemap
  And it should appear in the list of archived content packages
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

Scenario Outline: Restoring a content package
  Given I am logged in as an <role>
  And there is 1 archived content package
  When I restore the content package
  Then it should appear in the sitemap
  And It shouldn't appear in the list of archived content packages
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

@allow-rescue
Scenario Outline: Destroying a content package
  Given I am logged in as an <role>
  And there is 1 archived content package
  When I destroy the content package
  Then It shouldn't appear in the list of archived content packages
  Examples:
    | role      |
    | developer |
    | admin     |

@javascript
Scenario Outline: Searching for a content package
  Given I am logged in as an <role>
  And there are 3 content packages
  And one of the content packages is named "Foo"
  When I go to the list of content packages
  And I search for "Foo"
  Then I should see the content package named "Foo" highlighted
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |
    | author    |

@javascript
Scenario Outline: Adding a content package as a child of another content package
  Given I am logged in as an <role>
  And there is 1 content package
  When I add a child to the content package
  And I fill in the new child content package form and submit
  And I update the content package
  Then the content package should appear as a child in the sitemap
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

Scenario Outline: Moving a child content package to another parent
  Given I am logged in as an <role>
  And there is a content package with a parent
  And there are 1 content package
  When I move the child to a new parent
  Then the content package should move to the new parent
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

@javascript
@wip
Scenario Outline: Discussing a content package
  Given I am logged in as an <role>
  And there is 1 content package
  When I discuss the content package
  Then the discussion count should increase
  And I should see the discussion content
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |
    | author    |

@javascript
Scenario Outline: I can assign a content package to an author
  Given I am logged in as an <role>
  And there is 1 unpublished content package
  When I assign it to an author
  Then the content package author should change
  And the author should be emailed
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

@javascript
Scenario Outline: I can reorder children of a content package
  Given I am logged in as an <role>
  And there is a content package with 3 children
  When I reorder the children
  Then the children are reordered
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

@javascript
Scenario Outline: Assigning a published content package to an author changes the status to Update
  Given I am logged in as an <role>
  And there is 1 content package
  When I change the assigned to field to an author
  Then status is changed to Update
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

  @javascript
  Scenario Outline: Assigning a published content package to an author for updates
    Given I am logged in as an <role>
    And there is 1 published content package
    When I change the assigned to field to an author
    And I click "Save and view"
    Then I can still view the old content package
    Examples:
      | role      |
      | developer |
      | admin     |
      | editor    |

Scenario Outline: I can preview a content package with updates
  Given I am logged in as an <role>
  And there is 1 published content package
  When the content package is edited
  And I visit the content packages preview url
  Then I see the updated content package
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |

Scenario: I can view the live version of a content package with changes
  Given there is 1 published content package
  When the content package is edited
  And I go to the content package
  Then I see the original content package

@javascript
Scenario Outline: I can view children of a content package
  Given I am logged in as an <role>
  And there is a content package with 3 children
  When I go to the list of content packages
  And I expand the parent
  Then the 3 children are visible
  Examples:
    | role      |
    | developer |
    | admin     |
    | editor    |
    | author    |
