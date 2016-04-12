Given (/^(?:|I )am on the Event page$/) do 
   visit('EventCreate?eid=1')
   #pending # express the regexp above with the code you wish you had visit path_to(page_name)
end

And(/^There are more than one event on the page$/) do
   #visit('EventCreate?eid=1')
   #page.find("a", text:"Edit").click
   #pending # express the regexp above with the code you wish you had
end

When (/^(?:|I )click Edit$/) do 
   #click_button(button)
   #pending # express the regexp above with the code you wish you had
end

Then (/^I should see it change to the event form with event information$/) do
  #pending fill_in(field, with:text)
end
  
Given (/^(?:|I )am on the Event Question$/) do 
   #pending
end

When (/^(?:|I )click Edit Question$/) do 
   #click_button(button)
   #pending # express the regexp above with the code you wish you had
end

Then (/^I should see it change to the edit form with question information$/) do 
   #fill_in(field, with:text)
   #ending # express the regexp above with the code you wish you had
end





