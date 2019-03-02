package models;

import java.util.Map;

public class ResponseModel {
	private String collage;
	private int limit;
	
	private String term;
	private ApiCallInterface<RestaurantModel> restaurants;
	private ApiCallInterface<RecipeModel> recipes;
	
	public ResponseModel() {
		
	}
	
	public String getSearchTerm() {
		return term;
	}
	
	public String getCollageBase64String() {
		return collage;
	}
	
	public Map<String, String> getFormattedDetailedRecipeAt(int i) {
		return recipes.getFormattedDetailsFieldsAt(i);
	}
	
	public Map<String, String> getFormattedDetailedRestaurantAt(int i) {
		return restaurants.getFormattedDetailsFieldsAt(i);
	}
	
	public Map<String, String> getFormattedRecipeResultsAt(int i) {
		return recipes.getFormattedResultsFieldsAt(i);
	}
	
	public Map<String, String> getFormattedRestaurantResultsAt(int i) {
		return restaurants.getFormattedResultsFieldsAt(i);
	}
	
	public int getNumberOfRecipes() {
		return recipes.getResultsSize();
	}
	
	public int getNumberOfRestaurants() {
		return restaurants.getResultsSize();
	}
	
	public boolean checkParameters(String term, int limit) {
		if(limit < 0) {
			return false;
		}
		
		if(term == null) {
			return false;
		}
		term = term.trim();
		if(term.isEmpty()) {
			return false;
		}
		this.term = term;
		this.limit = limit;
		return true;
	}
	
	public boolean getSearchResults() {
		boolean response = true;
		
		EdamamRequestModel edamam = new EdamamRequestModel();
		response = edamam.checkParameters(term, limit);
		if(!response) {
			return false;
		}
		ResponseCodeModel responseCode = edamam.completeTask();
		if(!responseCode.equals(ResponseCodeModel.OK)) {
			return false;
		}
		this.recipes = edamam;
		
		// TODO: add the yelp API here
		
		
		// TODO: add the google images API here
		
		return response;
	}
	
}