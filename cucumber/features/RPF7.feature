Feature:

	Results Page Functionality 7

Background:

	Given I searched for item "F" with "X" results and was redirected to the Results page
	And I clicked the link for "Item3"
	And I selected "Favorites" from the drop down
	And I clicked the "Add to List" button
	And I clicked the "Return to Results" button
	And I clicked the link for "Item4"
	And I selected "Do Not Show" from the drop down
	And I clicked the "Add to List" button
	And I clicked the "Return to Search" button
	And I searched for item "F" with "X" results and was redirected to the Results page
	
Scenario: RTPF7b

	Then I should see "Item3" as the first result

Scenario: RTPF7c

	Then I do not see "Item4"

