<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Scanner" %>
<%
	Scanner sc = new Scanner(System.in);
	System.out.print("이름 : ");
	String name = sc.nextLine();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%

		out.println(name + "님 안녕하세요!");
	%>
</body>
</html>