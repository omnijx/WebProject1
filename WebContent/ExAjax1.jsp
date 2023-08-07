<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src = "js/jquery-3.7.0.min.js"></script>
	<script>
		$(function(){
			$("#btn1").click(function(){
				$.ajax({
					type: "post",
					url: "ExServlet1",
					success: function(data){
						alert("성공! " + data.check);
					},
					error: function(request,status,error){
						console.log("code: " + request.status)
						console.log("message: " + request.responseText)
						console.log("error: " + error);
					}
				})
			});
		});
	</script>
</head>
<body>
	<button id="btn1">버튼1</button>
</body>
</html>