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
  
  
  #click_button('Q1_down')
  find_by_id('create_q_btn').click
  find_by_id('Q1_up').click
  
  
#  find(:xpath, "//input[contains(@Q1_down, 'commit')]").click()
  
  #q1index = find_by_id("Q1_down")[:index]
  #raise "Q1_down index is \"#{q1index}\"...\n"
  
  
  #expect(page).to have
  
  #expect(page.find('li:nth-child(1)')).to have_tag(:id=> )
  
  q1index = page.body.index('Q1_down').to_i
  q2index = page.body.index('Q2_down').to_i
  
  expect(q2index).to be <= (q1index)
  
end

When(/^I click the down arrow on a question$/) do
  visit('QuestionCreate?eid=1')
  #click_button('create_q_btn')
  #-----find_all('a',:class=>"btn btn-sm pull-right")
  find("a", text:"Add Question").click
  page.find_all("a", text:"javascript:move_q_down(2)")
  
  #click_button('Q1_down')
  find_by_id('create_q_btn').click
  find_by_id('Q1_down').click
  
  
  
end

Then (/^I should see it change position with the question above it$/) do
 
  q1index = page.body.index('Q1_down').to_i
  q2index = page.body.index('Q2_down').to_i
  
  expect(q2index).to be <= (q1index)
end

Then (/^I should see it change position with the question below it$/) do
  q1index = page.body.index('Q1_down').to_i
  q2index = page.body.index('Q2_down').to_i
  
  expect(q2index).to be <= (q1index)
end

