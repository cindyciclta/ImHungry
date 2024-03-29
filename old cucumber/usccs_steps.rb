Given(/^I am on the USC CS webpage$/) do
  visit 'https://www.cs.usc.edu/'
end

When(/^I click the Contact Us button$/) do
  click_on('Contact Us')
end

Then(/^I should be on the Contact page$/) do
  expect(page).to have_current_path('/about/contact/')
end


## START HERE ##


# Manage List Page

Given(/^I searched for "([^"]*)"$/) do |arg1|
  visit "http://localhost:8080/ImHungry/SearchPageController"
  fill_in 'termInput', :with => arg1
  page.find('div#emojiButton.img-container').click
end

Given(/^I clicked the link for "([^"]*)"$/) do |arg1|
  page.find('tr', :text=> arg1, match: :first, wait:30).click
end

Given(/^I selected "([^"]*)" from the drop down$/) do |arg1|
  select arg1, :from => "managelistselect"
end

Given(/^I clicked the "([^"]*)" button$/) do |arg1|
  click_on(arg1)
end

Given(/^I clicks the "([^"]*)" button$/) do |arg1|
  page.find('a.btn.btn-secondary', text: arg1).click
end

Then(/^I should see background color "([^"]*)"$/) do |arg1|
   expect(find('body').native.css_value('background-color')).to eq(arg1)
end

Then(/^I should see a title$/) do
  find('h1')
end

When(/^I click on "([^"]*)"$/) do |arg1|
  click_link_or_button arg1
end

Then(/^I am on the "([^"]*)" page for "([^"]*)"$/) do |arg1, arg2|
  expect(page).to have_current_path('/'+arg1+'?Search='+arg2)
end

When(/^I remove "([^"]*)"$/) do |arg1|
  page.find('i.fas.fa-times', match: :first).click
end

When(/^I refresh the page$/) do
  page.evaluate_script("window.location.reload()")
end

Then(/^I do not see "([^"]*)"$/) do |arg1|
  expect(page).to have_no_content(arg1)
end

When(/^I move "([^"]*)"$/) do |arg1|
  page.find('i.fas.fa-sign-out-alt', match: :first).click
end

When(/^I select "([^"]*)" from the drop down$/) do |arg1|
  select arg1, :from => "managelistselect"
end

When(/^I click the "([^"]*)" button$/) do |arg1|
  click_on(arg1)
end

Then(/^I should be on the "([^"]*)" page$/) do |arg1|
  expect(page).to have_current_path(arg1)
end



# RPFF7

Given(/^I searched for item "([^"]*)" with "([^"]*)" results and was redirected to the Results page$/) do |arg1, arg2|
  visit 'http://localhost:8080/ImHungry/SearchPageController'
  fill_in('termInput', with: arg1)
  fill_in('limitInput', with: arg2)
  page.find('div#emojiButton.img-container').click
  expect(page).to have_css('h1', text: arg1, wait: 50)
end

Then(/^I should see "([^"]*)" as the first result for "([^"]*)"$/) do |arg1, arg2|
  expect(page).to have_content(arg2 + ' ' + arg1)
end



# Recipe and Restaurant Page

Then(/^I should see "([^"]*)" as a title$/) do |arg1|
  expect(page).to have_content(arg1, wait: 10)
end

Then(/^I should see a result in default text size$/) do
  page.find('div', wait: 10, match: :first)
end

Then(/^I should see an image$/) do
  page.should have_css('img')

end

Then(/^I should see the prep and cook time of the dish$/) do
  expect(page).to have_content('Prep Time')
  expect(page).to have_content('Cook Time')
end

Then(/^I should see the ingredients of the dish$/) do
  expect(page).to have_content('Ingredients')
end

Then(/^I should see instructions for the dish$/) do
  expect(page).to have_content('Instructions')
end

Then(/^I should be able to print$/) do
  page.find('a.btn.btn-secondary', text: 'Printable Version')
  # use above with .click to click, but capybara can not navigate the popup
end

Then(/^I should see a drop down box for lists$/) do
  page.find('select#managelistselect.form-control')
end

Given(/^I select restaurant, "([^"]*)"$/) do |arg1|
  click arg1
end

Then(/^I should see the name, address, phone number, and link for the restaurant$/) do
  # expect(page).to have_content('Name')
  expect(page).to have_content('Address')
  expect(page).to have_content('Website Link')
  expect(page).to have_content('Phone Number')
