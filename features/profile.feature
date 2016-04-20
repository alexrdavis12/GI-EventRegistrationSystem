Feature: User Profile 
 
  As an User
  So that I can see my information

Background: User exists or is being created
  Given Events Exits
  |eid|etitle |elocation|edescription|
  | 1 | test1 | loc     | disc       | 

  Given I am on the create page
  And I fill in "email" with "1234@gmail.com"
  And I fill in "password" with "12345678"
  And I fill in "lastname" with "Testa"
  And I fill in "firstname" with "Numa"
  And choose "Male"
  And I fill in "zipcode" with "75089"
  And I press "Create"
  Then I should see "You are not currently registered for any events"
  
Scenario: User Home center should have no events for new user (SAD PATH)
  Given I am on the Home Page
  And I am on the "Registered Events" tab
  Then I should not see "Event 1"
  
Scenario: User Home center should have events the user registered for
  Given I am on the Home Page
  And I am on the "Registered Events" tab
  And I click on "Available Events"
  And I should see "Location"
  When I click on "Choose"
  And I submit form
  And I am on the Home Page
  And I am on the "Registered Events" tab
  Then I should see "Event"
  
Scenario: User Home center should have no Vehicles for new user (SAD PATH)
  Given I am on the Home Page
  And I am on the "My Vehicles" tab
  Then I should not see "Vehicle 1"
  
Scenario: User Home center's Vehicle Tab should allow user to add new vehicles (SAD PATH)
  Given I am on the Home Page
  And I am on the "My Vehicles" tab
  And I click on "Add Vehicle"
  And I fill in "Name" with "Tanky"
  When I submit form
  Then I should see "Vehicle Created Successfully!"
  When I click on "Back to Home"
  And I am on the "My Vehicles" tab
  Then I should see "Tanky"



  
