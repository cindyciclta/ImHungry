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
	
	<h1>Results for: <%=title%></h1>

	<%
	for(int i = 0 ; i < rm.getNumberOfRecipes() ; i++){
		Map<String, String> resultsFields = rm.getFormattedRecipeResultsAt(i);
		String color = "#D3D3D3";
		if(i % 2 == 0){
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


</body>
</html>