Feature: User Profile 
 
  As an User
  So that I can see my information

Background: User exists or is being created
  Given Events Exits
  |eid|etitle |elocation|edescription|
  | 1 | test1 | loc     | disc       | 

  Given Vehicles Exits
  |vid|     vname    |  vclass |vnation|vwar|vdescription|user_id|
  | 1 | tankasaurous | Tracked |   USA | WW2|dicoriptico | 1     | 
  # | 2 | tankarina    | Tracked |   USA | WW2|dicoriptico | 2     | 

  Given I am on the create page
  And I fill in "email" with "1234@gmail.com"
  And I fill in "password" with "12345678"
  And I fill in "lastname" with "Testa"
  And I fill in "firstname" with "Numa"
  And choose "Male"
  And I fill in "phonenumber" with "1234567899"
  And I fill in "addressline1" with "270 skid ln"
  And I fill in "city" with "rowlett"
  And I fill in "state" with "Texas"
  And I fill in "zipcode" with "75089"
  And I press "Create"
  Then I should see "You are not currently registered for any events"

Scenario: User Home center should have user information in the Profile tab
  Given I am on the Home Page
  And I am on the Profile tab
  Then I should see "Email"

Scenario: User Home center's profile tab should allow the user to edit 
  Given I am on the Home Page
  And I am on the Profile tab
  And I click on "Edit Profile"
  And I should see "City"
  And I fill in "city" with "Dallas"
  And I fill in "password" with "password"
  And I submit form
  And I am on the Home Page
  And I am on the Profile tab
  Then I should see "Dallas"
  
# Scenario: User Home center should have no events for new user (SAD PATH)
  # Given I am on the Home Page
  # And I am on the "Registered Events" tab
  # Then I should not see "Event 1"
  
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
  
# Scenario: User Home center should have no Vehicles for new user (SAD PATH)
#   Given I am on the Home Page
#   And I am on the "Vehicles" tab
#   Then I should not see "Vehicle 1"
  
Scenario: User Home center's Vehicle Tab should allow user to add new vehicles 
  Given I am on the Home Page
  And I am on the "Vehicles" tab
  And I click on "Add Vehicle"
  And I fill in "Name" with "Tanky"
  When I submit form
  Then I should see "Vehicle Created Successfully!"
  When I click on "Back to Home"
  And I am on the "Vehicles" tab
  Then I should see "Tanky"
  
Scenario: User Home center's Vehicle Tab should allow user to see previously created vehicles
  Given I am on the Home Page
  And I am on the "Vehicles" tab
  When I click on "Show"
  Then I should see "Vehicle ID"
  
# Scenario: User Home center's Vehicle Tab should allow user to edit previously created vehicles
#   Given I am on the Home Page
#   And I am on the "Vehicles" tab
#   When I click on "Edit Vehicle Info"
#   Then I should see "Vehicle Impression"
#   And I fill in "Name" with "Tankmeister"
#   And I submit form
#   And I am on the Home Page
#   When I am on the "Vehicles" tab
#   Then I should see "Tankmeister"
  
# Scenario: User Home center should have no Impressions for new user (SAD PATH)
#   Given I am on the Home Page
#   And I am on the "Impressions" tab
#   Then I should not see "Impression 1"

Scenario: User Home center's Impressions Tab should allow user to add new impressions
  Given I am on the Home Page
  And I am on the "Impressions" tab
  And I click on "Add Impression"
  And I fill in "Name" with "Lee"
  And I fill in "Unit" with "B52"
  And I fill in "War" with "WW2"
  And I fill in "Side" with "'Murica"
  And I fill in "Description" with "La Discripticon"
  When I submit form
  Then I should see "Impression Created Successfully!"
  When I click on "Back to Home"
  And I am on the "Impressions" tab
  Then I should see "Lee"
  
# Scenario: User Home center should have no Vendor Booths for new user (SAD PATH)
#   Given I am on the Home Page
#   And I am on the "Vendor Booths" tab
#   Then I should not see "Vendor Booth 1"

Scenario: User Home center's Vendor Booth Tab should allow user to add new vendor booths
  Given I am on the Home Page
  And I am on the "Vendor Booths" tab
  And I click on "Add Vendor Booth"
  And I fill in "Name" with "Booth of Awesomeness"
  And I fill in "Description" with "La Discripticon of Awesomeness"
  When I submit form
  Then I should see "Vendor Booth Created Successfully!"
  When I click on "Back to Home"
  And I am on the "Vendor Booths" tab
  Then I should see "Booth of Awesomeness"


  
