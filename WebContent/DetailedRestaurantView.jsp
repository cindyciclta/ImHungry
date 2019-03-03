<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Map"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>310 :(</title>
</head>
<body>

<script>
		function backToResults(link){
			window.location = link;		
		}
		
		function navigateTo(link){
			window.location = link;
		}
		
		function addToList(link){
			var xhr = new XmlHttpRequest();
			xhr.open(link, true);
			xhr.send();
		}
		
	</script>

	<%
	Map<String, String> fields = ((Map<String, String>)request.getAttribute("response"));
	int index = (int)request.getAttribute("index");
	int item = (int)request.getAttribute("item");
	String link = fields.get("imageUrl");
	%>

	<h2 onclick=<%="backToResults(" + "\"" + "/ImHungry/RedirectionController?action=results&index=" + index + "\""  + ")"%>>Back to results</h2>
	<h2 onclick=<%="addToList(\"" + "/ImHungry/RedirectionController?action=addtolist&index=" + index + "&item=" + item + "&type=restaurant" + "&list=toexplore" + "\")"%>>Add to explore</h2>
	<h2 onclick=<%="addToList(\"" + "/ImHungry/RedirectionController?action=addtolist&index=" + index + "&item=" + item + "&type=restaurant" + "&list=donotshow" + "\")"%>>Add to do not show</h2>
	<h2 onclick=<%="addToList(\"" + "/ImHungry/RedirectionController?action=addtolist&index=" + index + "&item=" + item + "&type=restaurant" + "&list=favorites" + "\")"%>>Add to favorites</h2>
	
	
	
	<h1>Name: <%=fields.get("name")%></h1>
	<p onclick=<%="navigateTo(" + "\"" + fields.get("mapsLink") + "\"" + ")"%>>Address: <%=fields.get("address")%></p>
	<p onclick=<%="navigateTo(" + "\"" + fields.get("websiteLink") + "\"" + ")"%>>Website link</p>
	<p>Phone number <%=fields.get("phoneNumber") %></p>

</body>
</html>