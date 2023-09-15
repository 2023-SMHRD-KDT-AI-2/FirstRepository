<%@page import="java.lang.ProcessBuilder.Redirect"%> 
<html>
<body>
<h2>Hello World!</h2>
<%
String uri = "WEB-INF/LodingPage.jsp";
RequestDispatcher rd = request.getRequestDispatcher(uri);
rd.forward(request, response);
	%>
</body>
</html>
