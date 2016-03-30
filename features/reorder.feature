Feature: Reorder questions
 
  As an administrator
  So that I can reorder questions

Background: Logged in as admin event needs to contain more than 1 question

Scenario: User sees Question
  When I go to the Questions Page
  Then I should see a Question
  
Scenario: move question up successfully
  Given I am on the Questions Page
  And There are more than one question on the page
  When I click the up arrow on a question
  Then I should see it change position with the question above it
  
Scenario: move question down successfully
  Given I am on the Questions Page
  And There are more than one question on the page
  When I click the down arrow on a question
  Then I should see it change position with the question below it
  
  
  
  