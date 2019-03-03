Feature:

	Recipe Page

Background:

	Given I am on the "Results" page
	And I select recipe, "R"
	And I am redirected to the "Recipe" page

Scenario: check background color

	Then I should see background color "white_smoke"
	
Scenario: RCF1 and check title text size
	
	Then I should see "R" as a title

Scenario: check text size
	
	Then I should see a result in default text size
	
Scenario: RCPF2
	
	Then I should see an image of the dish
	
Scenario: RCPF3
	
	Then I should see the prep and cook time of the dish
	
Scenario: RCPF4
	
	Then I should see the ingredients of the dish
	
Scenario: RCPF5
	
	Then I should see instructions for the dish
	
Scenario: RCPF6
	
	When I click the "Printable" button
	Then I be able to print the recipe
	
Scenario: RCPF7
	
	When I click the "Return to Results" button
	Then I should be on the "Results" page
	
Scenario: RCPF8
	
	Then I should see a drop down box for lists
	
Scenario: RCPF9.1
	
	When I select list "Favorites"
	And I click the "Add to List" button
	Then I should remain on the "Recipe" page
