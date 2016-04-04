Feature: Edit Event 
  
Background: Given I am on the event page

Scenario: Edit Event Information 
  When I click edit
  Then I should see it change to the event form with previous information 
  
Scenario: Edit Event Question
  When I click edit
  Then I should see it change to edit form
