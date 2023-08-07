<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <!-- 1. canvas 엘리먼트를 선언한다: id, widht, height를 태그 내에서 지정해준다. -->
    <canvas id="myCanvas" width="400" height="300"></canvas>
    

    <!-- Javascript -->
    <script>
    
        // 1. canvas 엘리먼트를 취득한다.
        const canvas = document.getElementById('myCanvas');

        // 2. 2d모드의 그리기 객체를 취득한다. => 이 객체를 통해 canvas에 그림을 그릴 수 있다.
        const ctx = canvas.getContext("2d");

        // 3. 이미지 객체 생성
        const img = new Image();

        // 4. 이미지 소스 설정
        img.src = "https://www.fcseoul.com/resources/front/images/common/img__emblem_seoul1_104x109.png";

        // 5. 이미지 로드이벤트- 콜백함수 등록
        img.onload = function(){
            // 이미지 그리기
            ctx.drawImage(img, 100, 100);
        }

    </script>

</body>
</html>