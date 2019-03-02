Feature:

	Restaurant Page

Background:

	Given I am on the results page
	And I select restaurant, "R"
	And I am redirected to the restaurant page

Scenario: check background color

	When I remain on the search page
	Then I should see background color white smoke
	
Scenario: check title text size
	
	When I remain on the search page
	Then I should see "R" as a title

Scenario: check text size
	
	When I remain on the search page
	Then I should see a results in default text size
	
Scenario: RSPF1
	
	When I remain on the recipe page
	Then I should see the name, address, phone number, and link for the restaurant
	
Scenario: RSPF1a

	When I click on the address
	Then I should be on a Google Maps directions page
	
Scenario: RSPF1b

	When I click on the website link
	Then I should be on the restaurant's home page
	
Scenario: RSPF2
	
	When I click the printable button
	Then I be able to print the restaurant page
	
Scenario: RSPF3
	
	When I click the "Return to Results" button
	Then I should be on the results page
	
Scenario: RSPF4
	
	When I remain on the recipe page
	Then I should see a drop down box for lists
	
Scenario: RSPF5.1
	
	When I select a predefined list
	And I click the "Add to List" button
	Then I should remain on the Recipe page
