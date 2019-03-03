<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="models.ResponseModel"%>   
<%@page import="java.util.Map"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AAAAAaAAaAAaAAaaaaaAaaaAa</title>
</head>
<body>

<%
	ResponseModel rm = ((ResponseModel)request.getAttribute("response"));
	String title = (String)request.getAttribute("title");
	int index = (int)request.getAttribute("index");
	%>
	
	<script>
		function redirectToRecipe(link){
			window.location = link;
		}
		
		function redirectToRestaurant(link){
			window.location = link;
		}
	
	</script>
	
	<h2 onclick=<%="redirectToRecipe(\"" + "/ImHungry/ResultsPageController?action=search&index=" + index + "\")"%>>Back to search</h2>
	<h2 onclick=<%="redirectToRecipe(\"" + "/ImHungry/RedirectionController?action=results&index=" + index + "\")"%>>Back to results</h2>
	<h2 onclick=<%="redirectToRecipe(\"" + "/ImHungry/RedirectionController?action=managelist&index=" + index + "&list=donotshow" + "\")"%>>Manage do not show</h2>
	<h2 onclick=<%="redirectToRecipe(\"" + "/ImHungry/RedirectionController?action=managelist&index=" + index + "&list=favorites" + "\")"%>>Manage favorites</h2>
	<h2 onclick=<%="redirectToRecipe(\"" + "/ImHungry/RedirectionController?action=managelist&index=" + index + "&list=toexplore" + "\")"%>>Manage to explore</h2>
	
	
	<h1>Manage <%=title%></h1>

	<%
	int count = 0;
	for(int i = 0 ; i < rm.getNumberOfRecipes() ; i++){
		count += 1;
		Map<String, String> resultsFields = rm.getFormattedRecipeResultsAt(i);
		
		// Skip do not show results
		if(title.equals("Do Not Show") && !resultsFields.get("modifier").equals("donotshow")){
			continue;
		}
		if(title.equals("Favorites") && !resultsFields.get("modifier").equals("favorites")){
			continue;
		}
		if(title.equals("To Explore") && !resultsFields.get("modifier").equals("toexplore")){
			continue;
		}
		
		String color = "#D3D3D3";
		if(count % 2 == 0){
			color = "#A9A9A9";
		}
	%>
	
		<div id=<%=Integer.toString(i)%> style=<%="background:" + color + ";"%>>
			
			<p>Name of Recipe: <%=resultsFields.get("name")%>
			</p>
			
			<p>Prep Time of Recipe: <%=resultsFields.get("prepTime")%>
			</p>
			
			<p>Cook Time of Recipe: <%=resultsFields.get("cookTime")%>
			</p>
			
			<p>Stars of Recipe: <%=resultsFields.get("stars")%>
			</p>
		</div>
	<%
	}
	%>
	
	<%
	for(int i = 0 ; i < rm.getNumberOfRestaurants() ; i++){
		count += 1; 
		Map<String, String> resultsFields = rm.getFormattedRestaurantResultsAt(i);
		
		// Skip do not show results
		if(title.equals("Do Not Show") && !resultsFields.get("modifier").equals("donotshow")){
			continue;
		}
		if(title.equals("Favorites") && !resultsFields.get("modifier").equals("favorites")){
			continue;
		}
		if(title.equals("To Explore") && !resultsFields.get("modifier").equals("toexplore")){
			continue;
		}
		
		String color = "#D3D3D3";
		if(count % 2 == 0){
			color = "#A9A9A9";
		}
	%>
	
		<div id=<%=Integer.toString(i)%> style=<%="background:" + color + ";"%>>
			<p>Name of Restaurant: <%=resultsFields.get("name")%>
			</p>
			
			<p>address of restaurant: <%=resultsFields.get("address")%>
			</p>
			
			<p>driving time of restaurant: <%=resultsFields.get("drivingTime")%>
			</p>
			
			<p>price range: <%=resultsFields.get("priceRange")%>
			</p>
			
			<p>Stars of restaurant: <%=resultsFields.get("stars")%>
			</p>
		</div>
	<%
	}
	%>



</body>
</html>