When(/^I go to the Event Page%/)do
  visit()
end

Then(/^I should see events%/)do
  expect(page).to have_content("Event")
end

Given /^(?:|I )am on the event page (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )click edit"([^"]*)"$/ do |button|
  click_button(button)
end

Then (/^I should see it change to the event form with previous information "(.*?)" with "(.*?)"$/) do |field,text|
  fill_in(field, with:text)
end



