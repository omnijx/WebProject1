<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int a = (int)(Math.random()*10)+1;
	int b = (int)(Math.random()*10)+1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Ex08p2.jsp">
		<h1>
			<input type="number" name="a" value="<%=a%>"/>+
			<input type="number" name="b" value="<%=b%>"/>=
			<input type="text" name="c"/>
			<input type="submit" value="정답확인"/>
		</h1>
	</form>
</body>
</html>