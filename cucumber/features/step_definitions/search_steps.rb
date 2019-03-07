
# Manage List Page

Given(/^I searched for "([^"]*)"$/) do |arg1|
  visit "http://localhost:8080/ImHungry/SearchPageController"
  fill_in 'termInput', :with => arg1
  page.find('div#emojiButton.img-container').click
end

Given(/^I clicked the link for "([^"]*)"$/) do |arg1|
  #page.find(:text=> arg1).click
  #click_link(arg1)
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
  # these are very much guesses -- fill in based on implementation
  # expect(page).to have_title
  # expect(first('title').native.text).to exist
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  page.find('div', text: arg1)
end

When(/^I click on "([^"]*)"$/) do |arg1|
  click_link_or_button arg1
end

Then(/^I am on the "([^"]*)" page for "([^"]*)"$/) do |arg1, arg2|
  expect(page).to have_current_path('/'+arg1+'?Search='+arg2)
end

When(/^I remove "([^"]*)"$/) do |arg1|
  pending # Write code here that selects the remove option on arg1
end

When(/^I refresh the page$/) do
  # driver.navigate.refresh # try this if below doesn't work
  page.evaluate_script("window.location.reload()")
end

Then(/^I do not see "([^"]*)"$/) do |arg1|
  expect(page).to have_no_link(arg1)
end

When(/^I move "([^"]*)" to "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that selects the move option on arg1 and puts it in list arg2
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
  # expect(page).to have_css('h1', text: arg1)
end

Then(/^I should see "([^"]*)" as the first result$/) do |arg1|
  expect(page).to have_content(arg1)
end



# Recipe and Restaurant Page

Then(/^I should see "([^"]*)" as a title$/) do |arg1|
  expect(page).to have_content(arg1, wait: 10)
end

Then(/^I should see a result in default text size$/) do
  page.find('div', wait: 10)[0]
end

Then(/^I should see an image$/) do
  page.should have_css('img')

end

Then(/^I should see the prep and cook time of the dish$/) do
  expect(page).to have_content('Prep Time')
  expect(page).to have_content('Cook Time')
  # pending # make specific to the prep and cook time thank you
end

Then(/^I should see the ingredients of the dish$/) do
  expect(page).to have_content('Ingredients')
  # pending # check first ingredient
end

Then(/^I should see instructions for the dish$/) do
  expect(page).to have_content('Instructions')
  # pending # check first instruction
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

Then(/^I should see a results in default text size$/) do
  pending # Write code here that turns the phrase above into concrete actions
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
  # find(
  expect(page).to have_current_path("/maps/search/?api=1&query=34.0255178,-118.2775239")
  #expect(page).to have_path("https://www.google.com/maps/place/34%C2%B001'31.9%22N+118%C2%B016'39.1%22W/@34.0255178,-118.2775239,17z/data=!3m1!4b1!4m5!3m4!1s0x0:0x0!8m2!3d34.0255178!4d-118.2775239")
end

When(/^I click on the website link$/) do
  page.all('h7.description')[2].click
end

Then(/^I should be on the restaurant's home page$/) do
  expect(page).to have_current_path("/biz/northern-cafe-los-angeles-6?adjust_creative=kOJ4-HptgaXNFbfpVFbrJg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=kOJ4-HptgaXNFbfpVFbrJg")
end



# Results Page

Then(/^I should see the title "([^"]*)"$/) do |arg1|
  expect(page).to have_css('h1', text: arg1)
end

Then(/^I should see a drop down box with nothing selected$/) do
  expect(page).to have_selector('.form-control', text: '')
end

Then(/^I should see a "([^"]*)" button$/) do |arg1|
  # expect(page).to have_button(arg1)
  find(arg1)
end

When(/^I click the drop down box$/) do
  find('.form-control').click
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
  expect(page).to have_content(arg1, wait: 10)
end

Then(/^I should see "([^"]*)" restaurants$/) do |arg1|
  pending # Write code here based on html ids
  # expect(page).to have_field('restaurantResults', count: arg1)
end

Then(/^I should see the name, address, stars, driving minutes, and price range for the restaurants$/) do
  # expect(page).to have_content('Name')
  expect(page).to have_content('address')
  expect(page).to have_content('stars')
  expect(page).to have_content('driving time')
  expect(page).to have_content('price range')
end

When(/^I click on restaurant result, "([^"]*)"$/) do |arg1|
  click_on arg1
end

Then(/^I should see "([^"]*)" recipes$/) do |arg1|
  pending # Write code here based on html ids
  # expect(page).to have_field('recipeResults', count: arg1)
end

Then(/^I should see the name, stars, and prep time for the recipes$/) do
  expect(page).to have_content('stars')
  expect(page).to have_content('prep time')
end

When(/^I add a result to a list$/) do
  pending # Write code here based on the implementation
end

When(/^I click on recipe result, "([^"]*)"$/) do |arg1|
  click_on arg1
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
  # expect(page).to have_content('Number of items to show in results')
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

When(/^I add it to the "([^"]*)" list$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I begin at Indian Relish$/) do
  visit('http://localhost:8080/ImHungry/RedirectionController?action=recipe&term=Indian&index=395&item=0')
end

Given(/^I begin at Northern Cafe$/) do
  visit('http://localhost:8080/ImHungry/RedirectionController?action=restaurant&term=chinese&index=385&item=0')
end



# Background for Recipe
#Given I searched for "Indian"
#	And I clicked the link for "Indian Relish"

# Background for Restaurant
#Given I searched for "Chinese"
#	And I clicked the link for "Northern Cafe"

