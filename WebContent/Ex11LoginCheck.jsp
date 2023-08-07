<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String dbid = "testw11";
String dbpw = "pass1234";
%>
<%
	request.setCharacterEncoding("utf-8");	//한글깨짐 방지
	String id = request.getParameter("id");
	String pw = request.getParameter("pw"); 
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,dbid,dbpw);
	String sql = "SELECT * FROM member";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	boolean b = false;
	while(rs.next()){
		String idCheck = rs.getString("id");
		String pwCheck = rs.getString("pw");
		if(id.equals(idCheck) && pw.equals(pwCheck)){
			b = true;
		} else {
			b = false;
		}
	}
	rs.close();
	pstmt.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(b){ %>
		<h1>로그인 성공 ! </h1>
	<%} else { %>
		<h1>로그인 실패,,</h1>
	<% } %>	
</body>
</html>