Feature:

	Results Page Functionality 7

Background:

	Given I searched for item "F" with "X" results and was redirected to the Results page
	And I selected the third result, "Item3"
	And I added "Item3" to the Favorite list
	And I returned to the results page
	And I selected the fourth result, "Item4"
	And I added "Item4" to the Do Not Show list
	And I returned to the "Search" page
	And I searched for item "F" with "X" results and was redirected to the Results page
	
Scenario: RTPF7b

	Then I should see "Item3" as the first result

Scenario: RTPF7c

	Then I should not see "Item4"

