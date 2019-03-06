Feature:

	Results Page

Background:

	Given I searched for item "Indian" with "10" results and was redirected to the Results page

Scenario: check background color

	Then I should see background color "#f5f5f5"
	
Scenario: check title text size
	
	Then I should see a title

Scenario: check text size
	
	Then I should see a result in default text size

Scenario: RTPF1

	Then I should see an image

Scenario: RTPF2

	Then I should see the title "Results for Indian"

Scenario: RTPF3.1

	Then I should see a drop down box with nothing selected

Scenario: RTPF4.1

	Then I should see a "Manage Lists" button

Scenario: RTPF3.2

	When I click the drop down box
	Then I should be able to select one of the predefined lists

Scenario: RTPF4.2

	When I click the "Manage Lists" button with "Favorites" selected
	Then I should be on the "/ImHungry/RedirectionController?action=managelist&index=16&list=favorites" page
	And I should be viewing the "Favorites" list

Scenario: RTPF4a

	When I click the "Manage Lists" button with nothing selected
	Then I should remain on the "/ImHungry/RedirectionController?action=results&index=15" page

Scenario: RTPF5

	Then I should see a column with title "Restaurants"

Scenario: RTPF5a

	Then I should see "10" restaurants

Scenario: RTPF5b

	Then I should see the name, address, stars, driving minutes, and price range for the restaurants

Scenario: RTPF5c

	When I click on restaurant result, "Manas Indian Cuisine"
	Then I should be on the "/ImHungry/RedirectionController?action=restaurant&index=16&item=1" page
	
Scenario: RTPF6

	Then I should see a column with title "Recipes"

Scenario: RTPF6a

	Then I should see "10" recipes

Scenario: RPF6b

	Then I should see the name, stars, and prep time for the recipes

Scenario: RTPF7a.1

	When I add a result to a list
	Then I should be on the "/ImHungry/RedirectionController?action=results&index=15" page
	
Scenario: RTPF6c

	When I click on recipe result, "R2"
	Then I should be on the "Recipe Details" page
	
Scenario: RTPF8

	When I click the "Return to Search Page" button
	Then I should be on the "Search" page
