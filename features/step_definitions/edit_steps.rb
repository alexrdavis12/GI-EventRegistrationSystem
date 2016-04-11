Given /^(?:|I )am on the Event page (.+)$/ do |page_name|
   pending # express the regexp above with the code you wish you had visit path_to(page_name)
end

And(/^There are more than one event on the page$/) do
   #visit('EventCreate?eid=1')
   page.find("a", text:"Edit").click
   pending # express the regexp above with the code you wish you had
end

When (/^(?:|I )click Edit"([^"]*)"$/) do |button| 
   click_button(button)
   pending # express the regexp above with the code you wish you had
end

Then (/^I should see the event form with event information "(.*?)" with "(.*?)"$/) do |field,text|
   fill_in(field, with:text)
   pending # express the regexp above with the code you wish you had
end

Given /^(?:|I )am on the Event Question (.+)$/ do |page_name|
   #pending
end

When /^(?:|I )click Edit Question"([^"]*)"$/ do |button|
   click_button(button)
   pending # express the regexp above with the code you wish you had
end

Then (/^I should see the event form with question information "(.*?)" with "(.*?)"$/) do |field,text|
   fill_in(field, with:text)
   pending # express the regexp above with the code you wish you had
end



