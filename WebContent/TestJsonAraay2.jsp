<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- <%@ page import="org.json.simple.*"%> --%>
<%-- <%@ page import="java.util.HashMap"%> --%>
<%-- <%@page import="java.sql.*"%> --%>
    
<%-- <% --%>
// // 	JSONObject jsonObject = new JSONObject();


// 	String driver = "oracle.jdbc.driver.OracleDriver";
// 	String url = "jdbc:oracle:thin:@localhost:1521:xe";
// 	String dbid = "project";
// 	String dbpw = "p123";
	
// 	Class.forName(driver);
// 	Connection conn = DriverManager.getConnection(url,dbid,dbpw);	
	
// 	String sql = "SELECT * FROM seat";
// 	PreparedStatement pstmt = conn.prepareStatement(sql);
// 	ResultSet rs = pstmt.executeQuery();
// 	JSONArray jsonArray = new JSONArray();
// 	while(rs.next()){
// 		HashMap<String, String> hashMap = new HashMap<>();
// 		hashMap.put("section", rs.getString("section"));
// 		hashMap.put("x_start", rs.getString("x_start"));
// 		hashMap.put("x_end", rs.getString("x_end"));
// 		hashMap.put("y_start", rs.getString("y_start"));
// 		hashMap.put("y_end", rs.getString("y_end"));
// 		JSONObject seat = new JSONObject(hashMap);
// 		jsonArray.add(seat);
// 	}
// 	rs.close();
// 	pstmt.close();
// 	conn.close();
	
//  	System.out.println(jsonArray.toJSONString());
<%-- %> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- 	<script> -->
<%-- 		let jArr = <%=jsonArray.toJSONString()%>; --%>
// 		alert(jArr[0].section); 
<!-- 	</script> -->
<!-- </body> -->
<!-- </html> -->