<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	int bno = Integer.parseInt(request.getParameter("bno"));
// 	System.out.println("bno : " + bno);
%>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbid = "testw11";
	String dbpw = "pass1234";
%>
<%
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,dbid,dbpw);
	
	String sql = "SELECT * FROM board WHERE bno=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, bno);
	
	ResultSet rs = pstmt.executeQuery();
	String title = "";
	String content = "";
	String writer = "";
	String writedate = "";
	if(rs.next()){
		title = rs.getString("title");
		content = rs.getString("content");
		writer = rs.getString("writer");
		writedate = rs.getString("writedate");
	}
	rs.close();
	pstmt.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 상세보기</title>
	<script src="js/jquery-3.7.0.min.js"></script>
	<script>
		$(function(){
			$("#btn_list").click(function(){
				location.href = "Ex12.jsp";
			});
			
			$("#btn_delete").click(function(){
				location.href = "Ex12DeleteAction.jsp?bno=<%=bno%>";
			});
			$("#btn_update").click(function(){
				location.href = "Ex12DeleteAction.jsp?bno=<%=bno%>";
			});
		});
	</script>
	<style>
		table { border-collapse: collapse; }
		th, td { border: 1px solid grey; padding: 8px; }
	</style>
</head>
<body>
	<table>
		<tr>
			<th>글 번호</th>
			<td><%=bno %></td>
		</tr>
		<tr>
			<th>글 제목</th>
			<td><%=title %></td>
		</tr>
		<tr>
			<th>글 내용</th>
			<td><%=content %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=writer %></td>
		</tr>
		<tr>
			<th>작성일시</th>
			<td><%=writedate %></td>
		</tr>
	</table>
	<button id="btn_list">목록으로</button>
	<button id="btn_delete">삭제하기</button>
	<button id="btn_update">수정하기</button>
</body>
</html>