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
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,dbid,dbpw);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BoardList</title>
	<script src="js/jquery-3.7.0.min.js"></script>
	<script>
		$(function(){
			$("table tr").click(function(){
// 				alert("!");
				let bno = $(this).find(".bno").text();
				alert("bno: " + bno);
				location.href = "Ex12BoardDetail.jsp?bno=" + bno;
			});
		});
	</script>
	<style>
		table {
			border-collapse: collapse;
		}
		th, td {
			border: 1px solid grey;
			padding: 8px;
		}
	</style>
</head>
<body>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일시</th>
		</tr>
		<%
			String sql = "SELECT * FROM board ORDER BY bno DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){ 
		%>
		<tr>
			<td class="bno"><%=rs.getInt("bno") %></td>
			<td><%=rs.getString("title") %></td>
			<td><%=rs.getString("writer") %></td>
			<td><%=rs.getString("writedate") %></td>	
		</tr>
		<% } %>
	</table>
</body>
</html>
<%
	rs.close();
	pstmt.close();
	conn.close();
%>