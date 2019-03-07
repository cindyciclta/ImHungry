Feature:

	Restaurant Page

Background:
	Given I searched for "chinese"
	And I clicked the link for "Northern Cafe"

Scenario: check background color, text size, title text size, RSPF1

	Then I should see background color "rgba(245, 245, 245, 1)"
	And I should see "Northern Cafe" as a title
	And I should see a result in default text size
	And I should see the name, address, phone number, and link for the restaurant
	
Scenario: RSPF1a

	When I click on the address
	Then I should be on Google Maps directions page for Northern Cafe
	
Scenario: RSPF1b

	When I click on the website link
	Then I should be on the restaurant's home page
	
Scenario: RSPF2

	Then I should be able to print
	
Scenario: RSPF3
	
	When I clicks the "Back to Results" button
	Then I am on the "Results for chinese" page
	
Scenario: RSPF4
	
	Then I should see a drop down box for lists
	
Scenario: RSPF5.1
	
	When I select "Favorites" from the drop down
	And I click the "Add to List" button
	Then I am on the "Northern Cafe" page
