Given (/^(?:|I )am on the Event page$/) do 
   visit root_path
end

And(/^There are more than one event on the page$/) do 
<<<<<<< HEAD
   visit('eventedit?eid=')
   find('input [name="edit"]')
   #find("a", text:"edit").click
end
Then(/^I should see Events $/) do 
 # xpect(page).to have_content("edit")
=======
   visit('eventedit?eid=1')
   page.find("a", text:"edit").click
end

Then(/^I should see Events $/) do 
   expect(page).to have_content("Edit")
>>>>>>> 32ba10f2a087d210b10348531d391cbcf21adb2a
 
end

When (/^(?:|I) click Edit$/) do
<<<<<<< HEAD
  
=======
   visit('eventedit?eid=1')
>>>>>>> 32ba10f2a087d210b10348531d391cbcf21adb2a
  
end

Then (/^I should see it change to the event form with event information$/) do
<<<<<<< HEAD
=======
   expect(page).to have_content("Edit")
>>>>>>> 32ba10f2a087d210b10348531d391cbcf21adb2a

end
  
Given (/^(?:|I )am on the Event Question$/) do 
   visit('QuestionEdit?eid=1')
   #find(text: "Edit").click
   click_button("edit")
  
end

When (/^(?:|I )click Edit Question$/) do 
<<<<<<< HEAD
   
end

Then (/^I should see it change to the edit form with question information$/) do
=======
   visit('QuestionEdit?eid=1')
end

Then (/^I should see it change to the edit form with question information$/) do
   visit('QuestionEdit?eid=1')
   page.find("a", text:"edit").click
>>>>>>> 32ba10f2a087d210b10348531d391cbcf21adb2a

end

 