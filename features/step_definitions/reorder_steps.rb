When(/^I go to the Questions Page$/) do
  visit('QuestionCreate?eid=1')
end

Then(/^I should see a Question$/) do
  expect(page).to have_content("Question")
end

Given(/^I am on the Questions Page$/) do
  visit('QuestionCreate?eid=1')
end

And(/^There are more than one question on the page$/) do
  visit('QuestionCreate?eid=1')
  page.find("a", text:"Add Question").click
end
#href:"javascript:move_q_up(2)"

When(/^I click the up arrow on a question$/) do
  visit('QuestionCreate?eid=1')
  #click_button('create_q_btn')
  #-----find_all('a',:class=>"btn btn-sm pull-right")
  find("a", text:"Add Question").click
  #find("a", text:"Add Question").click
  #page.find(:text =>'Q2').find(:text =>'javascript:move_q_up(2)')
  #click_link(page.all('a', text: 'javascript:move_q_up(2)'))
  #page.find_link('a',text: 'javascript:move_q_up(2)')
  page.find_all("a", text:"javascript:move_q_up(2)")
  #find("a", :text => "::before").click
  #expect(page).to have_tag('div', text:'Q1')
  #find("div", text:"Q1")
  #expect(page).to has_content('li:last-child', :text=>'Q1')
  
end

When(/^I click the down arrow on a question$/) do
  visit('QuestionCreate?eid=1')
  #click_button('create_q_btn')
  #-----find_all('a',:class=>"btn btn-sm pull-right")
  find("a", text:"Add Question").click
  #find("a", text:"Add Question").click
  #page.find(:text =>'Q2').find(:text =>'javascript:move_q_up(2)')
  #click_link(page.all('a', text: 'javascript:move_q_up(2)'))
  #page.find_link('a',text: 'javascript:move_q_up(2)')
  page.find_all("a", text:"javascript:move_q_down(2)")
  #page.find_link("")
  
  #find("a[@href='javascript:move_q_down(2)']").click
  
  #find("a", :text => "::before").click
  #expect(page).to have_tag('div', text:'Q1')
  #find("div", text:"Q1")
  #expect(page).to has_content('li:last-child', :text=>'Q1')
  
end

Then (/^I should see it change position with the question above it$/) do
    #page.body.index(:text => 'Q1')
end

Then (/^I should see it change position with the question below it$/) do
    
end

