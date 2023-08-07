<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int start = Integer.parseInt(request.getParameter("start"));
	int end = Integer.parseInt(request.getParameter("end"));
	int sum = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		for(int i=start; i<=end; i++){
			sum += i;
		}
	%>
	<h1>
		<%=start %> ~ <%=end %> 까지의 합 = <%=sum %>
	</h1>
</body>
</html>