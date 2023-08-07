<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int sum = 0;
	for(int i=1; i<=100; i++){
		sum += i;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1부터 100까지의 합</title>
</head>
<body>
	<h1>1부터 100까지의 합 = <%=sum %></h1>
</body>
</html>