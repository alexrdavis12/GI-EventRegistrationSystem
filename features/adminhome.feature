Feature: admin home page
  
  As an administrator 
  so that I can edit event, view event, and profile
  
Background: Logged in as administrator contain three buttons on home page

Given I Login as an administrator

Scenario: Home
  When I click MAGI
  Then I should see admin home page
  
  
Scenario: Create Event 
  When I click the Create Event button 
  Then I should see the event form
  
Scenario: View Events 
  When I click the View Events button
  Then I should see events
  
Scenario: Profile  
  When I click the Profile button
  Then I should see admin profile

  

