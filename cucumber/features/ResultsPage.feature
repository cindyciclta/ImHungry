Feature:

	Results Page

Background:

	Given I searched for item "Indian" with "10" results and was redirected to the Results page

Scenario: check background color, text size, title text size, RTPF1, RTPF2, RTPF3.1

	Then I should see background color "rgba(245, 245, 245, 1)"
	And I should see a title
	And I should see a result in default text size
	And I should see an image
	And I should see the title "Results for Indian"
	And I should see a drop down box with nothing selected
	
Scenario: RTPF3.2
	
	When I click the drop down box
	Then I should be able to select one of the predefined lists

Scenario: RTPF4.2

	When I selected "Favorites" from the drop down
	And I clicked the "Manage Lists" button
	Then I am the "Favorites" page

Scenario: RTPF4a

	When I click the "Manage Lists" button with nothing selected
	Then I am on the "Results for Indian" page

Scenario: RTPF5a, b, RTPF6a,b

	Then I am on the "Results for Indian" page
	And I should see a column with title "Recipes"
	And I should see "10" recipes
	And I should see the name, stars, and prep time for the recipes
	And I should see a column with title "Restaurants"
	And I should see "10" restaurants
	And I should see the name, address, stars, driving minutes, and price range for the restaurants

Scenario: RTPF5c

	When I clicked the link for "House of Curry"
	Then I am on the "House of Curry" page
	
Scenario: RTPF6c

	When I clicked the link for "Indian Chai Hot Chocolate"
	Then I am on the "Indian Chai Hot Chocolate" page
	
Scenario: RTPF8

	When I clicks the "Return to Search" button
	Then I am on the "I'm Hungry" page
