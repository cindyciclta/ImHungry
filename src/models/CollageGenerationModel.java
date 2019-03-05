package models;

import java.util.Base64;

public class CollageGenerationModel {
	private String term;
	private int NUMBER_OF_PICTURES = 10;
	public CollageGenerationModel() {
		// TODO Auto-generated constructor stub
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
		return true;
	}


}
