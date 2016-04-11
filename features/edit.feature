Feature: Edit Event 

Scenario: Edit Event Information 
  Given I am on the event page
  When I click Edit
  Then I should see it change to the event form with event information 
  
Scenario: Edit Event Question
  Given I am on the event page
  When I click Edit Question
  Then I should see it change to the edit form with question information
