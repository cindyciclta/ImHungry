Feature:

	Restaurant Page

Background:

	Given I searched for "Chinese"
	And I select restaurant, "Northern Cafe"

Scenario: check background color

	Then I should see background color "#f5f5f5"
	
Scenario: check title text size
	
	Then I should see "R" as a title

Scenario: check text size
	
	Then I should see a results in default text size
	
Scenario: RSPF1
	
	Then I should see the name, address, phone number, and link for the restaurant
	
Scenario: RSPF1a

	When I click on the address
	Then I should be on a Google Maps directions page
	
Scenario: RSPF1b

	When I click on the website link
	Then I should be on the restaurant's home page
	
Scenario: RSPF2
	
	When I click the "Printable" button
	Then I should be able to print the restaurant page
	
Scenario: RSPF3
	
	When I click the "Back to results" button
	Then I should be on the "ResultsPageView.jsp" page
	
Scenario: RSPF4
	
	Then I should see a drop down box for lists
	
Scenario: RSPF5.1
	
	When I select "Favorites" from the drop down
	And I click the "Add to List" button
	Then I should be on the "Recipe" page
