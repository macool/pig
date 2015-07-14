Feature: Meta data for pages not in the CMS
  In order to add meta data to pages that are not in the cms
  I want to add meta data to a non cms page

Scenario Outline: Creating meta data
  Given I am logged in as an <role>
  When I go to the new meta data page
  And I fill in the meta data form
  Then the meta data should be created
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Editing meta data
  Given I am logged in as an <role>
  And that there is 1 meta data page
  When I go to the meta data page
  And I click on the "Edit" link
  And I update the meta data
  Then the meta data should be updated
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Listing meta datas
  Given I am logged in as an <role>
  And that there are 3 meta data pages
  When I go to the meta data index page
  Then I see all the meta data pages
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario Outline: Delete meta data
  Given I am logged in as an <role>
  And that there is 1 meta data page
  When I go to the meta data page
  And I click on the "Delete" link
  Then the meta data should be deleted
  Examples:
    | role      |
    | developer |
    | admin     |

Scenario: Check that meta data shows up on the page
  Given that there is 1 meta data page
  And the meta data page refers to itself
  When I go to the meta data page
  Then the meta data should be shown in the header
