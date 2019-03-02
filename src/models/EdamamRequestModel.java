package models;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.json.JSONArray;
import org.json.JSONObject;

public class EdamamRequestModel implements ApiCallInterface<RecipeModel> {
	
	public final String APP_ID = "d7cba8e7";
	public final String APP_KEY = "050d5e65923fd41dc3acb8003c1a1134";
	public final String URL = "https://api.edamam.com/search?q=";
	
	private List<RecipeModel> results;
	
	private String term;
	
	private int limit;
	
	public EdamamRequestModel() {
		results = new ArrayList<>();
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
	
	
	public List<RecipeModel> getResults(){
		return results;
	}
	
	public List<String> parseInstructionsFromLink(String link){
		
		List<String> instructions = new ArrayList<>();
		
		StringBuilder contentBuilder = new StringBuilder();
		try {
			URL url = new URL(link);
		    BufferedReader in = new BufferedReader(
		            new InputStreamReader(url.openStream()));
		    String str;
		    while ((str = in.readLine()) != null) {
		        contentBuilder.append(str);
		    }
		    in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String content = contentBuilder.toString();
		
		// Parse instructions as good as possible
		int index = content.indexOf("<script type=\"application/ld+json\">");
		boolean completed= false;
		if(index != -1) {
			content = content.substring(index);
			index = content.indexOf("</script>");
			if(index != -1) {
				content = content.substring(0, index);
				index = content.indexOf("recipeInstructions");
				if(index != -1) {
					content = content.substring(index);
					content = content.replace("{", "");
					content = content.replace("}", "");
					content = content.replace("\"@type\":\"HowToStep\",\"text\":", "");
					String[] steps = content.split(",");
					for(String step : steps) {
						instructions.add(step);
					}
					completed = true;
				}
				
			}
		}
		
		if(!completed) {
			instructions.add("mix ingredients in bowl");
			instructions.add("heat in saucepan");
			instructions.add("serve lightly warn");
		}
		return instructions;
	}

	@Override
	public ResponseCodeModel completeTask() {
		ResponseCodeModel responseResult = ResponseCodeModel.OK;
		try {
			URL wikiRequest = new URL(URL + term +  "&app_id=" + APP_ID + "&app_key=" + APP_KEY);
			Scanner scanner = new Scanner(wikiRequest.openStream());
			String response = scanner.useDelimiter("\\Z").next();
			JSONObject json = new JSONObject(response);
			
			// Parse into recipemodel objects
			int count = json.getInt("count");
			for(int i = 0 ; i < Math.min(count, limit) ; i++) {
				RecipeModel added = new RecipeModel();
				JSONObject recipe = json.getJSONArray("hits").getJSONObject(i).getJSONObject("recipe");
				
				String imageURL = recipe.getString("image");
				String name = recipe.getString("label");
				String url = recipe.getString("url");
				added.setStars(((int)Math.random() * 5) + 1);
				
				added.setImageUrl(imageURL);
				added.setName(name);
				
				JSONArray ingredients = recipe.getJSONArray("ingredientLines");
				for(int j = 0 ; j < ingredients.length() ; j++) {
					IngredientModel ingredient = new IngredientModel();
					String raw = ingredients.getString(j);
					ingredient.validateIngredients(raw, 0, "");
					added.addIngredient(ingredient);
				}
				
				// Get prep and cook time
				int totalTime = recipe.getInt("totalTime");
				double fractionalPercent = Math.random();
				added.setCookTime((int)(totalTime * fractionalPercent));
				added.setPrepTime((int)(totalTime * (1 - fractionalPercent)));
				
				// Get ingredients
				List<String> instructions = parseInstructionsFromLink(url);
				for(String instruction : instructions) {
					added.addInstruction(instruction);
				}
				
				results.add(added);
			}
		}catch(IOException e) {
			responseResult = ResponseCodeModel.INTERNAL_ERROR;
		}
		
		return responseResult;	
	}

	@Override
	public int getResultsSize() {
		return results.size();
	}

	@Override
	public Map<String, String> getFormattedResultsFieldsAt(int i) {
		if(i < 0) {
			return null;
		}
		if(i >= results.size()) {
			return null;
		}
		
		return results.get(i).getFormattedFieldsForResults();
	}

	@Override
	public Map<String, String> getFormattedDetailsFieldsAt(int i) {
		if(i < 0) {
			return null;
		}
		if(i >= results.size()) {
			return null;
		}
		
		return results.get(i).getFormattedFieldsForDetailsPage();
	}
	

}
