
# Manage List Page

Given(/^I searched for "([^"]*)"$/) do |arg1|
  visit "http://localhost:8080/ImHungry/SearchPageController"
  fill_in 'termInput', :with => arg1
  page.find('div#emojiButton.img-container').click
end

Given(/^I clicked the link for "([^"]*)"$/) do |arg1|
  click_link(arg1)
end

Given(/^I selected "([^"]*)" from the drop down$/) do |arg1|
  select arg1, :from => "listDropDown"
end

Given(/^I clicked the "([^"]*)" button$/) do |arg1|
  click_button(arg1)
end

Then(/^I should see background color "([^"]*)"$/) do |arg1|
   expect(find('body').native.css_value('background-color')).to eq(arg1)
end

Then(/^I should see a title$/) do
  pending # these are very much guesses -- fill in based on implementation
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
  select arg1, :from => "listDropDown"
end

When(/^I click the "([^"]*)" button$/) do |arg1|
  click_button(arg1)
end

Then(/^I should be on the "([^"]*)" page$/) do |arg1|
  expect(page).to have_current_path("/"+arg1+"/")
end


# RPFF7

Given(/^I searched for item "([^"]*)" with "([^"]*)" results and was redirected to the Results page$/) do |arg1, arg2|
  visit 'http://localhost:8080/ImHungry/SearchPageController'
  fill_in('termInput', with: arg1)
  fill_in('limitInput', with: arg2)
  click(class:'img-container')
  click('emojiImage')
  click('emojiButton')
  # add check that we are actually on results page?
end

Then(/^I should see "([^"]*)" as the first result$/) do |arg1|
  pending # Write code here that checks the first result is arg1
  # need understanding of the html format to do this
end



# Recipe and Restaurant Page

Given(/^I select recipe, "([^"]*)"$/) do |arg1|
  click_link arg1
end

Then(/^I should see "([^"]*)" as a title$/) do |arg1|
  expect(page).to have_title(arg1)
end

Then(/^I should see a result in default text size$/) do
  pending # Write code here that checks that the font is default
end

Then(/^I should see an image$/) do
  page.should have_css('img')

end

Then(/^I should see the prep and cook time of the dish$/) do
  expect(page).to have_content('Prep Time of Recipe')
  expect(page).to have_content('Cook Time of Recipe')
end

Then(/^I should see the ingredients of the dish$/) do
  expect(page).to have_content('Ingredients')
end

Then(/^I should see instructions for the dish$/) do
  expect(page).to have_content('Instructions')
end

Then(/^I should be able to print the recipe$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a drop down box for lists$/) do
  expect(page).to have_selector('listDropDown')
end

Given(/^I select restaurant, "([^"]*)"$/) do |arg1|
  click arg1
end

Then(/^I should see a results in default text size$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the name, address, phone number, and link for the restaurant$/) do
  expect(page).to have_content('Name')
  expect(page).to have_content('Address')
  expect(page).to have_content('Website link')
  expect(page).to have_content('Phone number')
end

When(/^I click on the address$/) do
  click "Address:"
end

Then(/^I should be on a Google Maps directions page$/) do
  expect(page).to have_path('https://www.google.com/maps/')
end

When(/^I click on the website link$/) do
  click 'Website link'
end

Then(/^I should be on the restaurant's home page$/) do
  expect(page).not_to have_path('/DetailedRestaurantView.jsp/')
end

Then(/^I should be able to print the restaurant page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end



# Results Page

Then(/^I should see the title "([^"]*)"$/) do |arg1|
  expect(page).to have_title(arg1)
end

Then(/^I should see a drop down box with nothing selected$/) do
  expect(page).to have_selector('dropDownList', text: '')
end

Then(/^I should see a "([^"]*)" button$/) do |arg1|
  expect(page).to have_button(arg1)
end

When(/^I click the drop down box$/) do
  click 'dropDownList'
end

Then(/^I should be able to select one of the predefined lists$/) do
  expect(page).to have_field("Manage favorites")
  expect(page).to have_field("Manage do not show")
  expect(page).to have_field("Manage to explore")
end

When(/^I click the "([^"]*)" button with "([^"]*)" selected$/) do |arg1, arg2|
  select arg2
  click arg1
end

Then(/^I should be viewing the "([^"]*)" list$/) do |arg1|
  expect(page).to have_path('ImHungry/ManageListView.jsp/')
end

When(/^I click the "([^"]*)" button with nothing selected$/) do |arg1|
  click arg1
end

Then(/^I should see a column with title "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Then(/^I should see "([^"]*)" restaurants$/) do |arg1|
  pending # Write code here based on html ids
  # expect(page).to have_field('restaurantResults', count: arg1)
end

Then(/^I should see the name, address, stars, driving minutes, and price range for the restaurants$/) do
  expect(page).to have_content('Name')
  expect(page).to have_content('address')
  expect(page).to have_content('stars')
  expect(page).to have_content('driving time')
  expect(page).to have_content('price range')
end

When(/^I click on restaurant result, "([^"]*)"$/) do |arg1|
  click arg1
end

Then(/^I should see "([^"]*)" recipes$/) do |arg1|
  pending # Write code here based on html ids
  # expect(page).to have_field('recipeResults', count: arg1)
end

Then(/^I should see the name, stars, and prep time for the recipes$/) do
  expect(page).to have_content('Name')
  expect(page).to have_content('stars')
  expect(page).to have_content('prep time')
end

When(/^I add a result to a list$/) do
  pending # Write code here based on the implementation
end

When(/^I click on recipe result, "([^"]*)"$/) do |arg1|
  click arg1
end



# Search Page

Given(/^I am on the search page$/) do
  visit "http://localhost:8080/ImHungry/SearchPageController"
end

Then(/^I should see prompt text enter food$/) do
  page.should have_field("termInput", :with=> "Enter food")
  # page.should have_field("termInput", :value=> "Enter food")
end

Then(/^I should see a text box to enter number of results$/) do
  page.should have_field('numResults')
end

Then(/^the default value should be (\d+)$/) do |arg1|
  page.should have_field('numResults', with: arg1)
end

Then(/^I should see a button labeled "([^"]*)"$/) do |arg1|
  page.should have_selector(:link_or_button, arg1)
  # expect(page).to have_button
end

When(/^I enter a value less than (\d+)$/) do |arg1|
  fill_in 'numResults', with: '-1'
  click_button 'FeedMe'
end

Then(/^the text box should not accept the value$/) do
  expect(page).to current_path('/ImHungry/SearchPageController/')
end

When(/^I hover over the text box$/) do
  find('.numResults').hover
end

Then(/^text should appear saying “Number of items to show in results”$/) do
  page.find('div', text: 'Number of items to show in results')
end

When(/^I enter "([^"]*)" in the "([^"]*)" text box$/) do |arg1, arg2|
  fill_in arg2, with: arg1
end

When(/^I click on the "([^"]*)" button$/) do |arg1|
  click_button(arg1)
end


# Some more

Then(/^I am on the "([^"]*)" for "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" on the page$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I am redirected to the "([^"]*)" page$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should remain on the "([^"]*)" page$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

