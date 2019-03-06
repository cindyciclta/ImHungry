Feature:

	Manage List Page

Background:

	Given I searched for "Chinese"
	And I clicked the link for "Northern Cafe"
	And I selected "Favorites" from the drop down
	And I clicked the "Add to List" button
	And I clicked the "Back to results" button
	And I selected "Favorites" from the drop down
	And I clicked the "Add to List" button
	And I clicked the "Manage List" button

Scenario: check background color

	Then I should see background color "rgba(245, 245, 245, 1)"
	
Scenario: check title text size
	
	Then I should see a title

Scenario: RTPF7a.2 and LMPF1

	Then I should see "Item"
	
Scenario: LMPF2

	When I click on "Item"
	Then I am on the "DetailedRestaurantView.jsp" page for "Item"
	
Scenario: LMPF3.1

	When I remove "Item"
	And I refresh the page
	Then I do not see "Item"
	
Scenario: LMPF3.2, LMPF6, LMPF7

	When I move "Item" to "To Explore"
	And I select "To Explore" from the drop down
	And I click the "Manage List" button
	Then I am on the "Manage List" page for "To Explore"
	And I should see "Item"
	
Scenario: LMPF4

	When I click the "Back to results" button
	Then I should be on the "ResultsPageView.jsp" page

Scenario: LMPF5

	When I click the "Back to search" button
	Then I should be on the "SearchPageView.jsp" page

Scenario: LMPF7a

	When I select "Favorites" from the drop down
	And I click the "Add to List" button
	Then I am on the "Manage List page" for "Favorites"
