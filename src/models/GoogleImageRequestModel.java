package models;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.json.JSONArray;
import org.json.JSONObject;

public class GoogleImageRequestModel {
	private CollageGenerationModel results;
	private String term;
	private int limit;
	
	public GoogleImageRequestModel(CollageGenerationModel collageModel) {
		this.results = collageModel;
	}
	
	public ResponseCodeModel completeTasks(String imagesearch) {	
		try {
			System.out.println("inside completetasks()");
			//The URL to Google Image API - API key and Custom Control key included, Add the imageSearch at the end.
			URL url = new URL("https://www.googleapis.com/customsearch/v1?key=AIzaSyBn3V9GHx2KjGQTmeUPHFN2Nm0BGko-zJ4" + 
					"&cx=018271258977134758236:ifnf_dla9yk&q=" + imagesearch + "&searchType=image");
			HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
		    con.setRequestProperty("User-Agent", "Chrome");
			con.addRequestProperty("Referer", "localhost:8080");

			//Parse JSON file and Serialize the Objects
			String line;
			BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String response = "";
			//Get all data from API
			while((line = reader.readLine()) != null) {
				response += line;
			}

		    if (!response.isEmpty()) {
		    	//Parses the JSON object to get the image and store the url link to an ArrayList
		    	JSONObject json = new JSONObject(response);
		    	JSONArray items = json.getJSONArray("items");
		    	ArrayList <String> allimageurl = new ArrayList<String>();
				int actualsize = 0;
		    	for (int i = 0; i < 10 ; i ++) {
		    		System.out.println(items.length());
		    		JSONObject item_i = items.getJSONObject(i);
			    	JSONObject imageobj = item_i.getJSONObject("image");
			    	String string_urlimage = imageobj.getString("thumbnailLink");
			    	if (string_urlimage != null || string_urlimage != "") {
				    	allimageurl.add(string_urlimage);
//				    	System.out.println(string_urlimage); 	
				    	actualsize++;
		    		}
		    	}
		    	this.results.setListofImages(allimageurl, actualsize);
		    }
		} catch (Exception e) {
			return ResponseCodeModel.INTERNAL_ERROR;
	    }  
		return ResponseCodeModel.OK;
	}

}
