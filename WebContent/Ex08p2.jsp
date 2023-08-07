<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int a = Integer.parseInt(request.getParameter("a"));
	int b = Integer.parseInt(request.getParameter("b"));
	int c = Integer.parseInt(request.getParameter("c"));
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
		if((a+b)==c){
			out.println("정답!!!");
		} else {
			out.println("땡!!!");
		}
	%>
	</h1>
</body>
</html>