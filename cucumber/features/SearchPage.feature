Feature:

	Search Page

Background:

	Given I am on the search page

Scenario: check background color

	When I remain on the search page
	Then I should see background color white smoke
	
Scenario: check title text size
	
	When I remain on the search page
	Then I should see a title

Scenario: SPF2

	When I remain on the search page
	Then I should see prompt text enter food

Scenario: SPF3.1

	When I remain on the search page
	Then I should see a text box to enter number of results
	And the default value should be 5
	
Scenario: SPF3.2

	When I enter a value less than 1
	Then the text box should not accept the value
	
Scenario: SPF3.3

	When I hover over the text box
	Then text should appear saying “Number of items to show in results”
	
Scenario: SPF4

	When I remain on the search page
	Then I should see a button labeled "Feed Me"

Scenario: SPF5

	When I enter text
	And I click on the "Feed Me" button
	Then I should be on the Results page 
	
