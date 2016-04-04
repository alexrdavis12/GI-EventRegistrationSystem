Given(/^I am on the event page$/) do
  visit""
end 

When(/^I click edit$/)do
  find_link("edit").click
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field,text|
  fill_in(field, with:text)
end

When(/^I click the "(.*?)" button$/) do |arg1|
  click_button(arg1)
end

Then(/^I should see it change to the event form with previous information already in field)
