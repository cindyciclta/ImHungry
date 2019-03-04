package models;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.json.JSONArray;
import org.json.JSONObject;

public class GoogleImageRequestModel {

	public GoogleImageRequestModel() {
		// TODO Auto-generated constructor stub
	}
	
	private CollageGenerationModel results = null;
	private String term;
	private int limit;
	public ResponseCodeModel completeTasks(String imagesearch) {	
		try {
			//The URL to Google Image API - API key and Custom Control key included, Add the imageSearch at the end
			URL url = new URL("https://www.googleapis.com/customsearch/v1?key=AIzaSyBn3V9GHx2KjGQTmeUPHFN2Nm0BGko-zJ4" + 
					"&cx=018271258977134758236:ifnf_dla9yk&q=" + imagesearch);
			URLConnection con = (HttpsURLConnection) url.openConnection();
			
			con.addRequestProperty("Referer", "localhost:8080");

			//Parse JSON file and Serialize the Objects
			String line;
			BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String response = "";
			while((line = reader.readLine()) != null) {
//				System.out.println(line);
				response += line;
			}
		    if (!response.isEmpty()) {
		    	JSONObject json = new JSONObject(response);
		    	JSONArray items = json.getJSONArray("items");
		    	for (int i = 0; i < Math.min(10, items.length()) ; i ++) {
		    		System.out.println(items.length());
		    		JSONObject item_i = items.getJSONObject(i);
			    	JSONObject pagemap = item_i.getJSONObject("pagemap");
			    	JSONArray cse_image = pagemap.getJSONArray("cse_image");

			    	JSONObject urlimage = cse_image.getJSONObject(0);
			    	String string_urlimage = urlimage.getString("src");
			    	System.out.println(string_urlimage); 	
		    	}
		    }
		} catch (Exception e) {
			return ResponseCodeModel.INTERNAL_ERROR;
	    }  
		return ResponseCodeModel.OK;
	}
	public static void main(String[] args) {
		GoogleImageRequestModel api = new GoogleImageRequestModel();
		api.completeTasks("pizza");
	}

}