end

When(/^I click on the address$/) do
  page.find('h7.description', match: :first).click
end

Then(/^I should be on Google Maps directions page for Northern Cafe$/) do
  expect(page).to have_current_path("/maps/search/?api=1&query=34.0255178,-118.2775239")
end

When(/^I click on the website link$/) do
  page.all('h7.description')[2].click
end

Then(/^I should be on the restaurant's home page, "([^"]*)"$/) do |arg1|
  expect(page).to have_current_path(arg1)
end



# Results Page

Then(/^I should see the title "([^"]*)"$/) do |arg1|
  expect(page).to have_css('h1', text: arg1)
end

Then(/^I should see a drop down box with nothing selected$/) do
  expect(page).to have_selector('.form-control', text: '')
end

Then(/^I should see a "([^"]*)" button$/) do |arg1|
  find(arg1)
end

When(/^I click the drop down box$/) do
  find('.form-control', match: :first).click
end

Then(/^I should be able to select one of the predefined lists$/) do
  expect(page).to have_content("Favorites")
  expect(page).to have_content("Do Not Show")
  expect(page).to have_content("To Explore")
end

When(/^I click the "([^"]*)" button with "([^"]*)" selected$/) do |arg1, arg2|
  find('.form-control', match: :first).click
  select arg2
  click_on arg1
end

Then(/^I should be viewing the "([^"]*)" list$/) do |arg1|
  expect(page).to have_css('h1', text: arg1)
end

When(/^I click the "([^"]*)" button with nothing selected$/) do |arg1|
  click_on arg1
end

Then(/^I should see a column with title "([^"]*)"$/) do |arg1|
  page.evaluate_script("window.location.reload()")
  expect(page).to have_content(arg1, wait: 10)
end

Then(/^I should see "([^"]*)" restaurants$/) do |arg1|
  expect(page).to have_content('driving', count: arg1)
end

Then(/^I should see the name, address, stars, driving minutes, and price range for the restaurants$/) do
  # expect(page).to have_content('Name')
  # expect(page).to have_content('address')
  expect(page).to have_content('★')
  expect(page).to have_content('minutes of driving')
  expect(page).to have_content(' to ')
end

When(/^I click on restaurant result, "([^"]*)"$/) do |arg1|
  click_on arg1
end

Then(/^I should see "([^"]*)" recipes$/) do |arg1|
  expect(page).to have_content('Prep', count: arg1)
end

Then(/^I should see the name, stars, and prep time for the recipes$/) do
  # expect(page).to have_content('Name')
  expect(page).to have_content('★')
  expect(page).to have_content('Prep:')
  expect(page).to have_content('Cook:')
end

# Search Page

Given(/^I am on the search page$/) do
  visit "http://localhost:8080/ImHungry/SearchPageController"
end

Then(/^I should see prompt text enter food$/) do
  page.should have_field("termInput")
end

Then(/^I should see a text box to enter number of results$/) do
  page.should have_field('limitInput')
end

Then(/^the default value should be (\d+)$/) do |arg1|
  page.should have_field('limitInput', with: arg1)
end

Then(/^I should see a button labeled "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

When(/^I enter a negative value$/) do
  fill_in 'limitInput', with: '-1'
  page.find('div#emojiButton.img-container').click
end

Then(/^the text box should not accept the value$/) do
  expect(page).to have_current_path('/ImHungry/SearchPageController', wait: 10)
end

When(/^I hover over the text box$/) do
  find(:css, '#numResults').hover
end

Then(/^text should appear saying “Number of items to show in results”$/) do
  page.find('#limitInput')[ 'Number of items to show in results']
end

When(/^I enter "([^"]*)" in the "([^"]*)" text box$/) do |arg1, arg2|
  fill_in arg2, with: arg1
end

When(/^I click on the "([^"]*)" button$/) do |arg1|
  click_button(arg1)
end


# Some more

Then(/^I am on the "([^"]*)" page$/) do |arg1|
  expect(page).to have_css('h1', text: arg1)
end

Then(/^I should see "([^"]*)" on the page$/) do |arg1|
  expect(page).to have_content(arg1)
end

Then(/^I am the "([^"]*)" page$/) do |arg1|
  expect(page).to have_css('h1', text: arg1)
end



## MORE ##


