<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	int bno = Integer.parseInt(request.getParameter("bno"));
%>
<%!
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "testw11";
		String dbPw = "pass1234";
		
		Class.forName(driver);   // JDBC 드라이버 로딩.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
								// DB접속을 시도 ---> Connection객체를 리턴.
		
		return conn;
	}
%>
<%
	String title = "";
	String content = "";
	String writer = "";
	String writedate = "";
	
	try{
		Connection conn = getConnection();
		
		String sql = "SELECT * FROM board WHERE bno=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bno);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){
			title = rs.getString("title");
			content = rs.getString("content");
			writer = rs.getString("writer");
			writedate = rs.getString("writedate");
		}
		
		rs.close();
		pstmt.close();
		conn.close();
	} catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기</h1>
	<form action="Ex13BoardUpdateAction.jsp" method="post">
		<table>
			<tr>
				<th>글번호</th>
				<td>
					<input type="text" name="bno" value="<%=bno%>"/>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" value="<%=title%>"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" value="<%=content%>"/></textarea>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="writer" value="<%=writer%>"/>
				</td>
			</tr>
		</table>
		<input type="submit" value="장성완료"/>
	</form>
</body>
</html>