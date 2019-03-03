<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="models.ResponseModel"%>   
<%@page import="java.util.Map"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Results Page</title>
</head>
<body>

	<%
	ResponseModel rm = ((ResponseModel)request.getAttribute("response"));
	String title = rm.getSearchTerm();
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
	<h2 onclick=<%="redirectToRecipe(\"" + "/ImHungry/RedirectionController?action=managelist&index=" + index + "&list=donotshow" + "\")"%>>Manage do not show</h2>
	<h2 onclick=<%="redirectToRecipe(\"" + "/ImHungry/RedirectionController?action=managelist&index=" + index + "&list=favorites" + "\")"%>>Manage favorites</h2>
	<h2 onclick=<%="redirectToRecipe(\"" + "/ImHungry/RedirectionController?action=managelist&index=" + index + "&list=toexplore" + "\")"%>>Manage to explore</h2>
	
	
	<h1>Results for: <%=title%></h1>

	<%
	for(int i = 0 ; i < rm.getNumberOfRecipes() ; i++){
		Map<String, String> resultsFields = rm.getFormattedRecipeResultsAt(i);
		
		// Skip do not show results
		if(resultsFields.get("modifier").equals("donotshow")){
			continue;
		}
		
		String color = "#D3D3D3";
		if(i % 2 == 0){
			color = "#A9A9A9";
		}
	%>
	
		<div id=<%=Integer.toString(i)%> style=<%="background:" + color + ";"%>
			onclick=<%="redirectToRecipe(\"" + "/ImHungry/RedirectionController?action=recipe&index=" + index + "&item=" + i + "\")"%>>
			
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
	
	<h2>Restaurants</h2>
	
	<%
	for(int i = 0 ; i < rm.getNumberOfRestaurants() ; i++){
		Map<String, String> resultsFields = rm.getFormattedRestaurantResultsAt(i);
		
		// Skip do not show results
		if(resultsFields.get("modifier").equals("donotshow")){
			continue;
		}
		
		String color = "#D3D3D3";
		if(i % 2 == 0){
			color = "#A9A9A9";
		}
	%>
	
		<div id=<%=Integer.toString(i)%> style=<%="background:" + color + ";"%>
			onclick=<%="redirectToRestaurant(\"" + "/ImHungry/RedirectionController?action=restaurant&index=" + index + "&item=" + i + "\")"%>>
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