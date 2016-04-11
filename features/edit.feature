Feature: Edit Event 
  
Background: Given I am on the event page

Scenario: Edit Event Information 
  When I click edit
  Then I should see it change to the event form with event information 
  
Scenario: Edit Event Question
  When I click edit
  Then I should see it change to the edit form with question information
