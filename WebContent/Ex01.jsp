<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String s1 = "Hello";
	String s2 = "World";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>Hello World !</h1>
	<h1><%=s1%> <%=s2%> !</h1>
	<%
		out.println("<h1>" + s1 + " " + s2 + " !</h1>");
	%>
</body>
</html>