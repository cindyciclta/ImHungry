package models;

import java.util.List;
import java.util.Map;

public interface ApiCallInterface<T> {
	
	// Deviation no results
	public ResponseCodeModel completeTask();
	
	public int getResultsSize();
	
	public Map<String, String> getFormattedResultsFieldsAt(int i);
	
	public Map<String, String> getFormattedDetailsFieldsAt(int i);
	
	public boolean setFavoriteResult(int i, boolean value);
	public boolean setToExploreResult(int i , boolean value);
	public boolean setDoNotShowResult(int i, boolean value);
	
	public void sort();
}