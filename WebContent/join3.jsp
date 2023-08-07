<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/join3.css">
	<script src="js/jquery-3.7.0.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- bxslider -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	$('html').click(function(e) {
		if($(e.target).hasClass("button")) {
			if ($(e.target).parent().find(".button123").css("display") == "none") {
				$(".button123").css("display","none");
				$(".button123").removeClass("on");
				$(e.target).addClass("on");
				$(e.target).parent().find(".button123").css("display","block");
			} else if($(e.target).parent().find(".button123").css("display") == "block"){
				$(e.target).parent().find(".button123").css("display","none");
				$(e.target).removeClass("on");
			}
		}
		if(!($(e.target).hasClass("button"))) {
			$(".button123").parent().find(".button").removeClass("on");
			$(".button123").css("display","none");
		}
	});
	$("document").ready(function() {  
		let menu = $(".contentButton");
		let menuLocation = menu.offset();
	    $(window).scroll(function() {  
	    	if($(window).scrollTop()>=menuLocation.top){
	    		$(".contentButton").css("position","fixed");
	    		$(".contentButton").css("top","0");
	    	}
	    	else {
	    		$(".contentButton").css("position","absolute");
	    		$(".contentButton").css("top","");
	    	}
	    });  
	});
	$(function () {
       $(document).ready(function(){
	        $(".slider").bxSlider({
	        	
	        });
       
           $(".mslide").bxSlider({
           		
           });
          
           $(".slide3").bxSlider({
           	
           }); 
         });   
	});
    </script>
    <script>
		let v1 = false;
		let v2 = false;
		$(function(){
			let smSlider = $(".inner1").bxSlider({
              	
	        });
			$("#amenu").click(function(){
				if($(".allList").css('display') == 'none'){
					$(".allList").css('display','block');
					$(".allmenu").addClass('on');
					$(".bannerlayer").css('display','block');					
				}else{
					$(".allList").css('display','none');
					$(".allmenu").removeClass('on');
					$(".bannerlayer").css('display','none');
				}
			});
			
			$(document).ready(function(){
  				var currentPosition = parseInt($(".sidebar").css("top"));
  			 	$(window).scroll(function() {
  			    	var position = $(window).scrollTop(); 
  			    	$(".sidebar").stop().animate({"top":position+currentPosition+"px"},700);
  			  	});
  			});
			$(document).ready(function() {
				$(document).on("click",".sbtn",function(){
					$(".sbtn").removeClass("snsbutton");
					$(this).parent().find(".sbtn").addClass("snsbutton");
				});
			});	
			
			$(".menulist li").each(function(index){
				$(this).mouseenter(function(){
					let idx = $(this).index();
					let mName = $(this).attr("id");
					$(".menulist li").removeClass("over");
					$(".detailmenu li.dm").hide();
					$(this).addClass("over");
					$("."+mName).show();
					$(".bannerlayer2").show();
					smSlider.reloadSlider();
					$("."+mName).mouseenter(function(){
						$(this).show();
						$(".menulist li").eq(idx).addClass("over");
						smSlider.reloadSlider();
					});
				});
				$("html, body").mouseleave(function(){
					hideFunc();
				});
				$(".bannerlayer2").mouseover(function(){
					hideFunc();
				});
			});
			
		});
    	function hideFunc() {
    		$(".menulist li").removeClass("over");
    		$(".detailmenu li.dm").hide();
    		$(".bannerlayer2").hide();
    	} 	
    	function ready() {
			alert("준비중입니다.");
		}
    </script>
	<script>
		window.onload = function(){
	        document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
	            //카카오 지도 발생
	            new daum.Postcode({
	                oncomplete: function(data) { //선택시 입력값 세팅
	                    document.getElementById("postal_code").value = data.address; // 주소 넣기
	                    document.querySelector("input[name=address]").focus(); //상세입력 포커싱
	                }
	            }).open();
	        });
	    }
	
		$(function(){
			let idCheck = 0;
			let nickCheck = 0;
			$(".lpClose").click(function(){
				$(this).parent().parent().parent().css("display", "none");
			});
			
			$("#pwBtn").click(function(){
				$(".lpWrap").css("display", "block");
			});
			
			// ajax 로 id 중복 체크
			$("#idCheck").click(function(){
				let checkID = RegExp(/^[a-zA-Z0-9]{4,12}$/);
				let id = $("#id").val();
			    $.ajax({
			        type: "GET",
			        url: "Servlet?command=idCheck",
			        data: {id: id},
			        success: function(result){
			        	
			        	if($("#id").val() == "") {
			                alert("아이디를 입력해주세요.");
			            } else if(!checkID.test($("#id").val())){
					    	alert("아이디는 6~15자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.");
					    	return false;
					    } else if (result == 1) {
			            	idCheck++;
			                alert("사용 가능한 아이디입니다.");
			            } else if(result == 0){
			                alert("중복된 아이디입니다.");
			                $("#id").focus();
			            }
			        }
			    });
			});
			
			$("#nickCheck").click(function(){
				
				let nick_name = $("#nick_name").val();
			    $.ajax({
			        type: "GET",
			        url: "Servlet?command=nickCheck",
			        data: {nick_name: nick_name},
			        success: function(result){
			            if (result == 1) {
			            	nickCheck++;
			                alert("사용 가능한 닉네임입니다.");
			            } else if(result == 0){
			                alert("중복된 닉네임입니다.");
			                $("#nick_name").focus();
			            } else {
			            	alert("닉네임을 입력해주세요.");
			            }
			        }
			    });
			});
			
			// 비밀번호 보이기/가리기
			$("#showPassword, #showPassword2").click(function(){
			        $('input').toggleClass('active');
			        if($('input').hasClass('active')){
			            $(this).attr('class',"fa fa-eye-slash fa-lg")
			            .prev('input').attr('type',"text");
			        }else{
			            $(this).attr('class',"fa fa-eye fa-lg")
			            .prev('input').attr('type','password');
			        }
			});
			
			// 가입 버튼 눌렀을 때 필수입력 칸 입력했는지 /형식에 맞게 썼는지 유효성 검사
			$(".bp").click(function(){
				let call = $("#call1 :selected").val()+$("#call2").val()+$("#call3").val();
				let e = $("#email").val()+"@"+$("#domain").val()+$("#domain2 :selected").val();
				let pw = $("#pw").val();
				let pw2 = $("#pw2").val();
				let checkID = RegExp(/^[a-zA-Z0-9]{4,12}$/);
				let checkNick = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
				let checkName = RegExp(/^[가-힣]{2,8}$/);
			    let checkEmail = RegExp(/^[A-Za-z0-9_\.\.-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			    // 아이디
				if($("#id").val() == ""){
			         alert("아이디를 입력해주세요.");
			         return false;
			     } else if(!checkID.test($("#id").val())){
				    	alert("아이디는 6~15자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.");
				     return false;
				 } else if(idCheck == 0){
					 alert("아이디 중복체크를 해주세요.")
				     return false;
				 }
				 
				 // 비밀번호
				 if($("#pass").val() == ""){
			        alert("비밀번호를 입력해주세요.");
			        return false;
			     } else if($("#pass").val().length < 8 || $("#pass").val().length >15){
		 		   		alert("비밀번호는 영문자, 숫자, 특수문자의 조합으로8~15자리로 입력해주세요.");
						return false;
				 } else if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test($("#pass").val())){
						alert("비밀번호는 영문자, 숫자, 특수문자의 조합으로8~15자리로 입력해주세요.");
						return false;
				 } else if(/(\w)\1\1/.test($("#pass").val())){
						alert("비밀번호는 3회이상 연속된 숫자/문자를 사용할 수 없습니다.");
						return false;
				 } 
				 
				 // 비밀번호 체크
				 if($("#pass2").val() == ""){
			        alert("비밀번호확인을 입력해주세요.");
			        return false;
			     } else if($("#pass").val()!= $("#pass2").val()){
						alert("비밀번호가 틀립니다.");
						return false;
			     } 
				 
				 // 닉네임
			     if($("#nick_name").val() == ""){
			        alert("닉네임을 입력해주세요.");
			        return false;
			     } else if(!checkNick.test($("#nick_name").val())){
			    	 alert("닉네임은 특수문자를 제외 영문, 한글 2~10자로 입력해주세요.");
			    	 return false;
			     } else if(nickCheck == 0){
			    	 alert("닉네임 중복체크를 해주세요.");
			    	 return false;
			     }
				 
				 // 이름
			     if($("#name").val() == ""){
			        alert("이름을 입력해주세요.");
			        return false;
			     } else if(!checkName.test($("#name").val())){
			    	 alert("이름은 한글로 입력해주세요.");
			    	 return false;
			     }
				 
				 // 생년월일
			     if($("#year").val() == "년도" || $("#month").val() == "월" || $("#day").val() == "일"){
			        alert("생년월일을 입력해주세요.");
			        return false;
			     }
				 // 성별
			     if(!$("input[name=gender]").is(":checked")){
			        alert("성별을 입력해주세요."); 
			        return false;
			     }
				 // 이메일
				 if($("#email").val() == ""){
					 alert("이메일을 입력해주세요.");
					 return false;
				 } else if($("[name=domain]").val()=="" && $("#domain2 :selected").val()=="") {
					 alert("도메인을 입력해주세요.");
					 return false;
				 } else if(!$("[name=domain]").val()=="" && !$("#domain2 :selected").val()==""){
					 alert("유효한 이메일 주소를 입력해주세요.");
					 return false;
				 } else if(!checkEmail.test(e)){
					 alert("유효한 이메일 주소를 입력해주세요.");
					 return false;
				 }
				 // 핸드폰
				 if($("#telecom").val() == "통신사"){
					 alert("통신사를 선택해주세요.");
					 return false;
				 } else if($("#call1").val() == "선택" || $("#call2").val() == "" || $("#call3").val() == ""){
					 alert("핸드폰 번호를 입력해주세요.");
					 return false;
				 } 
				 //주소
				 if($("#kakao_address").val() == ""){
					 alert("주소를 입력해주세요.");
					 return false;
				 } else if($("input[name=address]").val() == ""){
					 alert("상세 주소를 입력해주세요.")
					 return false;
				 }
				 
				return true;
			});
		});
	</script>
</head>
<body>
<div class="sidebar">
		<ul>
			<li>
				<a href=""></a>
			</li>
			<li>
				<a href="https://www.facebook.com/fcseoul" target="_blank"></a>
			</li>
			<li>
				<a href="https://instagram.com/fcseoul/" target="_blank"></a>
			</li>
			<li>
				<a href="http://www.youtube.com/user/FCSEOUL" target="_blank"></a>
			</li>
			<li>
				<a href="/vr/stadium" target="_blank"></a>
			</li>
		</ul>
	</div>
	<!-- 사이드바 -->
	


	<!-- 배너 -->
	<div class="wrap">
        <header class="header">
        <!-- 배너 -->
            <div class="subheader">
                <div class="header1">
                    <div class="left">
                        <ul>
                            <li><a href="" target="_blank"><img src="https://www.fcseoul.com/resources/front/images/common/btn_sns1.png" alt=""></a></li>
                            <li><a href="" target="_blank"><img src="https://www.fcseoul.com/resources/front/images/common/btn_sns2.png" alt=""></a></li>
                            <li><a href="" target="_blank"><img src="https://www.fcseoul.com/resources/front/images/common/btn_sns3.png" alt=""></a></li>
                            <li><a href="" target="_blank"><img src="https://www.fcseoul.com/resources/front/images/common/btn_vr.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="center">
                        <a href="#"><img src="https://www.fcseoul.com/resources/front/images/common/img_logo_gold.png" alt=""></a>
                    </div>
                    <div class="right">
                        <ul>
                            <li><a href="Servlet?command=myPage">마이페이지</a></li>
                            <li><a href="Servlet?command=join1">회원가입</a></li>
                            <li><a href="Servlet?command=login">로그인</a></li>
                            <li><a href="" class="eng">ENG</a></li>
                        </ul>
                    </div>
                </div>  
                <div class="header2">
      <!-- 클릭 -->	<div class="allmenu" id="amenu" >
                        <span class="all1"></span>
                        <span class="all2"></span>
                        <span class="all3"></span>
                    </div>
                    <ul class="menulist">
                        <li id="media"><a href="">MEDIA</a></li>
                        <li id="matches"><a href="">Matches</a></li>
                        <li id="tickets"><a href="">Tickets</a></li>
                        <li id="membership"><a href="">Membership</a></li>
                        <li id="club"><a href="">Club</a></li>
                        <li id="fanzone"><a href="">Fanzone</a></li>
                        <li id="shopb"><a href="" class="shop">shop</a></li>
                    </ul>
                </div>
            </div>
        <!-- 배너 -->
        <!-- 메뉴드롭 -->
        	<div class="bannerList">
        		<div class="subBanner">
      <!-- 나옴 -->  	<div class="allList" id="alist" style="display: none;">
        				<div class="list1">
        					<div class ="list1box" style="width: 135px">	
        						<ul>
        							<li><a href="">NEWS</a></li>
        							<li><a href="Servlet?command=notice">NOTICE</a></li>
        							<li><a href="Servlet?command=photo&category=all">PHOTO</a></li>
        						</ul>
        					</div>		<!-- 미디어 -->
        					<div class ="list1box" style="width: 158px">
        						<ul>
        							<li> <a>일정 / 결과</a></li>
        							<li> <a>기록 / 순위</a></li>
        						</ul>
        					</div>	<!-- 매치 -->
        					<div class ="list1box" style="width: 150px">
        						<ul>
        							<li><a href= "">티켓 예매</a></li>
        							<li><a href= "">시즌티켓</a></li>
        							<li><a href= "">단체 입장권</a></li>
        							<li><a href= "">1865 스카이박스</a></li>
        						</ul>
        					</div>	<!-- 티켓 -->
        					<div class ="list1box" style="width: 220px">
        						<ul>
        							<li><a href= "">멤버십(GS&POINT) 카드</a></li>
        							<li><a href= "">멤버십(GS&POINT) 카드 안내</a></li>
        						</ul>
        					</div>	<!-- 맴버쉽 -->
        					<div class ="list1box" style="width: 125px">
        						<ul>
        							<li><a href= "">선수단 소개</a></li>
        							<li><a href="" >유스팀 소개</a></li>
        							<li><a href= "">구단 소개</a></li>
        							<li><a href= "">스폰서</a></li>
        							<li><a href= "">전자공고</a></li>
        						</ul>
        					</div>	<!-- 클럽 -->
        					<div class ="list1box"style="width: 160px">
        						<ul>
        							<li><a href= "">공식SNS</a></li>
        							<li><a href= "">소셜계시판</a></li>
        							<li><a href= "">FAQ</a></li>
        							<li><a href= "">Q&A</a></li>
        							<li><a href= "">이벤트ZONE</a></li>
        							<li><a href= "">FC서울승리버스</a></li>
        						</ul>
        					</div>	<!-- 팬좀 -->
        					<div class ="list1box" style="width: 164px">
        						<ul>
        							<li><a href= "">온라인쇼핑몰</a></li>
        						</ul>
        					</div>	<!-- 샵 -->
        				</div>
        				<div class="vrbanner">
        					<a href="#" target="_blank">
        						<img alt="vr배너" src="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Imgs/menu_banner/1593407759624.jpg">
        					</a>
        				</div>
        			</div>
        			<div class="detailmenu">
        				<ul>
        					<li class="media dm" style="display: none;">
        						<div class="detailleft">
        							<h2>MEDIA</h2>
        							<ul>
        								<li><a href="">NEWS</a></li>
        								<li><a href="Servlet?command=notice">NOTICE</a></li>
        								<li><a href="Servlet?command=photo&category=all">PHOTO</a></li>
        							</ul>
        						</div>
        						<div class="detailright">
        							<div class="mediabox">
        								<h4>NEWS</h4>
        								<div>
        									<a href="#">
        										<img class="mediaimg" alt="news이미지" src="https://files.fcseoul.com/multi01/News/FcNews/1683618273221.png">
        										<p class="text">FC서울, 2023시즌 다문화 축구교실 후원금 전달식 성료</p>
        									</a>
        								</div>
        								<div>
        									<a href="#">
        										<img class="mediaimg" alt="news이미지" src="https://files.fcseoul.com/multi01/News/FcNews/1677553176924.png">
        										<p class="text">FC서울, 2023시즌 다문화 축구교실 참가자 모집</p>
        									</a>
        								</div>
        							</div>
        							<div class="mediabox">
        								<h4>NOTICE</h4>
        								<div class="noticebox">
        									<a href="">
        										<div class="nbox1">
        											<p class="ntext">2023시즌 FC서울 홈경기 장내외 장식물 제작 및 설치철거 파트너사 선정 재공고</p>
        											<div class="ntext2"><p>[나라장터 공고 바로가기]</p></div>
        											<div class="ndate">2022-12-29</div>
        										</div>
        									</a>
        								</div>
        								<div class="noticebox">
        									<a href="">
        										<div class="nbox1">
        											<p class="ntext">2023시즌 FC서울 홈경기 장내외 마케팅 파트너사 선정 재공고</p>
        											<div class="ntext2"><p>[나라장터 공고 바로가기]</p></div>
        											<div class="ndate">2022-12-29</div>
        										</div>
        									</a>
        								</div>
        							</div>
        							<div class="mediabox">
        								<h4>PHOTO</h4>
        								<div>
        									<a href="">
        										<img class="mediaimg" alt="" src="https://files.fcseoul.com/data03/img_lrg/1685399478872_b.JPG">
        										<p class="text">[K리그1 15R 강원(H)] 팬과 선수들 하나가 되어 승리의 랄랄라 송을 부르고 있다.</p>
        									</a>
        								</div>
        								<div>
        									<a href="">
        										<img class="mediaimg" alt="" src="https://files.fcseoul.com/data03/img_lrg/1685399399842_b.JPG">
        										<p class="text">[K리그1 15R 강원(H)] 팬들앞에서 펼치는 승리의 세레머니 김주성</p>
        									</a>
        								</div>
        							</div>
        						</div>
        					</li>
        					<li class="matches dm"  style="display: none;" >
        						<div class="detailleft">
        							<h2>MATCHES</h2>
        							<ul>
        								<li><a href="">일정 / 결과</a></li>
        								<li><a href="">기록 / 순위</a></li>
        							</ul>
        						</div>
        						<div class="detailright">
        							<div class="mbox">
        								<h4>PREV MATCHES</h4>
        								<div class="scorebox">
        									<div class="mleft">
        										<img alt="FC서울 logo" src="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">
        										<p>FC 서울</p>
        									</div>
        									<div class="mcenter">
        										<div class="mc1">
        											<p>0</p>	<!-- 졌을때 클래스 -->
        											<p>:</p>	
        											<p>1</p>	<!-- 이겼을때 클래스 -->
        										</div>
        									</div>
        									<div class="mright">
        										<img alt="대구 logo" src="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/em_K17.png">
        										<p>대구</p>
        									</div>
        									<div class="matchtime">
        										<p>2023.06.04(일) 19:00</p>
        										<p>DGB대구은행파크</p>
        									</div>
        									<div class="matchresult">
        										<a href="">경기결과</a>
        									</div>
        								</div>
        							</div>
        							<div class="mbox mid">
        								<h4>NEXT MATCHES</h4>
        								<div class="scorebox">
        									<div class="mleft">
        										<img alt="FC서울 logo" src="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">
        										<p>FC 서울</p>
        									</div>
        									<div class="mcenter">
        										<p class="vs">VS</p>
        									</div>
        									<div class="mright">
        										<img alt="인천 logo" src="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/em_K18.png">
        										<p>인천</p>
        									</div>
        								</div>
        								<div class="matchtime">
        									<p>2023.06.07(수) 19:30</p>
        									<p>인천축구전용경기장</p>
        								</div>
        								<div class="nomatch" style="display: none;">		<!-- 매치가 없을때 사용-->
        									<img alt="" src="https://www.fcseoul.com/resources/front/images/common/nogame_dropdown.jpg">
        								</div>
        							</div>
        							<div class="mbox2">
        								<p>
        									<img alt="k리그 logo" src="https://www.fcseoul.com/resources/front/images/common/ico_kLeague.png">
        									K LEAGUE 1
        								</p>
        								<p>현재순위 (16경기 기준)</p>
        								<p>
        									<strong>3</strong>
        									위
        								</p>
        								<div class="teamrecode">
        									<span>
        										<b>8</b>
        										승
        									</span>
        									<span>
        										<b>3</b>
        										무
        									</span>
        									<span>
        										<b>5</b>
        										패
        									</span>
        									<span>
        										<b>27</b>
        										점
        									</span>
        								</div>
        								<div class="allrecode">
        									<a href="" class="arbtn">전체순위</a>
        								</div>
        							</div>
        						</div>
        					</li>
        					<li class="tickets dm"  style="display: none;" >
        						<div class="detailleft">
        							<h2>MEDIA</h2>
        							<ul>
        								<li><a href="">티켓 예매</a></li>
        								<li><a href="">시즌티켓</a></li>
        								<li><a href="">단체 입장권</a></li>
        								<li><a href="">1865 스카이박스</a></li>
        							</ul>
        						</div>
        						<div class="detailright">
        							<a href="">
        								<img alt="" src="https://www.fcseoul.com/resources/front/images/common/img_drop_t4.jpg?20230216">
        							</a>
        						</div>
        					</li>
        					<li class="membership dm"  style="display: none;" >
        						<div class="detailleft">
        							<h2>MEMBERSHIP</h2>
        							<ul>
        								<li><a href="" onclick="ready()">멤버십(GS&POINT) 카드</a></li>
        								<li><a href="" onclick="ready()">멤버십(GS&POINT) 카드 안내</a></li>
        							</ul>
        						</div>
        						<div class="detailright">
									<div class="membox">	 <!-- float left marginleft 60px  -->
        								<a href="">
        									<img alt="" src="https://www.fcseoul.com/resources/front/images/common/img_drop_m1.jpg">
        								</a>
        							</div>
        							<div class="membox">
        								<a href="">
        									<img alt="" src="https://www.fcseoul.com/resources/front/images/common/img_drop_m2.jpg">
        								</a>
        							</div>
        						</div>
        					</li>
        					<li class="club dm"  style="display: none;" >
        						<div class="detailleft">
        							<h2>CLUB</h2>
        							<ul>
        								<li><a href="">선수단 소개</a></li>
        								<li><a href="" onclick="ready()">유스팀 소개</a></li>
        								<li><a href="">구단 소개</a></li>
        								<li><a href="" onclick="ready()">스폰서</a></li>
        								<li><a href="" onclick="ready()">전자공고</a></li>
        							</ul>
        						</div>
        						<div class="rightclub">
        							<div class="clubbox">
        								<div class="lbtn "> <img alt="" src="https://www.fcseoul.com/resources/front/images/sub/common/btn_seatPrev.png"> </div>
	        								<ul>
	        									<li>
	        										<a href="">
	        											<div class="pinfo">
	        												<p class="position">
	        													<span>FW</span> 
	        													<span>7</span>
	        												</p>	
	        												<p class="name">나상호</p> 	
	        												<br>
	        												<p class="goal"> 
	        													<strong>득점</strong> <span>8</span>
	        												</p>
	        												<p class="assist">
	        													<strong>도움</strong> <span>2</span>
	        												</p>
	        											</div>
	        											<img alt="" src="https://files.fcseoul.com/data03/Club/front_sml_img/1676855921670.png">
	        										</a>
	        									</li>	
	        									<!-- 	
	        									<li>
	        										<a href="">
	        											<div class="pinfo1">
	        												<span>MF</span> 
	        												<span>5</span> <br>
	        												<p>오스마르</p>
	        											</div>
	        											<img alt="" src="https://files.fcseoul.com/data03/Club/front_sml_img/1676857759521.png">
	        										</a>
	        									</li>
	        									<li>
	        										<a href="">
	        											<div class="pinfo2">
	        												<span>DF</span> 
	        												<span>2</span> <br>
	        												<p>황현수</p>
	        											</div>
	        											<img alt="" src="https://files.fcseoul.com/data03/Club/front_sml_img/1676858623975.png">
	        										</a>
	        									</li>
	        									<li>
	        										<a href="">
	        											<div class="pinfo3">
	        												<span>GK</span> 
	        												<span>1</span> <br>
	        												<span>백종범</span>
	        											</div>
	        											<img alt="" src="https://files.fcseoul.com/data03/Club/front_sml_img/1676857424509.png">
	        										</a>
	        									</li>
	        									 -->
	        								</ul>
	        							<div class="rbtn"> <img alt="" src="https://www.fcseoul.com/resources/front/images/sub/common/btn_seatNext.png"> </div>
        							</div>
        							<div class="clubbox">
        								<a href="">
        									<img alt="FC서울 유스" src="https://www.fcseoul.com/resources/front/images/common/img_drop_c2.jpg?2023022101">
        								</a>
        							</div>
        							<div class="clubbox">
        								<a href="">
        									<img alt="코칭스태프" src="https://www.fcseoul.com/resources/front/images/common/img_drop_c3.jpg?210909">
        								</a>
        							</div>
        						</div>
        					</li>
        					<li class="fanzone dm"  style="display: none;" >
        						<div class="detailleft">
        							<h2>FAN ZONE</h2>
        							<ul>
        								<li><a href="">공식 SNS</a></li>
        								<li><a href="">소셜게시판</a></li>
        								<li><a href="">FAQ</a></li>
        								<li><a href="">Q&A</a></li>
        								<li><a href="" onclick="ready()">이벤트 ZONE</a></li>
        								<li><a href="" onclick="ready()">FC서울 승리버스</a></li>
        							</ul>
        						</div>
        						<div class="detailright">
        							<div class="fanbox">	<!-- margin-left27px  float left-->
        								<a href="">
        									<img alt="" src="https://www.fcseoul.com/resources/front/images/common/img_drop_f3.jpg">
        								</a>
        							</div>
        							<div class="fanbox">
        								<a href="">
        									<img alt="" src="https://www.fcseoul.com/resources/front/images/common/img_drop_f2.jpg">
        								</a>
        							</div>
        							<div class="fanbox">
        								<a href="">
        									<img alt="" src="https://www.fcseoul.com/resources/front/images/common/img_drop_f1.jpg">
        								</a>
        							</div>
        						</div>
        					</li>
        					<li class="shopb dm"  style="display: none;" >
        						<div class="detailleft">
        							<h2>SHOP</h2>
        							<ul>
        								<li><a href="" class="dshop">온라인 쇼핑몰</a></li>
        							</ul>
        						</div>
        						<div class="detailright">
        							<div class="shopbox">
        								<strong>BEST ITEM</strong>
        								<div class="shopitem">
        								
        									<div class="inner">
        										<div class="lbtn"> <img alt="" src="https://www.fcseoul.com/resources/front/images/sub/common/btn_seatPrev.png"> </div>
	        										<div class="inner1">
		        										<ul>
		        											<div class="shopslide">
			        											<li>
			        												<a href="">
			        													<div class="shopimg">
																			<img alt="" src="	https://files.fcseoul.com/multi01/SHOP/Product/Product/202341979204_S.jpg">
																		</div>
																		<p>23 개인 마킹</p>
																		<p class="price">₩17,000</p>
			        												</a>
			        											</li>
			        											<li>
			        												<a href="">
			        													<div class="shopimg">
			        														<img alt="" src="https://files.fcseoul.com/multi01/SHOP/Product/Product/202282052545_S.jpg">
			        													</div>
			        													<p> 22. FC서울 레인보우 LAMP</p>
			        													<p class="price">₩15,000</p>
			        												</a>
			        											</li>
			        											<li>
			        												<a href="">
			        													<div class="shopimg">
			        														<img alt="" src="https://files.fcseoul.com/multi01/SHOP/Product/Product/202271211194_S.jpg">
			        													</div>
			        													<p>22 FCSEOUL 타투 스티커</p>
			        													<p class="price">₩3,500</p>
			        												</a>
			        											</li>
			        											<li>
		        												<a href="">
		        													<div class="shopimg">
		        														<img alt="" src="	https://files.fcseoul.com/multi01/SHOP/Product/Product/202282049176_S.jpg">
		        													</div>
		        													<p>22. FC서울 포토레인보우 (기성용)</p>
		        													<p class="price">₩10,000</p>
		        												</a>
		        											</li>
		           											</div>
		           										</ul>
		           										<ul>
		           											<div class="shopslide">	
			           											<li>
			        												<a href="">
			        													<div class="shopimg">
			        														<img alt="" src="https://files.fcseoul.com/multi01/SHOP/Product/Product/20231350501_S.jpg">
			        													</div>
			        													<p>23시즌 K리그 공식패치</p>
			        													<p class="price">₩13,000</p>
			        												</a>
			        											</li>
			        											<li>
			        												<a href="">
			        													<div class="shopimg">
			        														<img alt="" src="https://files.fcseoul.com/multi01/SHOP/Product/Product/202315420300_S.jpg">
			        													</div>
			        													<p>23 GS칼텍스 (골드,필드용)</p>
			        													<p class="price">₩6,000</p>
			        												</a>	
			        											</li>
			        											<li>
			        												<a href="">
			        													<div class="shopimg">
			        														<img alt="" src="https://files.fcseoul.com/multi01/SHOP/Product/Product/202315421730_S.jpg">
			        													</div>
			        													<p>23 팔 스폰서 (홈)</p>
			        													<p class="price">₩20,000</p>
			        												</a>
			        											</li>
			        											<li>
		        												<a href="">
		        													<div class="shopimg">
		        														<img alt="" src="	https://files.fcseoul.com/multi01/SHOP/Product/Product/202315421311_S.jpg">
		        													</div>
		        													<p>23 팔 스폰서 (어웨이)</p>
		        													<p class="price">₩20,000</p>
		        												</a>
		        											</li>
		        											</div>
		        										</ul>
		        										<ul>
		        											<div class="shopslide">
			        											<li>
			        												<a href="">
			        													<div class="shopimg">
			        														<img alt="" src="https://files.fcseoul.com/multi01/SHOP/Product/Product/202315423790_S.jpg">
			        													</div>
			        													<p>23 등번호+이름 (골드,필드용)</p>
			        													<p class="price">₩17,000</p>
			        												</a>
			        											</li>
			        											<li>
			        												<a href="">
			        													<div class="shopimg">
				        													<img alt="" src="https://files.fcseoul.com/multi01/SHOP/Product/Product/2022814549652_S.jpg">
			        													</div>
				        												<p>22. FC서울 WHITE 니트머플러</p>
				        												<p>₩23,000</p>
			        												</a>
			        											</li>
			        											<li>
			        												<a href="">
			        													<div class="shopimg">
				        													<img alt="" src="https://files.fcseoul.com/multi01/SHOP/Product/Product/2023127545997_S.jpg">
			        													</div>
				        												<p>23 신한플레이 (골드, 필드용)</p>
				        												<p class="price">₩6,000</p>
			        												</a>
			        											</li>
			        											<li>
		        												<a href="">
			        												<div class="shopimg">
			        													<img alt="" src="	https://files.fcseoul.com/multi01/SHOP/Product/Product/2023424111888_S.jpg">
			        												</div>
			        												<p>이달의 선수 패치</p>
			        												<p class="price">₩13,000</p>
		        												</a>
		        											</li>
		        											</div>
		        										</ul>
		        									</div>
	        									<div class="rbtn"> <img alt="" src="https://www.fcseoul.com/resources/front/images/sub/common/btn_seatNext.png"> </div>
        									</div>
        									
        								</div>
        							</div>
        						</div>
        					</li>
        				</ul>
        			</div>	
        		</div>
        	</div>
        </header>
    </div>
	<!-- 배너 -->
	<div class="bannerlayer" style="display: none;"></div>
	<div class="bannerlayer2" style="display: none;"></div>
	<!-- 메인 -->
<!-- 	<section class="bannertop"> -->
<!-- 				<div class="container"> -->
<!-- 					<h2>TICKETS</h2> -->
<!-- 				</div> -->
<!-- 				<div class="contentButton"> -->
<!-- 					<div class="content"> -->
<!-- 						<ul> -->
<!-- 							<li class="home"><a href="https://www.fcseoul.com/"></a></li> -->

<!-- 							<li> -->
<!-- 								<button class="button"> -->
<!-- 									TICKETS</button> -->
<!-- 								<ul id="buttonUI" class = button123 style="display: none;"> -->
<!-- 									<li><a href="https://www.fcseoul.com/media/newsList">MEDIA</a> -->
<!-- 									</li> -->
<!-- 									<li><a -->
<!-- 										href="https://www.fcseoul.com/Cmatches/schresultList">MATCHES</a> -->
<!-- 									</li> -->
<!-- 									<li><a -->
<!-- 										href="https://www.fcseoul.com/tickets/reserveSingleTicket">TICKETS</a> -->
<!-- 									</li> -->
<!-- 									<li><a -->
<!-- 										href="https://www.fcseoul.com/club/clubPlayerIntroductionList/FW">CLUB</a> -->
<!-- 									</li> -->
<!-- 									<li><a href="https://www.fcseoul.com/fanzone/sns">FAN -->
<!-- 											ZONE</a></li> -->
<!-- 								</ul> -->
<!-- 							</li> -->

<!-- 							<li> -->
<!-- 								<button class="button"> -->
<!-- 									티켓 예매</button> -->
<!-- 								<ul id="buttonUI2" class = button123 style="display: none;"> -->
<!-- 									<li><a href="http://localhost:9080/FCseoul/MatchInfo.html">티켓 예매</a> -->
<!-- 									</li> -->
<!-- 									<li><a href="http://localhost:9080/FCseoul/rankingList.html">시즌티켓</a> -->
<!-- 									</li> -->
<!-- 									<li><a href="http://localhost:9080/FCseoul/rankingList.html">단체 입장권</a> -->
<!-- 									</li> -->
<!-- 									<li><a href="http://localhost:9080/FCseoul/rankingList.html">1865 스카이박스</a> -->
<!-- 									</li> -->
<!-- 								</ul> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 		</section> -->
	<div class="wrapper">
		<div class="subMain">
			<section class="top">
				<div class="fl route">
					<span>share</span> <img
						src="https://www.fcseoul.com/resources/front/images/sub/common/ico_gt.png" />
					<a href=""> <img
						src="https://www.fcseoul.com/resources/front/images/sub/common/ico_sns1.png" />
					</a>
				</div>
				<h3 class="fl">회원가입</h3>
				<div class="fr">
					<button type="button" class="urlCopy">URL 복사</button>
					<script>
						document.querySelector(".urlCopy").addEventListener("click", function() {
						  const currentURL = window.location.href;
						
						  const tempTextarea = document.createElement("textarea");
						  tempTextarea.value = currentURL;
						  document.body.appendChild(tempTextarea);
						  tempTextarea.select();
						  document.execCommand("copy");
						  document.body.removeChild(tempTextarea);
						
						  alert("URL이 복사되었습니다.");
						});
				</script>
				</div>
				<div style="clear: both;"></div>
			</section>
			<div class="joinStepWrap">
				<ul>
					<li>
						<div class="jsTxt">
							<p>STEP.1</p>
							<p>약관동의</p>
						</div>
						<div class="jsLast">
							<div class="jsBefore"></div>
							<div class="jsAfter"></div>
						</div>
					</li>
					<li>
						<div class="jsTxt">
							<p>STEP.2</p>
							<p>본인인증</p>
						</div>
						<div class="jsLast">
							<div class="jsBefore" style="border-top-color: rgb(199, 1, 1);
							    border-bottom-color: rgb(199, 1, 1);"></div>
							<div class="jsAfter"></div>
						</div>
					</li>
					<li class="active">
						<div class="jsTxt">
							<p>STEP.3</p>
							<p>기본정보입력</p>
						</div>
						<div class="jsLast">
							<div class="jsBefore">
							</div>
							<div class="jsAfter"></div>
						</div>
					</li>
					<li>
						<div class="jsTxt">
							<p>STEP.4</p>
							<p>가입완료</p>
						</div>
					</li>
				</ul>
			</div>
			<form action="Servlet" method="get">
				<input type="hidden" name="command" value="register"/>
				<div class="sub1">
					<div class="hs">
						<h4>기본정보입력</h4>
						<span>입력하신 정보는 회원님의 동의없이 공개되지 않으며, 개인정보보호정책에 의해 보호를 받습니다.</span>
					</div>
					<div class="hs2">
						<h5>개인정보입력</h5>
						<span>
							<i class="point">*</i>  표시는 필수 입력 항목입니다.
						</span>
					</div>
					<div class="tblWrap row">
						<table>
							<tr>
								<th>
									회원아이디  <span class="point">*</span>
								</th>
								<td>
									<span>
										<input type="text" name="id" id="id" maxlength="15"/>
									</span>
									<span>
										<input type="button" id="idCheck" value="중복확인" class="point"/>
									</span>
									<span>6~15자의 영문 소문자, 숫자와 특수기호(_)만 사용</span>
								</td>
							</tr>
							<tr>
								<th>
									비밀번호  <span class="point">*</span>
								</th>
								<td class="tbl_pb">
									<span>
										<input type="password" name="pass" id="pass" maxlength="15"/>
										<i id="showPassword"></i>
									</span>
									<span>영문 대/소문자, 숫자, 특수문자(!@#$%&* 7종) 를 포함한 문자를 사용하여 8~15자리로 구성해야 합니다.</span>
									<span style="margin-left: 41px;">
										<input type="button" value="비밀번호 도움말" id="pwBtn"/>
									</span>
								</td>
							</tr>
							<tr>
								<th>
									비밀번호 확인  <span class="point">*</span>
								</th>
								<td>
									<span>
										<input type="password" name="pass2" id="pass2" maxlength="15"/>
										<i id="showPassword2"></i>
									</span>
									<span>비밀번호를 동일하게 입력해주세요.</span>
								</td>
							</tr>
							<tr>
								<th>
									닉네임  <span class="point">*</span>
								</th>
								<td>
									<span>
										<input type="text" name="nick_name" id="nick_name" maxlength="10"/>
									</span>
									<span>
										<input type="button" id="nickCheck" value="중복확인" class="point"/>
									</span>
									<span>특수문자를 제외 영문, 한글 또는 숫자 2~10자</span>
								</td>
							</tr>
							<tr>
								<th>
									성명(한글)  <span class="point">*</span>
								</th>
								<td>
									<span>
									<input type="text" name="name" id="name" value="${name}"/>
									</span>
								</td>
							</tr>
							<tr>
								<th>
									생년월일  <span class="point">*</span>
								</th>
								<td>
									<span>
										<select id="birth" name="birth">
											<option>년도</option>
											<%for(int i=1980;i<=2010;i++){ %>
											<option><%=i %></option>
											<%} %>
										</select>
									</span>
									<span>
										<select id="month" name="month">
											<option>월</option>
											<%for(int i=1;i<=12;i++){ %>
											<option><%=i %></option>
											<%} %>
										</select>
									</span>
									<span>
										<select id="day" name="day">
											<option>일</option>
											<%for(int i=1;i<=31;i++){ %>
											<option><%=i %></option>
											<%} %>
										</select>
									</span>
								</td>
							</tr>
							<tr>
								<th>
									성별  <span class="point">*</span>
								</th>
								<td>
									<span>
										<input type="radio" name="gender" id="male" value="남자"/>
										<label for="mail">남자</label>
									</span>
									<span>
										<input type="radio" name="gender" id="female" value="여자"/>
										<label for="fmail">여자</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>
									E-mail  <span class="point">*</span>
								</th>
								<td>
									<span>
										<input type="text" name="email" id="email"/>
									</span>
									<span class="ml0">@</span>
									<span>
										<input type="text" name="domain" id="domain"/>
									</span>
									<span>
										<select name="domain2" id="domain2">
											<option value="">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="gmail.com">gmail.com</option>
											<option value="nate.com">nate.com</option>
											<option value="hotmail.com">hotmail.com</option>
										</select>
									</span>
								</td>
							</tr>
							<tr>
								<th>
									휴대폰번호  <span class="point">*</span>
								</th>
								<td class="phone">
									<span>
										<select id="telecom">
											<option>통신사</option>
											<option value="SKT">SKT</option>
											<option value="KT">KT</option>
											<option value="LGT">LGT</option>
											<option value="KGT">KCT</option>
										</select>
									</span>
									<span>
										<select id="call1" name="phone1">
											<option value="${phone.substring(0,3)}">${phone.substring(0,3)}</option>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
									</span>
									-
									<span>
										<input type="text" id="call2" name="phone2" maxlength="4" value="${phone.substring(3,7)}"/>
									</span>
									-
									<span>
										<input type="text" id="call3" name="phone3" maxlength="4" value="${phone.substring(7)}"/>
									</span>
								</td>
							</tr>
							<tr>
								<th>휴대폰 소유자</th>
								<td>
									<span>
										<input type="radio" name="phone_owner" id="Y" value="Y" class="ml0"/>
										<label for="myphoneY">본인</label>
									</span>
									<span>
										<input type="radio" name="phone_owner" id="N" value="N"/>
										<label for="myphoneN">타인</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>
									주소  <span class="point">*</span>
								</th>
								<td>
									<div>
										<span>
											<input type="text" id="postal_code" name="postal_code" readonly/>
										</span>
										<span>
											<input type="button" id="address_kakao" value="주소 검색" class="bgGray"/>
										</span>
									</div>
									<div>
										<span>
											<input type="text" name="address" maxlength="50"/>
										</span>
										<span>
											<input type="text" name="address2" maxlength="50"/>
										</span>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="abv">
					<h5>마케팅 및 광고 활용 수신 여부 (선택) </h5>
					<span class="fr">마케팅 및 광고 활용에 동의한 경우만 해당 됩니다.</span>
					<div class="tblWrap row col2">
						<table>
							<tr>
								<th>SMS 수신 여부</th>
								<td>
									<span>
										<input type="radio" name="sms_receive" class="ml0" value="Y" checked="checked"/>
										<label for="smsCheckY">예</label>
									</span>
									<span>
										<input type="radio" name="sms_receive" class="ml0" value="N"/>
										<label for="smsCheckN">아니오</label>
									</span>
								</td>
								<th>이메일 수신 여부</th>
								<td>
									<span>
										<input type="radio" name="email_receive" value="Y" class="ml0" checked="checked"/>
										<label for="emailCheckY">예</label>
									</span>
									<span>
										<input type="radio" name="email_receive" value="N" class="ml0"/>
										<label for="emailCheckN">아니오</label>
									</span>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="gsJoinWrap">
					<div>
						<img src="https://www.fcseoul.com/resources/front/images/sub/join/img_banner1.jpg"/>
					</div>
					<div class="radioWrap">
						<span>
							<input type="radio" name="opGsJoin" id="gsJoinY" class="ml0" checked="checked"/>
							<label for="gsJoinY">가입합니다.</label>
						</span>
						<span>
							<input type="radio" name="opGsJoin" id="gsJoinN"/>
							<label for="gsJoinN">가입하지 않습니다.</label>
						</span>
					</div>
				</div>
				<div class="btnWrap">
					<input type="submit" class="bp" value="가입"/>
					<input type="reset" class="bg" value="취소"/>
				</div>
			</form>
		</div>
		<footer class="footer" id="footer">
			<section class="mainbot">
				<div class="contentwrap">
					<div class="sponsorwrap">
						<strong>
							main sponsors
						</strong>
						<div class="imgl">
							<a href="http://www.gs.co.kr" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_01.jpg
								" alt="GS">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.gsenc.com/" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_02.jpg?20230310" alt="GS건설">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.gscaltex.com" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_03.jpg" alt="GS칼텍스]">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.gs25.gsretail.com" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_05.jpg" alt="GS 25">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.gsshop.com" target="_blank">
								<img src="	https://www.fcseoul.com/resources/front/images/main/sponsor/img_04.jpg" alt="GS SHOP">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.gseps.com" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_06.jpg" alt="GS EPS">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.gspower.com" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_07.jpg" alt="GS 파워">
							</a>
						</div>
						
					</div>
					<div class="sponsorwrap">
						<strong>
							official sponsors
						</strong>
						<div class="imgl">
							<a href="http://www.shinhancard.com" target="_blank">
								<img src="	https://www.fcseoul.com/resources/front/images/main/sponsor/img_08.jpg
								" alt="신한카드">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.truefriend.com" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_09.jpg" alt="한국투자증권">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.kbinsure.co.kr" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_10.jpg" alt="KB손해보험">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.kbsec.com/go.able" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_11.jpg" alt="KB증권">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.nhqv.com/" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_12.jpg" alt="NH투자증권">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.uplus.co.kr" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_13.jpg
								" alt="엘지유플러스">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.lgensol.com" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_14.jpg" alt="엘지 에너지솔루션">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.lgchem.com" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_15.jpg" alt="엘지화학">
							</a>
						</div>
					</div>
					<div class="sponsorwrap2">
						<strong>
							official kit supplier
						</strong>
						<div class="imgl">
							<a href="http://www.prospecs.com" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_16.jpg" alt="프로스펙스">
							</a>
						</div>
					</div>
					<div class="sponsorwrap3">
						<strong>
							ofiicial principal partners
						</strong>
						<div class="imgl">
							<a href="http://www.tmon.co.kr" target="_blank">
								<img src="	https://www.fcseoul.com/resources/front/images/main/sponsor/img_18.jpg" alt="티몬">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.han-don.com" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_17.jpg?20230310" alt="한돈">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.keumyang.com" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_20.jpg?20230310" alt="1865">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.https://www.theclasshyosung.com/ko/desktop/passenger-cars.html" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_21.jpg" alt="더클래스 효성">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.heineken.com/nl" target="_blank">
								<img src="	https://www.fcseoul.com/resources/front/images/main/sponsor/img_19.jpg" alt="하이네켄">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.hurom.co.kr/" target="_blank">
								<img src="	https://www.fcseoul.com/resources/front/images/main/sponsor/img_22.jpg?20230310" alt="휴롬">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.https://www.fedex.com/ko-kr/home.html" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/logo-37.jpg" alt="페덱스">
							</a>
						</div>
					</div>
					<div class="sponsorwrap">
						<strong>
							ofiicial partners
						</strong>
						<div class="imgl">
							<a href="http://seoultwotop.com/" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_25.jpg" alt="서울투탑정형외과 재활의학과">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.madisesang.com/" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_24.jpg" alt="마디세상병원">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.xn--9m1b22a80igvdu3q.kr/" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_00.jpg" alt="더드림병원">
							</a>
						</div>
						<div class="imgr">
							<a href="https://www.seoul1hospital.com/" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_23.jpg?20230310" alt="서울원병원">
							</a>
						</div>
						<div class="imgl">
							<a href="https://www.redcap.co.kr/" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_27.jpg?20230310" alt="redcap투어">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.cocacola.co.kr/" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_28.jpg
								" alt="코카콜라">
							</a>
						</div>
						<div class="imgl">
							<a href="https://amigonacho.com/" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_31.jpg" alt="아미고">
							</a>
						</div>
					</div>
				</div>
				<div style="clear:both;"></div>
			</section>
			<div class="contentwrap2">
				<div class="footer1">
					<div class="foot">
						<div class="pri">
							<a href="">개인정보처리방침</a>
						</div>
						<div class="pri1">
							<a href="">이용약관</a>
						</div>
						<div class="pri1">
							<a href="">이메일무단수집거부</a>
						</div>
						<div class="pri1">
							<a href="">사이트맵</a>
						</div>
						<div class="pri1">
							<a href="">윤리경영제보</a>
						</div>
						<div class="pri1">
							<a href="">마케팅 제휴문의</a>
						</div>
						<div class="pri2">
							<a href="https://www.fcseoul.com/vr/stadium" target="_blank">
								<img src="	https://www.fcseoul.com/resources/front/images/common/btn_vr.png" alt="경기장 vr 보기">
							</a>
						</div>
						<div class="pri2">
							<a href="http://www.youtube.com/user/FCSEOUL" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/common/btn_sns3.png" alt="유튜브">
							</a>
						</div>
						<div class="pri2">
							<a href="https://instagram.com/fcseoul/" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/common/btn_sns2.png" alt="인스타그램">
							</a>
						</div>
						<div class="pri2">
							<a href="https://www.facebook.com/fcseoul" target="_blank">
								<img src="https://www.fcseoul.com/resources/front/images/common/btn_sns1.png" alt="페이스북">
							</a>
						</div>
					</div>
					<div style="clear:both;"></div>
				</div>
				<div class="footer2">
					<div class="foot1">
						<img src="https://www.fcseoul.com/resources/front/images/common/img_logo_gray.png" alt="FC SEOUL">
					</div>
					<div class="foot2">
						<ul>
							<li>대표자명 : 여은주</li>
							<li>대표전화 : 02-306-5050</li>
							<li>개인정보정책책임자 : 이재근</li>
							<li>서울시 마포구 월드컵로 240 서울월드컵경기장 내</li>
						</ul>
						<p>Copyright©2019 GS Sports Football Club Seoul</p>
					</div>
					<div class="foot3">
						<img src="	https://www.fcseoul.com/resources/front/images/common/img_award.png">
					</div>
				</div>
			</div>
		</footer>
	</div>
	<div class="lpWrap">
		<div class="lpCont">
			<div class="top2">
				<strong class="title2">비밀번호 도움말</strong>
				<button type="button" class="lpClose"></button>
			</div>
			<div class="bottom">
				<section>
					<div class="">
						<strong>영문(대ㆍ소문자) / 숫자 / 특수문자(!@$%^&*-7종) 중<br/>2종 이상을 조합하여 8~15자로 구성해야 합니다.</strong>
					</div>
					<div class="">
						<strong>아래에 해당하는 비밀번호는 사용을 금해주시기 바랍니다.</strong><br/>
						<ul>
							<li>
								1) 특정 패턴을 갖는 비밀번호
							</li>
							<li>
							- 동일한 문자의 반복 : aaabbb, 123123 등
							</li>
							<li>
							- 키보드상에서 연속한 위치에 존재하는 문자들의 집합 : qwerty, asdfgh 등
							</li>
							<li>
							- 특정 문자열이 포함된 패스워드 : password, votmdnjem, qlalfqjsgh
							</li>
							<li>
								2) 개인정보와 유추하기 쉬운 패스워드
							</li>
							<li>
							(ex :ID, 본인이름, 생년월일, 학번, 핸드폰, 집 전화번호 등이 포함된 패스워드)
							</li>
						</ul>
					</div>
					<div>
						<strong>비밀번호 변경시 기존에 사용하시던 비밀번호 사용은 불가능 합니다.</strong>
					</div>
					<div>
						<strong>비밀번호가 다른 사람에게 알려지는 것을 막기 위해<br/>
						1개월에 한 번씩 정기적으로 바꾸면서 사이트를 이용하여 주시기 바랍니다.</strong>
					</div>
				</section>
			</div>
		</div>
	</div>
	<div id="bgDark" class="bgDark" style="display: none;"></div>
</body>
</html>