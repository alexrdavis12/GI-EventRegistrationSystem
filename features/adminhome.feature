Feature: admin home page
  
  As an administrator 
  so that I can edit event, view event, and profile
  
Background: Logged in as administrator contain three buttons on home page
  
<<<<<<< HEAD
Given: Log in as administrator
=======
Given Log in as administrator
>>>>>>> c958458f46e80e1014dade0f00bba1d7aa25273c
  
Scenario: Create Event 
  When I click the create event button 
  Then I should see the event form
  
Scenario: View Events 
    When I click the view events button
    Then I should see events
  
Scenario: Profile  
  When I click the profile button
<<<<<<< HEAD
  Then I should see admin profile
=======
  Then I should see admin profile
>>>>>>> c958458f46e80e1014dade0f00bba1d7aa25273c
