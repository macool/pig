Feature: Personas
  As an admin
  In order to target content at specific audiences
  The CMS has personas

@admin
Scenario: Create a persona
  Given there are 0 personas
  When I fill in the new persona form and submit
  Then the persona is created

@admin
Scenario: Viewing a list of persona groups
  Given there are 3 persona groups
  When I go to the list of personas
  Then I see the persona groups

@admin
Scenario: Viewing a list of personas
  Given there are 3 personas
  When I go to the list of personas
  Then I see the personas

@admin
Scenario: Edit a persona
  Given there is 1 persona
  When I edit the persona
  And I update the persona form and submit
  Then the persona should be updated

@admin
Scenario: Destroy a persona
  Given there is 1 persona
  When I edit the persona
  And I choose to destroy the persona
  Then the persona should be destroyed

@editor
Scenario: Assign personas to a content package
  Given there is 1 persona
  And there is 1 content package
  When I edit the content package
  And I select the persona on the form
  Then the persona should be applied to the content package

@author
Scenario: View personas for a content package
  Given there is 1 persona
  And there is 1 content package using this persona
  When I edit the content package
  Then I should see the persona
  And I should see a link to find out more about the persona
