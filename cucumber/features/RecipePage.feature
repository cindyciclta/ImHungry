Feature:

	Recipe Page

Background:
	Given I searched for "Indian"
	And I clicked the link for "Indian Relish"
	#Given I begin at Indian Relish 

Scenario: check for background color, text size, title text size, RCPF1, RCPF2

	Then I should see background color "rgba(245, 245, 245, 1)"
	And I should see "Indian Relish" as a title
	And I should see a result in default text size
	And I should see an image
	
Scenario: RCPF3, RCPF4, RCPF5
	
	Then I should see the prep and cook time of the dish
	And I should see the ingredients of the dish
	And I should see instructions for the dish
	
Scenario: RCPF6
	
	Then I should be able to print
	
Scenario: RCPF7
	
	When I clicks the "Back to Results" button
	Then I am on the "Results for Indian" page
	
Scenario: RCPF8
	
	Then I should see a drop down box for lists
	
Scenario: RCPF9.1
	
	When I select "Favorites" from the drop down
	And I click the "Add to List" button
	Then I am on the "Indian Relish" page
