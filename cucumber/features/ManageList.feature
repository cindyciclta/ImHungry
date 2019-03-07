Feature:

	Manage List Page

Background:

	Given I searched for "Chinese"
	And I clicked the link for "Northern Cafe"
	And I selected "Favorites" from the drop down
	And I clicked the "Add to List" button
	And I clicks the "Back to Results" button
	And I selected "Favorites" from the drop down
	And I clicked the "Manage Lists" button

Scenario: check background color, check title text size

	Then I should see background color "rgba(245, 245, 245, 1)"
	And I should see a title
	
Scenario: RTPF7a.2 and LMPF1, LMPF2
	Then I should see "Northern Cafe" on the page
	When I click on "Northern Cafe"
	Then I am on the "Northern Cafe" page for "Item"
	
Scenario: LMPF3.1

	When I remove "Northern Cafe"
	And I refresh the page
	Then I do not see "Northern Cafe"
	
Scenario: LMPF3.2, LMPF6, LMPF7

	When I move "Northern Cafe" to "To Explore"
	And I selected "To Explore" from the drop down
	And I clicked the "Manage Lists" button
	And I am on the "To Explore" page
	And I should see "Northern Cafe" on the page
	
Scenario: LMPF4

	When I clicks the "Back to Results" button
	Then I am on the "Results for Chinese" page

Scenario: LMPF5

	When I clicks the "Back to Search" button
	Then I am on the "I'm Hungry" page

Scenario: LMPF7a

	And I click the "Manage Lists" button with nothing selected
	Then I am on the "Favorites" page
