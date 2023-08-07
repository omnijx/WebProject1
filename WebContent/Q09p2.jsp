<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>

<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "hr";
	String pw = "hr";
%>
<%
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn = null;
		// 1. Connection 객체.
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
		} catch(Exception e) {
			e.printStackTrace();
		}
		// 2. PreparedStatement 객체
		String sql = "SELECT * FROM employees WHERE first_name=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,name);
		
		// 3. ResultSet 객체
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			String fName = rs.getString("first_name");
			String lName = rs.getString("last_name");
			int salary = rs.getInt("salary");
			out.println(fName +" / " + lName + " / " + salary + "<br/>");
		}
		rs.close();
		pstmt.close();
		conn.close();
	%>
</body>
</html>