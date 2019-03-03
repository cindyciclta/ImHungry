
# Manage List Page

Given(/^I searched for "([^"]*)"$/) do |arg1|
  visit "http://localhost:8080/Search.jsp"
  fill_in('Search', with: arg1)
  click_button('FeedMe')
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
  visit "http://localhost:8080/Search.jsp"
  fill_in('Search', with: arg1)
  fill_in('NumResults', with: arg2)
  click_button('FeedMe')
  # add check that we are actually on results page?
end

Then(/^I should see "([^"]*)" as the first result$/) do |arg1|
  pending # Write code here that checks the first result is arg1
  # need understanding of the html format to do this
end



# Recipe and Restaurant Page

Given(/^I am on the "([^"]*)" page$/) do |arg1|
  visit arg1
end

Given(/^I select recipe, "([^"]*)"$/) do |arg1|
  click_link arg1
end

Then(/^I should see "([^"]*)" as a title$/) do |arg1|
  expect(page).to have_title(arg1)
end

Then(/^I should see a result in default text size$/) do
  pending # Write code here that checks that the font is default
end

Then(/^I should see an image of the dish$/) do
  pending # Write code here that checks for the image field
end

Then(/^I should see the prep and cook time of the dish$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the ingredients of the dish$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see instructions for the dish$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be able to print the recipe$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a drop down box for lists$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should remain on the "([^"]*)" page$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I select restaurant, "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a results in default text size$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the name, address, phone number, and link for the restaurant$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click on the address$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be on a Google Maps directions page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click on the website link$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be on the restaurant's home page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I be able to print the restaurant page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a collage image$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the title "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a drop down box with nothing selected$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a "([^"]*)" button$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click the drop down box$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be able to select one of the predefined lists$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click the "([^"]*)" button with "([^"]*)" selected$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be viewing the "([^"]*)" list$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click the "([^"]*)" button with nothing selected$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a column with title "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" restaurants$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the name, address, stars, driving minutes, and price range for the restaurants$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click on a restaurant result$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" recipes$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the name, stars, and prep time for the recipes$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I add a result to a list$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be on the Results page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click on a recipe result$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

# Search Page

Given(/^I am on the search page$/) do
  visit "http://localhost:8080/Search.jsp"
end

Then(/^I should see prompt text enter food$/) do
  page.should have_field("EnterFood")
end

Then(/^I should see a text box to enter number of results$/) do
  page.should have_field('NumResults')
end

Then(/^the default value should be (\d+)$/) do |arg1|
  page.should have_field('NumResults', with: arg1)
end

Then(/^I should see a button labeled "([^"]*)"$/) do |arg1|
  page.should have_selector(:link_or_button, arg1)
  # expect(page).to have_button
end

When(/^I enter a value less than (\d+)$/) do |arg1|
  fill_in 'NumResults', with: '-1'
  click_button 'FeedMe'
end

Then(/^the text box should not accept the value$/) do
  expect(page).to have_title("Search")
end

When(/^I hover over the text box$/) do
  find('.NumResults').hover
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

