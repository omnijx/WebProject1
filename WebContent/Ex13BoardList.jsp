<%@page import="dao.BoardDao"%>
<%@page import="dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	// [기억] request.getParameter(파라미터명) ---> 해당 파라미터의 값을 리턴(문자열).
	// Ex. "...?page=1" ----> request.getParameter("page")는 "1"을 리턴.
	// [기억] Integer.parseInt("1") ---> 1을 리턴.  (즉, 문자열 --> 정수)
	int pageNum = 0;
	try{
		pageNum = Integer.parseInt(request.getParameter("page"));
	} catch(NumberFormatException e){
		pageNum = 1;
	}
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="js/jquery-3.7.0.min.js"></script>
	<script>
		var g1;
		let page_request = <%=pageNum%>;
		function request_one_page(){
			page_request += 1;
			$.ajax({
				type: "get",
				url: "BoardServlet2",
				data: { "pageNum": page_request },
				datatype: "json",
				success: function(data){
					console.log(data);
					for(var i=0; i<=data.length-1; i++){
						let str = "<tr>"
								+ "<td>"+ data[i].bno +"</td>"
								+ "<td>"+ data[i].title +"</td>"
								+ "<td>"+ data[i].writer +"</td>"
								+ "<td>"+ data[i].writedate +"</td>"
								+ "</tr>";
						$("#table1").append(str);
					}
				},
				error: function(r,s,e){
					alert("에러");
				}
			});
		}
		$(function(){
			$(window).scroll(function(){
				  var scrT = $(window).scrollTop();
				  console.log(scrT); //스크롤 값 확인용
				  if(scrT >= $(document).height() - $(window).height()){
				  	//스크롤이 끝에 도달했을때 실행될 이벤트
				  	request_one_page();
			  } 
			});
		});
// 		$(function(){
// 			$("#btn_write").click(function(){
// 				location.href="Ex13BoardWrite.jsp";
// 			});
			
// 			$("tr").click(function(){
// 				let bno = $(this).find(".bno").text();	
// 				location.href="Ex13BoardDetail.jsp?bno="+bno;
// 			});
// 		});s
// 		$(function(){
// 			$("tr").click(function(){
// 				let bno = Number($(this).find(".bno").text());
// 				$.ajax({
// 					type: "get",
// 					url: "BoardServlet",
// 					data: {"board_num": bno},
// 					datatype: "json",
// 					success: function(data){
// // 						alert("성공!");
// // 						alert(data.result);
// 						$(".bno").each(function(index,item){
// 							if($(item).text() == bno) {
// 								let txt = $(item).next().text();
// 								$(item).next().text(txt + "!");
// 							}
// 						});
// 					},
// 					error: function(request,status,error){
// 						console.log("code: " + request.status)
// 						console.log("message: " + request.responseText)
// 						console.log("error: " + error);
// 					}
// 				})
// 			});
// 		});
	</script>
	<style>
		table {
			border-collapse: collapse;  /* 한 줄의 경계선으로 만듦. */
			min-height: 1500px;
		}
		th,td {
			border: 1px solid grey;
			padding: 8px;
		}
	</style>
</head>
<body>
	<table id="table1">
		<tr>
			<th>글 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일시</th>
		</tr>
		<%
// 			ArrayList<BoardDto> boardList = new ArrayList<BoardDto>();
// 			Connection conn = getConnection();
			
// 			String sql = "SELECT b2.*"
// 					+ " FROM (SELECT rownum rnum, b1.*"
// 					+ " FROM (SELECT * FROM board ORDER BY bno DESC) b1) b2"
// 					+ " WHERE b2.rnum>=?  AND b2.rnum<=?";
// 			int endNum = pageNum * 15;
// 			int startNum = endNum - 14;
			
// 			PreparedStatement pstmt = conn.prepareStatement(sql);
// 						// PreparedStatement : sql문을 저장하고 실행하는 객체.
// 						// conn.prepareStatement(...) : pstmt 객체를 만듦 & SQL문을 장착함.
// 			pstmt.setInt(1, startNum);
// 						// pstmt.setInt(물음표번호, 정수 값); --> 물음표를 그 값으로 치환.
// 						// 참고) pstmt.setString(물음표번호, 문자열);
// 			pstmt.setInt(2, endNum);

// 			// [암기]
// 			// SELECT문의 실행 ---> "ResultSet rs = pstmt.executeQuery();"
// 			// INSERT,UPDATE,DELETE문의 실행 --> "pstmt.executeUpdate();"
// 			ResultSet rs = pstmt.executeQuery();
// 						// rs손가락이 1번행 바로 위를 가리키고 있음! (중요)
// 			while(rs.next()) {
// 				int bno = rs.getInt("bno");
// 				String title = rs.getString("title");
// 				String content = "";
// 				String writer = rs.getString("writer");
// 				String writedate = rs.getString("writedate");
// 				BoardDto dto = new BoardDto(bno, title, content, writer, writedate);
// 				boardList.add(dto);
				
// 						// rs.next() : rs손가락을 한줄 내리고 
// 						//             가리키는 데이터가 존재하면 true를 리턴.
// 						//			      가리키는 데이터가 존재하지 않으면 false를 리턴.
// 			}
			BoardDao boardDao = new BoardDao();
			ArrayList<BoardDto> boardList = boardDao.getBoardListByPageNum(pageNum);
			for(BoardDto dto : boardList) {
		%>
		<tr>
			<td class="bno"><%=dto.getBno()%></td>
			<td><%=dto.getTitle() %></td>
			<td><%=dto.getWriter()%></td>
			<td><%=dto.getWritedate()%></td>
		</tr>
		<%
			}
		%>
	</table>	
	
	<!-- Pagination(페이지네이션) -->
	<div style="padding-left:100px;">
<!-- 		<script> -->
<!--  			for(let i=1; i<=7; i++){ -->
<!--  				document.write("<a href='Ex13.jsp?page="+i + "'>" + i + "</a>"); -->
<!--  			} -->
<!-- 		</script> -->
		<%for(int i=1;i<=7;i++){ 
			if(i == pageNum){
		%>
			<span><%=i %></span>
		<%		
			} else{
		%>
		<a href="Ex13BoardList.jsp?page=<%=i%>"><%=i%></a>
		<%
		    } 
		}
		%>
	</div>
	<div>
		<button id="btn_write">글쓰기</button>
	</div>
</body>
</html>







