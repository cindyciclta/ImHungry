Feature:

	Results Page

Background:

	Given I searched for item "F" with "X" results and was redirected to the Results page

Scenario: check background color

	Then I should see background color "white_smoke"
	
Scenario: check title text size
	
	Then I should see a title

Scenario: check text size
	
	Then I should see a result in default text size

Scenario: RTPF1

	Then I should see a collage image

Scenario: RTPF2

	Then I should see the title "Results for F1"

Scenario: RTPF3.1

	Then I should see a drop down box with nothing selected

Scenario: RTPF4.1

	Then I should see a "Manage List" button

Scenario: RTPF3.2

	When I click the drop down box
	Then I should be able to select one of the predefined lists

Scenario: RTPF4.2

	When I click the "Manage List" button with "Favorite" selected
	Then I should be on the "Manage List" page
	And I should be viewing the "Favorite" list

Scenario: RTPF4a

	When I click the "Manage List" button with nothing selected
	Then I should remain on the "Results" page

Scenario: RTPF5

	Then I should see a column with title "Restaurants"

Scenario: RTPF5a

	Then I should see "X" restaurants

Scenario: RTPF5b

	Then I should see the name, address, stars, driving minutes, and price range for the restaurants

Scenario: RTPF5c

	When I click on a restaurant result
	Then I should be on the "Restaurant Details" page
	
Scenario: RTPF6

	Then I should see a column with title "Recipes"

Scenario: RTPF6a

	Then I should see "X" recipes

Scenario: RPF6b

	Then I should see the name, stars, and prep time for the recipes

Scenario: RTPF7a.1

	When I add a result to a list
	Then I should be on the Results page
	
Scenario: RTPF6c

	When I click on a recipe result
	Then I should be on the "Recipe Details" page
	
Scenario: RTPF8

	When I click the "Return to Search Page" button
	Then I should be on the "Search" page
