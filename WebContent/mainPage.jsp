<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%
		if(session.getAttribute("name")!=null && session.getAttribute("nick_name")!=null){
	%>
		<h1>
			<%=session.getAttribute("name")%>
			<%=session.getAttribute("nick_name")%>
		</h1>
	<%		
		} else {
	%>
	<h1>메인 페이지<%=session.getAttribute("name")%></h1>
	<%	
		}
	%>
</body>
</html>