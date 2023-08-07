<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	    <canvas id="myCanvas" width="400" height="600"></canvas>

    <!-- Javascript -->
    <script>
        // 1. canvas 엘리먼트를 취득한다.
        const canvas = document.getElementById('myCanvas');

        // 2. 2d모드의 그리기 객체를 취득한다. => 이 객체를 통해 canvas에 그림을 그릴 수 있다.
        const ctx = canvas.getContext("2d");
		
        // 이미지
        const img = new Image();

        img.src = "https://www.fcseoul.com/resources/front/images/common/img__emblem_seoul1_104x109.png";

        img.onload = function(){
            ctx.drawImage(img, 100, 100);
        }
        
        // 3. '선' 사각형 그리기
        ctx.strokeStyle = 'blue';
        ctx.strokeRect(10, 10, 100, 100);

        // 4. '색' 사각형 그리기
        ctx.fillStyle = 'pink';
        ctx.fillRect(10, 150, 100, 100);

        // 5. '선+색' 사각형 그리기
        ctx.strokeRect(10, 300, 100, 100);
        ctx.fillRect(10, 300, 100, 100);
        
        canvas.onclick = function(event){
            // 캔버스의 위치를 고려해 마우스 좌표를 취득
            const x = event.clientX - ctx.canvas.offsetLeft;
            const y = event.clientY - ctx.canvas.offsetTop;
            
            // 마우스 클릭한 곳에 좌표값 구하기
            alert("x : "+ x +"y : "+ y);
        }

    </script>
    
</body>
</html>