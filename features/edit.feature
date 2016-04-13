Feature: Edit Event 

Scenario: Edit Event Information 
  Given I am on the Event page
  And There are more than one event on the page
  When I click Edit
  Then I should see it change to the event form with event information
  
Scenario: Edit Event Question
  Given I am on the Event Question 
  When I click Edit Question
  Then I should see it change to the edit form with question information


