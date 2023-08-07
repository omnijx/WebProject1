<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String dbid = "testw11";
String dbpw = "pass1234";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 연습</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="Ex10RegisterAction.jsp" method="post">
		아이디 : <input type="text" name="id"/> <br/>
		패스워드 : <input type="password" name="pw"/> <br/>
		이름 : <input type="text" name="name"/> <br/>
		<input type="submit" value="작성완료"/>
		
	</form>
</body>
</html>