# Manage List Page

Given(/^I searched for "([^"]*)"$/) do |arg1|
  visit "http://localhost:8080/ImHungry/SearchPageController"
  fill_in 'termInput', :with => arg1
  page.find('div#emojiButton.img-container').click
  expect(page).to have_css('h1', text: arg1, wait: 50)
end

Given(/^I clicked the link for "([^"]*)"$/) do |arg1|
  page.find('tr', :text=> arg1, match: :first, wait:30).click
end

Given(/^I selected "([^"]*)" from the drop down$/) do |arg1|
  select arg1, :from => "managelistselect"
end

Given(/^I clicked the "([^"]*)" button$/) do |arg1|
  click_on(arg1)
end

Given(/^I clicks the "([^"]*)" button$/) do |arg1|
  page.find('a.btn.btn-secondary', text: arg1).click
end

Then(/^I should see background color "([^"]*)"$/) do |arg1|
   expect(find('body').native.css_value('background-color')).to eq(arg1)
end

Then(/^I should see a title$/) do
  find('h1')
end

When(/^I click on "([^"]*)"$/) do |arg1|
  click_link_or_button arg1
end

Then(/^I am on the "([^"]*)" page for "([^"]*)"$/) do |arg1, arg2|
  expect(page).to have_current_path('/'+arg1+'?Search='+arg2)
end

When(/^I remove "([^"]*)"$/) do |arg1|
  page.find('i.fas.fa-times', match: :first).click
end

When(/^I refresh the page$/) do
  page.evaluate_script("window.location.reload()")
end

Then(/^I do not see "([^"]*)"$/) do |arg1|
  expect(page).to have_no_content(arg1)
end

When(/^I move "([^"]*)"$/) do |arg1|
  page.find('i.fas.fa-sign-out-alt', match: :first).click
end

When(/^I select "([^"]*)" from the drop down$/) do |arg1|
  select arg1, :from => "managelistselect"
end

When(/^I click the "([^"]*)" button$/) do |arg1|
  click_on(arg1)
end

Then(/^I should be on the "([^"]*)" page$/) do |arg1|
  expect(page).to have_current_path(arg1)
end

Then(/^I should be on Google Maps directions page for Maccheroni Republic$/) do
  expect(page).to have_current_path("/maps/search/?api=1&query=34.050039,-118.248552")
end

Then(/^I should be on Google Maps directions page for Dulce$/) do
  expect(page).to have_current_path("/maps/search/?api=1&query=34.025354,-118.285446")
end

# RPFF7

Given(/^I searched for item "([^"]*)" with "([^"]*)" results and was redirected to the Results page$/) do |arg1, arg2|
  visit 'http://localhost:8080/ImHungry/SearchPageController'
  fill_in('termInput', with: arg1)
  fill_in('limitInput', with: arg2)
  page.find('div#emojiButton.img-container').click
  expect(page).to have_css('h1', text: arg1, wait: 50)
end

Then(/^I should see "([^"]*)" as the first result for "([^"]*)"$/) do |arg1, arg2|
  expect(page).to have_content(arg2 + ' ' + arg1)
end



# Recipe and Restaurant Page

Then(/^I should see "([^"]*)" as a title$/) do |arg1|
  expect(page).to have_content(arg1, wait: 10)
end

Then(/^I should see a result in default text size$/) do
  page.find('div', wait: 10, match: :first)
end

Then(/^I should see an image$/) do
  page.should have_css('img')

end

Then(/^I should see the prep and cook time of the dish$/) do
  expect(page).to have_content('Prep Time')
  expect(page).to have_content('Cook Time')
end

Then(/^I should see the ingredients of the dish$/) do
  expect(page).to have_content('Ingredients')
end

Then(/^I should see instructions for the dish$/) do
  expect(page).to have_content('Instructions')
end

Then(/^I should be able to print$/) do
  page.find('a.btn.btn-secondary', text: 'Printable Version')
  # use above with .click to click, but capybara can not navigate the popup
end

Then(/^I should see a drop down box for lists$/) do
  page.find('select#managelistselect.form-control')
end

Given(/^I select restaurant, "([^"]*)"$/) do |arg1|
  click arg1
end

Then(/^I should see the name, address, phone number, and link for the restaurant$/) do
  # expect(page).to have_content('Name')
  expect(page).to have_content('Address')
  expect(page).to have_content('Website Link')
  expect(page).to have_content('Phone Number')
