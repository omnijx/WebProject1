<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%!
//	String tpart = "";
// 	String openyn= "";
%>
<%
	request.setCharacterEncoding("utf-8"); 

// 	String id = request.getParameter("id");
// 	String name = request.getParameter("name");
// 	String type = request.getParameter("type");
// 	String open = request.getParameter("openyn");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
// 	String content = request.getParameter("textwrite");
	
	
// 	if(open.equals("n")){
// 		openyn = "https://www.fcseoul.com/resources/front/images/sub/common/ico__lock.png";
// 	}else{
// 		openyn = null;
// 	}
	
%>
<%!
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "project";
		String dbPw = "p123";
	
		Class.forName(driver);   // JDBC 드라이버 로딩.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
							// DB접속을 시도 ---> Connection객체를 리턴.
	
		return conn;
	}
%>
<%
// w_date,TO_NUMBER(TO_CHAR(sysdate, 'YYYYMMDD'),
	Connection conn = getConnection();
	String sql = " INSERT INTO notice(bno, title, w_date, content)"
			   + " VALUES(seq_notice.nextval, ?, TO_NUMBER(TO_CHAR(sysdate, 'YYYYMMDD')), ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,title);
	pstmt.setString(2,content);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
%>
<script>
	alert("글이 등록되었습니다.")
	location.href = "Notice.jsp";
</script>
