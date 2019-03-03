Feature:

	Restaurant Page Functionality 5 and Recipe Page Functionality 9

Background:

	Given I searched for item "F" with "X" results and was redirected to the Results page
	And I clicked the link for "Recipe1"
	And I selected "Favorites" from the drop down
	And I clicked the "Add to List" button
	And I clicked the "Return to Results" button
	And I clicked the link for "Restaurant1"
	And I selected "Favorites" from the drop down
	And I clicked the "Add to List" button
	And I clicked the "Return to Results" button
	And I select "Favorites" from the drop down
	And I click the "Manage List" button
	
Scenario: RCPF9.2

	Then I should see "Recipe1" on the page

Scenario: RCPF5.2

	Then I should see "Restaurant1"
