Feature: admin home page
  
  As an administrator 
  so that I can edit event, view event, and profile
  
Background: Logged in as administrator contain three buttons on home page
  
Given: Log in as administrator
  
Scenario: Create Event 
  When I click the create event button 
  Then I should see the event form
  
Scenario: View Events 
    When I click the view events button
    Then I should see events
  
Scenario: Profile  
  When I click the profile button
  Then I should see admin profile
