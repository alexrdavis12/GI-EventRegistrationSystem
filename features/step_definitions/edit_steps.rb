When(/^I go to the Event Page%/)do
  visit('EventCreate?eid=1')
end

Then(/^I should see created Events%/)do
  expect(page).to have_content("Event")
end

Given /^(?:|I )am on the event page (.+)$/ do |page_name|
  visit path_to(page_name)
end

And(/^There are more than one event on the page$/) do
  visit('EventCreate?eid=1')
  page.find("a", text:"Edit").click
end

When /^(?:|I )click edit"([^"]*)"$/ do |button|
  click_button(button)
end

Then (/^I should see it change to the event form with previous information "(.*?)" with "(.*?)"$/) do |field,text|
  fill_in(field, with:text)
end

When /^(?:|I )click edit question"([^"]*)"$/ do |button|
  click_button(button)
end

Then (/^I should see it change to the question to be edited "(.*?)" with "(.*?)"$/) do |field,text|
  fill_in(field, with:text)
end


