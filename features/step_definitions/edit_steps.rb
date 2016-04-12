Given (/^(?:|I )am on the Event page$/) do 
   visit root_path
end

And(/^There are more than one event on the page$/) do 
   visit('eventedit?eid=')
   find('input [name="edit"]')
   #find("a", text:"edit").click
end
Then(/^I should see Events $/) do 
 # xpect(page).to have_content("edit")
 
end

When (/^(?:|I) click Edit$/) do
  
  
end

Then (/^I should see it change to the event form with event information$/) do

end
  
Given (/^(?:|I )am on the Event Question$/) do 
   visit('QuestionEdit?eid=1')
   #find(text: "Edit").click
   click_button("edit")
  
end

When (/^(?:|I )click Edit Question$/) do 
   
end

Then (/^I should see it change to the edit form with question information$/) do

end

 