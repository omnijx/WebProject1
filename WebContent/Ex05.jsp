<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int dan = Integer.parseInt(request.getParameter("dan"));
%>
<%!
// 		void drawGugu(int dan, javax.servlet.jsp.JspWriter out) throws Exception {
// 		for(int i=1; i<=9; i++){
// 			out.println(dan + " * "+ i + " = " + (dan*i)+"<br/>");
// 			}
// 		}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		for(int i=1; i<=9; i++){
	%>
			<%=out.println(dan + " * "+ i + " = " + (dan*i))%><br/>
			<%=dan%> * <%=i%> = <%=dan*i%><br/>
	<%	
		}
	%>
</body>
</html>