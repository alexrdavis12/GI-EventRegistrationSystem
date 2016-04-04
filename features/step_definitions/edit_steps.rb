Given /^(?:|I )am on the event page (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )click edit"([^"]*)"$/ do |button|
  click_button(button)
end

Then (/^I edit  "(.*?)" with "(.*?)"$/) do |field,text|
  fill_in(field, with:text)
end


