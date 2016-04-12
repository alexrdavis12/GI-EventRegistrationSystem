Feature: User Profile 
 
  As an User
  So that I can see my information

Background: Logged in as a User 

Scenario: User sees Home after logging in
  When I login
  Then I am on the Home Page
  
  