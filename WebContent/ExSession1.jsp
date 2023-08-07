<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("loginId", "YG");    
	String loginId = (String)session.getAttribute("loginId");
// 	session.removeAttribute("loginId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인된 아이디 : <%=loginId %></h1>
</body>
</html>