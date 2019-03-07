Feature:

	Results Page Functionality 7

Background:

	Given I searched for item "Pizza" with "7" results and was redirected to the Results page
	And I clicked the link for "Pizza Studio"
	And I selected "Favorites" from the drop down
	And I clicked the "Add to List" button
	And I clicks the "Back to Results" button
	And I clicked the link for "Hummus Pizza"
	And I selected "Do Not Show" from the drop down
	And I clicked the "Add to List" button
	And I clicks the "Back to Results" button
	And I clicks the "Return to Search" button
	And I searched for item "Pizza" with "7" results and was redirected to the Results page
	
Scenario: RTPF7b, RTPF7c

	Then I should see "Pizza Studio" as the first result for "Restaurants"
	And I do not see "Hummus Pizza"

