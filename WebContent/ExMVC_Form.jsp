<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Controller">
		num1 : <input type="text" name="num1"/> <br/>
		<select name="command">
			<option>선택하세요</option>
			<option value="plus">+</option>
			<option value="minus">-</option>
			<option value="multiply">*</option>
			<option value="divide">/</option>
		</select><br/>
		num2 : <input type="text" name="num2"/> <br/>
		<input type="submit" value="계산!"/>
	</form>
</body>
</html>