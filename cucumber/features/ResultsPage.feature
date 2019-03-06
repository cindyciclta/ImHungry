Feature:

	Results Page

Background:

	Given I searched for item "Indian" with "10" results and was redirected to the Results page

Scenario: check background color, title size

	Then I should see background color "rgba(245, 245, 245, 1)"
	And I should see a title

Scenario: check text size
	
	Then I should see a result in default text size

Scenario: RTPF1, RTPF2

	Then I should see an image
	And I should see the title "Results for Indian"

Scenario: RTPF3.1

	Then I should see a drop down box with nothing selected

Scenario: RTPF3.2

	When I click the drop down box
	Then I should be able to select one of the predefined lists

Scenario: RTPF4.2

	When I click the "Manage Lists" button with "favorites" selected
	Then I am the "Favorites" page
	And I should be viewing the "Favorites" list

Scenario: RTPF4a

	When I click the "Manage Lists" button with nothing selected
	Then I am on the "Results for Indian" page

Scenario: RTPF5 a, b

	Then I should see a column with title "Restaurants"
	And I should see "10" restaurants
	And I should see the name, address, stars, driving minutes, and price range for the restaurants

Scenario: RTPF5c

	When I clicked the link for "House of Curry"
	Then I am on the "/ImHungry/RedirectionController?action=restaurant&index=16&item=1" page
	
Scenario: RTPF6a,b

	Then I should see a column with title "Recipes"
	And I should see "10" recipes
	And I should see the name, stars, and prep time for the recipes

Scenario: RTPF7a.1

	When I clicked the link for "Indian Chai Hot Chocolate"
	And I add it to the "favorites" list
	Then I am on the "Indian Chai Hot Chocolate" page
	
Scenario: RTPF6c

	When I clicked the link for "Indian Chai Hot Chocolate"
	Then I am on the "Indian Chai Hot Chocolate" page
	
Scenario: RTPF8

	When I click the "Return to Search" button
	Then I should be on the "/ImHungry/RedirectionController?action=search&index=16" page
