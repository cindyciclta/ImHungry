Feature:

	Search Page

Background:

	Given I am on the search page

Scenario: check background color

	Then I should see background color "white_smoke"
	
Scenario: check title text size
	
	Then I should see a title

Scenario: SPF2

	Then I should see prompt text enter food

Scenario: SPF3.1

	Then I should see a text box to enter number of results
	And the default value should be 5
	
Scenario: SPF4

	Then I should see a button labeled "Feed Me"

Scenario: SPF3.2

	When I enter a value less than 1
	Then the text box should not accept the value
	
Scenario: SPF3.3

	When I hover over the text box
	Then text should appear saying “Number of items to show in results”

Scenario: SPF5

	When I enter "Chinese" in the "searchBar" text box
	And I click on the "emojiButton" button
	Then I should be on the "Results" page 
	