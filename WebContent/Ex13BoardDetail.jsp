<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dto.BoardDto"%>
<%@ page import="dao.BoardDao"%>
    
<%  // <%부터 % > 까지 : 스크립틀릿. 
	int bno = Integer.parseInt(request.getParameter("bno"));
	BoardDao bDao = new BoardDao();
	BoardDto boardDto = bDao.getBoardDto(bno);
%>

<%! // <%!부터 % > 까지 : 선언부(declaration). 

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		table {
			border-collapse: collapse;  /* 한 줄의 경계선으로 만듦. */
		}
		th,td {
			border: 1px solid grey;
			padding: 8px;
		}
	</style>
</head>
<body>
	<table>
		<tr>
			<th>번호</th>
			<td><%=bno %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=boardDto.getTitle() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=boardDto.getContent() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=boardDto.getWriter() %></td>
		</tr>
	</table>
	<button onclick="location.href='Ex13BoardList.jsp';">목록으로</button>
	<button onclick="location.href='Ex13BoardUpdate.jsp?bno=<%=bno%>'">수정하기</button>
	<button onclick="location.href='Ex13BoardDelete.jsp?bno=<%=bno%>'">삭제하기</button>
</body>
</html>