end

When(/^I click on the address$/) do
  page.find('h7.description', match: :first, wait: 20).click
end

Then(/^I should be on Google Maps directions page for Northern Cafe$/) do
  expect(page).to have_current_path("/maps/search/?api=1&query=34.0255178,-118.2775239")
end

When(/^I click on the website link$/) do
  page.all('h7.description', wait: 20)[2].click
end

Then(/^I should be on the restaurant's home page, "([^"]*)"$/) do |arg1|
  expect(page).to have_current_path(arg1)
end



# Results Page

Then(/^I should see the title "([^"]*)"$/) do |arg1|
  expect(page).to have_css('h1', text: arg1)
end

Then(/^I should see a drop down box with nothing selected$/) do
  expect(page).to have_selector('.form-control', text: '')
end

Then(/^I should see a "([^"]*)" button$/) do |arg1|
  find(arg1)
end

When(/^I click the drop down box$/) do
  find('.form-control', match: :first).click
end

Then(/^I should be able to select one of the predefined lists$/) do
  expect(page).to have_content("Favorites")
  expect(page).to have_content("Do Not Show")
  expect(page).to have_content("To Explore")
end

When(/^I click the "([^"]*)" button with "([^"]*)" selected$/) do |arg1, arg2|
  find('.form-control', match: :first).click
  select arg2
  click_on arg1
end

Then(/^I should be viewing the "([^"]*)" list$/) do |arg1|
  expect(page).to have_css('h1', text: arg1)
end

When(/^I click the "([^"]*)" button with nothing selected$/) do |arg1|
  click_on arg1
end

Then(/^I should see a column with title "([^"]*)"$/) do |arg1|
  page.evaluate_script("window.location.reload()")
  expect(page).to have_content(arg1, wait: 10)
end

Then(/^I should see "([^"]*)" restaurants$/) do |arg1|
  expect(page).to have_content('driving', count: arg1)
end

Then(/^I should see the name, address, stars, driving minutes, and price range for the restaurants$/) do
  # expect(page).to have_content('Name')
  # expect(page).to have_content('address')
  expect(page).to have_content('★')
  expect(page).to have_content('minutes of driving')
  expect(page).to have_content(' to ')
end

When(/^I click on restaurant result, "([^"]*)"$/) do |arg1|
  click_on arg1
end

Then(/^I should see "([^"]*)" recipes$/) do |arg1|
  expect(page).to have_content('Prep', count: arg1)
end

Then(/^I should see the name, stars, and prep time for the recipes$/) do
  # expect(page).to have_content('Name')
  expect(page).to have_content('★')
  expect(page).to have_content('Prep:')
  expect(page).to have_content('Cook:')
end

# Search Page

Given(/^I am on the search page$/) do
  visit "http://localhost:8080/ImHungry/SearchPageController"
end

Then(/^I should see prompt text enter food$/) do
  page.should have_field("termInput")
end

Then(/^I should see a text box to enter number of results$/) do
  page.should have_field('limitInput')
end

Then(/^the default value should be (\d+)$/) do |arg1|
  page.should have_field('limitInput', with: arg1)
end

Then(/^I should see a button labeled "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

When(/^I enter a negative value$/) do
  fill_in 'limitInput', with: '-1'
  page.find('div#emojiButton.img-container').click
end

Then(/^the text box should not accept the value$/) do
  expect(page).to have_current_path('/ImHungry/SearchPageController', wait: 10)
end

When(/^I hover over the text box$/) do
  find(:css, '#numResults').hover
end

Then(/^text should appear saying “Number of items to show in results”$/) do
  page.find('#limitInput')[ 'Number of items to show in results']
end

When(/^I enter "([^"]*)" in the "([^"]*)" text box$/) do |arg1, arg2|
  fill_in arg2, with: arg1
end

When(/^I click on the "([^"]*)" button$/) do |arg1|
  click_button(arg1)
end


# Some more

Then(/^I am on the "([^"]*)" page$/) do |arg1|
  expect(page).to have_css('h1', text: arg1)
end

Then(/^I should see "([^"]*)" on the page$/) do |arg1|
  expect(page).to have_content(arg1)
end

Then(/^I am the "([^"]*)" page$/) do |arg1|
  expect(page).to have_css('h1', text: arg1)
end




