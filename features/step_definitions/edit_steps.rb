Given /^(?:|I )am on the Event Page (.+)$/ do |page_name|
  pending #visit path_to(page_name)
end

And(/^There are more than one event on the page$/) do
  pending #visit('EventCreate?eid=1')
  pending #page.find("a", text:"Edit").click
end

When /^(?:|I )click Edit"([^"]*)"$/ do |button|
  pending # click_button(button)
end

Then (/^I should see the event form with event information "(.*?)" with "(.*?)"$/) do |field,text|
  pending #fill_in(field, with:text)
end

When /^(?:|I )click Edit Question"([^"]*)"$/ do |button|
  pending #click_button(button)
end

Then (/^I should see the event form with question information "(.*?)" with "(.*?)"$/) do |field,text|
  pending #fill_in(field, with:text)
end



