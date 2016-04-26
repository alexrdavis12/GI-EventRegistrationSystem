

Given /the following users exist/ do |users|
  users.hashes.each do |user|
    User.create user
  end
end

Given (/^Events Exits$/) do |events|
  events.hashes.each do |event|
    Event.create event
  end
end

And (/^I am on the login page$/) do
    visit('/login')
    expect(page).to have_content("Login")
end

And (/^choose "(.*?)"$/) do |btn|
    choose(btn)
end

And (/^I am on the Profile tab$/) do
    find_by_id('profile').click
end

And (/^I am on the "(.*?)" tab$/) do |btncntnt|
    page.find("a", text:btncntnt).click
    expect(page).to have_content("Available Events")
end

Given (/^I am on the create page$/) do
    visit('/login')
    expect(page).to have_content("Login")
    #click('Register')
    page.find("a", text:"Register").click
    expect(page).to have_content("Password")
end

Given (/^I am on the Home Page$/) do
    visit('/home')
    expect(page).to have_content("Registered Events")
end

Given(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, :with => arg2
end

When /^I press "(.+)"$/ do |button| 
    click_button(button)
end

When /^I click on "(.+)"$/ do |btn| 
    page.find("a", text:btn).click
end

When (/^I submit form$/) do
    find('input[name="commit"]').click
end

Then /^I should see "(.+)"$/ do |content|
    expect(page).to have_content(content)
end

Then /^I should not see "(.+)"$/ do |content|
    expect(page).to_not have_content(content)
end

