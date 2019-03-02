Feature:

	Recipe Page

Background:

	Given I am on the results page
	And I select recipe, "R"
	And I am redirected to the recipe page

Scenario: check background color

	When I remain on the search page
	Then I should see background color white smoke
	
Scenario: RCF1 and check title text size
	
	When I remain on the search page
	Then I should see "R" as a title

Scenario: check text size
	
	When I remain on the search page
	Then I should see a results in default text size
	
Scenario: RCPF2
	
	When I remain on the recipe page
	Then I should see an image of the dish
	
Scenario: RCPF3
	
	When I remain on the recipe page
	Then I should see the prep and cook time of the dish
	
Scenario: RCPF4
	
	When I remain on the recipe page
	Then I should see the ingredients of the dish
	
Scenario: RCPF5
	
	When I remain on the recipe page
	Then I should see instructions for the dish
	
Scenario: RCPF6
	
	When I click the printable button
	Then I be able to print the recipe
	
Scenario: RCPF7
	
	When I click the "Return to Results" button
	Then I should be on the results page
	
Scenario: RCPF8
	
	When I remain on the recipe page
	Then I should see a drop down box for lists
	
Scenario: RCPF9.1
	
	When I select a predefined list
	And I click the "Add to List" button
	Then I should remain on the Recipe page
