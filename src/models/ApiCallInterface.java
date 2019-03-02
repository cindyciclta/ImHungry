package models;

import java.util.List;
import java.util.Map;

public interface ApiCallInterface<T> {
	
	// Deviation no results
	public ResponseCodeModel completeTask();
	
	public int getResultsSize();
	
	public Map<String, String> getFormattedResultsFieldsAt(int i);
	
	public Map<String, String> getFormattedDetailsFieldsAt(int i);
}