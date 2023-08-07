<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.PhotoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PhotoDAO"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	int pageNum = 0;
	try{
		pageNum = Integer.parseInt(request.getParameter("page"));
		if(pageNum == 0){
			pageNum = 1;
		}
	} catch(NumberFormatException e){
		pageNum = 1;
	}
	String category ="";
	String searchValue = "";
	String searchType = "";
	try{
		category = request.getParameter("category");
		searchValue = request.getParameter("searchValue");
		searchType = request.getParameter("searchType");
		if(category == null){
			category = "all";
		}
	} catch(Exception e){
		e.printStackTrace();
	}
	int endNum = pageNum * 15;
	int startNum = endNum - 14;

	PhotoDAO photoDao = new PhotoDAO();
	
	ArrayList<PhotoDTO> photoList = photoDao.photoSelect(category, searchValue, startNum, endNum);
	PhotoDTO photoCount = photoDao.photoCount(category, searchValue);
	
	int count = photoCount.getCount();
	int maxCount = (count/15)+1;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/photo.css">
	<script src="js/jquery-3.7.0.min.js"></script>
	<script>
	</script>
</head>
<body>
	<div class="submain">
		<section class="top">
			<div class="fl route">
				<span>share</span> <img
					src="https://www.fcseoul.com/resources/front/images/sub/common/ico_gt.png" />
				<a href=""> <img
					src="https://www.fcseoul.com/resources/front/images/sub/common/ico_sns1.png" />
				</a>
			</div>
			<h3 class="fl">PHOTO</h3>
			<div class="fr">
				<button type="button" class="urlCopy">URL 복사</button>
			</div>
			<div style="clear: both;"></div>
		</section>
		<section class="tabwrap">
			<ul class="tab">
				<li class="tab <%= category.equals("all") ? "on" : "" %>">
					<p>
						<a href="Photo.jsp?category=all"> <span>전체 </span></a>
					</p>
				</li>
				<li class="tab <%= category.equals("matches") ? "on" : "" %>"><a href="Photo.jsp?category=matches"><span>Matches</span></a></li>
				<li class="tab <%= category.equals("squad") ? "on" : "" %>"><a href="Photo.jsp?category=squad"><span>Squad</span></a></li>
				<li class="tab <%= category.equals("traning_rest") ? "on" : "" %>"><a href="Photo.jsp?category=traning_rest"><span>Training&Rest</span></a></li>
				<li class="tab <%= category.equals("historical_view") ? "on" : "" %>"><a href="Photo.jsp?category=historical_view"><span>Historical View</span></a></li>
				<li class="tab <%= category.equals("supporters") ? "on" : "" %>"><a href="Photo.jsp?category=supporters"><span>Supporters</span></a></li>
				<li class="tab <%= category.equals("fc_seoul_event") ? "on" : "" %>"><a href="Photo.jsp?category=fc_seoul_event"><span>FC Seoul Event</span></a></li>
				<li class="tab <%= category.equals("future_of_seoul") ? "on" : "" %>"><a href="Photo.jsp?category=future_of_seoul"><span>Future of Seoul</span></a></li>
			</ul>
		</section>
		<div class="ntwrap">
			<form action="Photo.jsp">
				<div class="search">
					<div class="sl">
						<span class="year">년도</span> <select name="searchYear">
							<option>전체</option>
							<option>2023</option>
							<option>2022</option>
							<option>2021</option>
							<option>2020</option>
							<option>2019</option>
							<option>2018</option>
							<option>2017</option>
							<option>2016</option>
							<option>2015</option>
							<option>2014</option>
							<option>2013</option>
							<option>2012</option>
							<option>2011</option>
							<option>2010</option>
							<option>2009</option>
							<option>2008</option>
							<option>2007</option>
							<option>2006</option>
							<option>2005</option>
							<option>2004</option>
							<option>2003</option>
							<option>2002</option>
							<option>2001</option>
							<option>2000</option>
						</select> <span class="game">경기</span> <select name="searchTake">
							<option>전체</option>
						</select>
					</div>
					<div class="sr">
							<select name="searchType">
								<option value="all">전체</option>
								<option value="subject">제목</option>
								<option value="내용">내용</option>
							</select> 
							<input type="hidden" name="category" value="search"/>
							<input type="text" name="searchValue" placeholder="검색어를 입력해주세요.">
							<input type="submit" value="검색">
					</div>
				</div>
			</form>
			<div class="plwrap">
				<ul>
				<%
					for(PhotoDTO pDto : photoList){
						int bno = pDto.getBno();
						String img = pDto.getImage();
						String title = pDto.getTitle();
						String r_date = pDto.getR_date();
				%>
					<li><a
						href="PhotoDetail.jsp?bno=<%=bno%>">
							<div class="imgwrap">
								<img
									src="<%=img%>">
							</div>
							<div class="txtwrap">
								<p class="txt"><%=title%></p>
								<p>
									<span><%=r_date%></span>
								</p>
							</div>
					</a></li>
				<% 
					}
				%>
				</ul>
			</div>
		</div>
		<div class="page">
			<a href="Photo.jsp?page=<%=pageNum - 1%>&category=<%=category%>&searchValue=<%=searchValue%>"></a>
			<%
			if(pageNum <=10 && maxCount <= 10){
				for(int i=1; i<=maxCount; i++){
					if(pageNum == i){
			%>
				<a class="on" href="Photo.jsp?page=<%=i %>&category=<%=category%>&searchValue=<%=searchValue%>"><%=i %></a>
			<%
				} else {
			%>
				<a href="Photo.jsp?page=<%=i%>&category=<%=category%>&searchValue=<%=searchValue%>"><%=i %></a>
			<%
				}
			}
			} else if(pageNum <= 10 && maxCount >= 11){
				for(int i=1; i<=10; i++){
					if(pageNum == i){
			%>
						<a class="on" href="Photo.jsp?page=<%=i %>&category=<%=category%>&searchValue=<%=searchValue%>"><%=i %></a>
			<%
					} else {
			%>
						<a href="Photo.jsp?page=<%=i%>&category=<%=category%>&searchValue=<%=searchValue%>"><%=i %></a>
			<%
					}
				}
			}
			else if(pageNum <=20 && maxCount <= 20){
				for(int i=11; i<=maxCount; i++){
					if(pageNum == i){
			%>
				<a class="on" href="Photo.jsp?page=<%=i %>&category=<%=category%>&searchValue=<%=searchValue%>"><%=i %></a>
			<%
					} else {
			%>
				<a href="Photo.jsp?page=<%=i%>&category=<%=category%>&searchValue=<%=searchValue%>"><%=i %></a>
			<%
					}
				}
			} else if(pageNum <= 20 && maxCount >= 21){
				for(int i=11; i<=20; i++){
					if(pageNum == i){
			%>
						<a class="on" href="Photo.jsp?page=<%=i %>&category=<%=category%>&searchValue=<%=searchValue%>"><%=i %></a>
			<%
					} else {
			%>
				<a href="Photo.jsp?page=<%=i%>&category=<%=category%>&searchValue=<%=searchValue%>"><%=i %></a>
			<%
					}
				}
			}
			else if(pageNum <=30 && maxCount <= 30){
				for(int i=21; i<=maxCount; i++){
					if(pageNum == i){
			%>
				<a class="on" href="Photo.jsp?page=<%=i %>&category=<%=category%>&searchValue=<%=searchValue%>"><%=i %></a>
			<%
					} else {
			%>
				<a href="Photo.jsp?page=<%=i%>&category=<%=category%>&searchValue=<%=searchValue%>"><%=i %></a>
			<%
				}
				}
			} else if(pageNum <= 30 && maxCount >= 31){
				for(int i=21; i<=30; i++){
					if(pageNum == i){
			%>
						<a class="on" href="Photo.jsp?page=<%=i %>&category=<%=category%>&searchValue=<%=searchValue%>"><%=i %></a>
			<%
					} else {
						%>
						<a href="Photo.jsp?page=<%=i%>&category=<%=category%>&searchValue=<%=searchValue%>"><%=i %></a>
					<%
					}
				}
			}
			if(pageNum == maxCount){
			%>
			<a href="Photo.jsp?page=<%=maxCount%>&category=<%=category%>&searchValue=<%=searchValue%>"></a>
			<%
			} else {
			%>
			<a href="Photo.jsp?page=<%=pageNum + 1%>&category=<%=category%>&searchValue=<%=searchValue%>"></a>
			<%
			}
			%>
		</div>
		</div>
	<div style="clear:both;"></div>
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
s					<div class="pri2">
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
</body>
</html>