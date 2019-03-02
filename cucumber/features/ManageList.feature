Feature:

	Manage List Page

Background:

	Given I searched for "F"
	And I selected "Item"
	And I added Item to the Favorites List
	And I returned to the results page
	And I selected Favorites
	And I clicked Manage List

Scenario: check background color

	When I remain on the Manage List page
	Then I should see background color white smoke
	
Scenario: check title text size
	
	When I remain on the Manage List page
	Then I should see a title

Scenario: RTPF7a.2 and LMPF1

	When I remain on the Manage List page
	Then I should see Item
	
Scenario: LMPF2

	When I click on Item
	Then I am on the Details page for Item
	
Scenario: LMPF3.1

	When I remove Item
	And I refresh the page
	Then I do not see Item
	
Scenario: LMPF3.2, LMPF6, LMPF7

	When I move Item to another list
	And I select that list from the drop down
	And I click the "Manage List" button
	Then I am on the Manage List page for that list
	And I see Item on the page
	
Scenario: LMPF4

	When I click the "Results Page" button
	Then I should be on the results page

Scenario: LMPF5

	When I click the "Return to Search Page" button
	Then I should be on the Search page

Scenario: LMPF7a

	When I select the Favorites list
	And I click the "Add to List" button
	Then I should remain on the Manage List page for Favorites
