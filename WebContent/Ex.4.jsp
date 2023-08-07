<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	int num = Integer.parseInt(request.getParameter("num"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>파라미터 num에 10을 곱한 값 출력</title>
</head>
<body>
	<h1>num * 10 : <%=num*10 %></h1>
</body>
</html>