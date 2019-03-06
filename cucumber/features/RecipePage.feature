Feature:

	Recipe Page

Background:

	Given I searched for "Chinese"
	And I select recipe, "Fluffy Pancakes"

Scenario: check for white smoke background color

	Then I should see background color "#f5f5f5"
	
Scenario: RCF1 and check title text size
	
	Then I should see "Fluffy Pancakes" as a title

Scenario: check text size
	
	Then I should see a result in default text size
	
Scenario: RCPF2
	
	Then I should see an image
	
Scenario: RCPF3
	
	Then I should see the prep and cook time of the dish
	
Scenario: RCPF4
	
	Then I should see the ingredients of the dish
	
Scenario: RCPF5
	
	Then I should see instructions for the dish
	
Scenario: RCPF6
	
	When I click the "Printable" button
	Then I should be able to print the recipe
	
Scenario: RCPF7
	
	When I click the "Back to Results" button
	Then I should be on the "/ImHungry/RedirectionController?action=results&index=15" page
	
Scenario: RCPF8
	
	Then I should see a drop down box for lists
	
Scenario: RCPF9.1
	
	When I select "Favorites" from the drop down
	And I click the "Add to List" button
	Then I should be on the "/ImHungry/RedirectionController?action=recipe&index=15&item=2" page
