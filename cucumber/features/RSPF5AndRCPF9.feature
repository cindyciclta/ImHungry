Feature:

	Restaurant Page Functionality 5 and Recipe Page Functionality 9

Background:

	Given I searched for item "F" with "X" results and was redirected to the Results page
	And I selected the first recipe, "Recipe1"
	And I added Recipe1 to the Favorite list
	And I returned to the results page
	And I selected the first restaurant, "Restaurant1"
	And I added Restaurant1 to the Favorite list
	And I returned to the results page
	And I select "Favorites" from the drop down
	And I click "Manage List"
	
Scenario: RCPF9.2

	When I click the remain on the Manage List page
	Then I should see Recipe1 on the page

Scenario: RCPF5.2

	When I click the remain on the Manage List page
	Then I should see Restaurant1 on the page
