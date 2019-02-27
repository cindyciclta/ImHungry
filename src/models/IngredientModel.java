package models;

public class IngredientModel {
	private String name;
	private String amount;
	
	public IngredientModel(){
		
	}
	
	/**
	 * Format ingredients, ensure all amounts are valid. False if invalid
	 * @param name
	 * @param valueAmount
	 * @param units
	 * @return
	 */
	public boolean validateIngredients(String name, double valueAmount, String units) {
		if(valueAmount < 0) {
			return false;
		}
		if(name == null || name.isEmpty() || units == null || units.isEmpty()) {
			return false;
		}
		this.name = name;
		this.amount = valueAmount + " " + units;
		return true;
	}
	
	// Format ingredient into string for display on the screen
	public String formatIngredients() {
		return this.amount + " of " + this.name;
	}
	
	

}
