Feature:

	Results Page Functionality 2 with search for Pizza and addition of Ultimate Twice Baked Potatoes to Do Not Show and Humble Potato to Favorites

Background:

	Given I searched for item "Potato" with "2" results and was redirected to the Results page
	And I clicked the link for "Ultimate Twice Baked Potatoes"
	And I selected "Do Not Show" from the drop down
	And I clicked the "Add to List" button
	And I clicks the "Back to Results" button
	And I clicked the link for "Humble Potato"
	And I selected "Favorites" from the drop down
	And I clicked the "Add to List" button
	And I clicks the "Back to Results" button
	
Scenario: Add items to lists and have results change appropriately (RTPF7b, RTPF7c, RTPF7a)

	Then I should see "Humble Potato" as the first result for "Recipes"
	And I do not see "Ultimate Twice Baked Potatoes"
