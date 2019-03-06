package models;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;
import java.util.List;

import org.json.JSONArray;

public class CollageGenerationModel {
	private String term;
	private int NUMBER_OF_PICTURES = 10;
	private String[] imagelist;
	private int actualsize = 0;
	private ArrayList<String> list;
	public CollageGenerationModel() {
	}
	public int getActualSize() {
		return actualsize;
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

	public void setListofImages (ArrayList<String> iList, int size) {
		System.out.println("size is " + iList.size());
		this.list = iList;
		this.actualsize = size;
	}
	public ArrayList<String> getList() {
		return this.list;
	}
	
	Base64 getResult() {
		return null;	
	}


}
