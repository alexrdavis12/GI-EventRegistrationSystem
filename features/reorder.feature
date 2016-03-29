Feature: Reorder questions
 
  As an administrator
  So that I can reorder questions

Background: event needs to contain questions
  
Scenario: move question up
  Given I am in the Questions Page
  And There are more than one question on the page
  When I press the up arrow on a question
  Then I should see it change position with the question above it
  
Scenario: move question down
  Given I am in the Questions Page
  And There are more than one question on the page
  When I press the up arrow on a question
  Then I should see it change position with the question below it
  
  