<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int a = Integer.parseInt(request.getParameter("a"));
	int b = Integer.parseInt(request.getParameter("b"));
	int sum = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<%
			for(int i=a; a<=b; i++){
				sum += i;
		%>
				<%=i%>
				<%=(i<b)?"+":"=" %>
		<%
			}
		%>
		=<%=sum%>
	</h1>
</body>
</html>