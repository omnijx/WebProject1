<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "hr";
	String pw = "hr";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		table {
			border-collapse: collapse;
		}
		table th, table td {
			border: 1px solid #666;
		}
	</style>
</head>
<body>
	<%
		Connection conn = null;
		// 1. Connection 객체.
		try {
			Class.forName(driver);
			out.println("<h1>JDBC 드라이버 로딩 성공</h1>");
			conn = DriverManager.getConnection(url, id, pw);
			out.println("<h1>Oracle 접속 성공</h1>");
		} catch(Exception e) {
			e.printStackTrace();
			out.println("<h1>오라클 접속 실패</h1>");
		}
		// 2. PreparedStatement 객체
		String sql = "SELECT * FROM employees";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 3. ResultSet 객체
		ResultSet rs = pstmt.executeQuery();
	%>
		<table>
			<tr>
				<th>이름</th>
				<th>성</th>
				<th>급여</th>
			</tr>
	<%	
		while(rs.next()){
	%>
			<tr>
				<td>
				<%=rs.getString("first_name") %> 
				</td>
				<td>
				<%=rs.getString("last_name") %> 
				</td>
				<td>
				<%=rs.getInt("salary") %> 
				</td>
			</tr>
	<%		
		}
		rs.close();
		pstmt.close();
		conn.close();
	%>
		</table>
			<br/>
</body>
</html>







