Given /^(?:|I )am on the Event Page (.+)$/ do |page_name|
  visit path_to(page_name)
end

And(/^There are more than one event on the page$/) do
  visit('EventCreate?eid=1')
  page.find("a", text:"Edit").click
end

When /^(?:|I )click Edit"([^"]*)"$/ do |button|
  click_button(button)
end

Then (/^I should see the event form with event information "(.*?)" with "(.*?)"$/) do |field,text|
  fill_in(field, with:text)
end

When /^(?:|I )click Edit Question"([^"]*)"$/ do |button|
  click_button(button)
end

Then (/^I should see the event form with question information "(.*?)" with "(.*?)"$/) do |field,text|
  fill_in(field, with:text)
end



