Given(/^I Login in as an administrator$/) do
  User.create!([{:email => 'info@americangimuseum.org', :lastname => 'Admin', :firstname => 'Admin',:password=>'MAGIadmin',:gender=>'',:created_at=>'',:updated_at=>'',:salt=>'$2a$10$jhA61Mm9GFSg.pcqwzJphu',:encrypted_password=>'$2a$10$jhA61Mm9GFSg.pcqwzJphuB/zwJO5nUmvIm.JfPMY15/toN2oo6jW',:level=>'0'}])
  visit("/login")
  fill_in 'email', :with => 'info@americangimuseum.org'
  fill_in 'login_password', :with => 'MAGIadmin'
  find('input[name="commit"]').click
  #find("div", text:"Log in").click
  expect(page).to have_content("Welcome home, Administrator")
end

When(/^I click the Create Event button$/)do
    visit('EventCreate?eid=1')
end

Then(/^I should see the event form$/) do
    expect(page).to have_content("event")
end

When(/^I click the View Events button$/)do
    visit('allevent?eid=1')
end

Then(/^I should see events$/) do 
    expect(page).to have_content("Event")
end

When(/^I click the Profile button$/) do 
    visit('profile?eid=1')
end 

Then(/^I should see admin profile$/) do 
    expect(page). to have_content("Profile")
end 