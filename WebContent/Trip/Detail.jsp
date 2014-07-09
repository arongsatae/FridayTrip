<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.DB.DBUtil"%>
<%@page import="com.main.TMemberDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id1 = (String) session.getAttribute("id");

	System.out.println(id1);

	Connection con = null;
	Statement stat = null;
	ResultSet rs = null;

	TMemberDTO dto = new TMemberDTO();

	try {

		con = DBUtil.connect();
		stat = con.createStatement();

		String sql = String.format(
				"select * from tmember where id= '%s'", id1);

		rs = stat.executeQuery(sql);

		System.out.print(sql);
		//디버깅용

		if (rs.next()) {

			dto.setName(rs.getString("name"));
			dto.setId(rs.getString("id"));
			dto.setBirth(rs.getString("birth"));
			dto.setAddress(rs.getString("address"));
			dto.setTel(rs.getString("tel"));
			dto.setGender(rs.getString("gender"));
			dto.setLv(rs.getString("lv"));
			dto.setCoin(rs.getString("coin"));
			dto.setBefore(rs.getString("before"));
			dto.setAfter(rs.getString("after"));

		}

		if (dto.getAfter() == null) {

			dto.setAfter("");
		}

	} catch (Exception e) {
		System.out.println(e.toString());
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />

<title>금요일에 만나요~♡</title>
<!-- js 경로 -->

<link href="/FridayTrip/Trip/css/smoothness/jquery-ui-1.10.4.custom.css"
	rel="stylesheet">


<link rel="stylesheet" type="text/css" media="all"
	href="/FridayTrip/Trip/style.css" />
<link rel="stylesheet" type="text/css"
	media="screen and (max-width: 960px)"
	href="/FridayTrip/Trip/css/lessthen800.css" />
<link rel="stylesheet" type="text/css"
	media="screen and (max-width: 600px)"
	href="/FridayTrip/Trip/css/lessthen600.css" />
<link rel="stylesheet" type="text/css"
	media="screen and (max-width: 480px)"
	href="/FridayTrip/Trip/css/lessthen480.css" />

<!-- CUSTOM STYLE -->
<link rel="stylesheet" type="text/css" media="all"
	href="/FridayTrip/Trip/css/custom-style.css" />

<!-- [favicon] begin -->
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
<link rel="icon" type="image/x-icon" href="favicon.ico" />
<!-- [favicon] end -->

<!-- MAIN FONT STYLE -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz%3A400&amp;subset=latin%2Ccyrillic%2Cgreek"
	type="/FridayTrip/Trip/text/css" media="all" />
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Droid+Sans"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Oswald" type="text/css"
	media="all" />
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz%3A200%2C400"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed%3A300%7CPlayfair+Display%3A400italic"
	type="text/css" media="all" />
<!-- END MAIN FONT STYLE -->

<link rel="stylesheet" id="prettyPhoto-css"
	href="/FridayTrip/Trip/css/prettyPhoto.css" type="text/css" media="all" />
<link rel="stylesheet" id="jquery-tipsy-css"
	href="/FridayTrip/Trip/css/tipsy.css" type="text/css" media="all" />

<script type="text/javascript" src="/FridayTrip/Trip/js/jquery.js"></script>
<script type="text/javascript"
	src="/FridayTrip/Trip/js/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="/FridayTrip/Trip/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="/FridayTrip/Trip/js/jquery.tipsy.js"></script>
<script type="text/javascript"
	src="/FridayTrip/Trip/js/jquery.tweetable.js"></script>
<script type="text/javascript"
	src="/FridayTrip/Trip/js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript"
	src="/FridayTrip/Trip/js/jquery.flexslider.min.js"></script>
<script type="text/javascript"
	src="/FridayTrip/Trip/js/jquery.cycle.min.js"></script>

<!-- for accordion slider in staff page -->
<script type="text/javascript"
	src="/FridayTrip/Trip/js/jquery.hrzAccordion.js"></script>

<!-- for filterable effect in gallery and portfolio filterable page -->
<script type="text/javascript"
	src="/FridayTrip/Trip/js/jquery.quicksand.js"></script>
<!-- SLIDER ELASTIC -->
<link rel="stylesheet" id="slider-elastic-css"
	href="/FridayTrip/Trip/css/slider-elastic.css" type="text/css"
	media="all" />
<script type="text/javascript"
	src="/FridayTrip/Trip/js/jquery.eislideshow.js"></script>

<!-- SLIDER CYCLE -->
<link rel="stylesheet" id="slider-cycle-css"
	href="/FridayTrip/Trip/css/slider-cycle.css" type="text/css"
	media="all" />
<script type="text/javascript"
	src="/FridayTrip/Trip/js/jquery.slides.min.js"></script>

<!-- SLIDER THUMBNAILS -->
<link rel="stylesheet" id="slider-thumbnails-css"
	href="/FridayTrip/Trip/css/slider-thumbnails.css" type="text/css"
	media="all" />
<script type="text/javascript"
	src="/FridayTrip/Trip/js/jquery.aw-showcase.js"></script>

<!-- SLIDER FLASH -->
<script type="text/javascript" src="/FridayTrip/Trip/js/swfobject.js"></script>

<!-- SLIDER ELEGANT -->
<link rel="stylesheet" id="slider-elegant-css"
	href="/FridayTrip/Trip/css/slider-elegant.css" type="text/css"
	media="all" />

<!-- SLIDER NIVO -->
<link rel="stylesheet" id="slider-nivo-css"
	href="/FridayTrip/Trip/css/slider-nivo.css" type="text/css" media="all" />

<!-- CUSTOM JAVASCRIPT -->
<script type="text/javascript"
	src="/FridayTrip/Trip/js/jquery.custom.js"></script>


<!-- Tabs -->
<script src="/FridayTrip/Trip/js/jquery-1.10.2.js"></script>
<script src="/FridayTrip/Trip/js/jquery-ui-1.10.4.custom.js"></script>
<!-- //js경로 끝 -->

<link href="/FridayTrip/Trip/css2/flexy-menu.css" rel="stylesheet">
<script type="text/javascript" src="/FridayTrip/Trip/js/flexy-menu.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".flexy-menu").flexymenu({
			speed : 400,
			type : "horizontal",
			align : "right"
		});
	});
	
</script>

<style type="text/css">
#aaaaa {
	z-index: 10;
}

#menuname0,#menuname1,#menuname2,#menuname3,#menuname4,#menuname5,#menuname6,#menuname7,#menuname8
	{
	font-size: 11px;
	font-style: 돋움;
}

#title01 {
	font-size: 12px;
	font-style: normal;
	font-family: 돋움;
}

#primary {
	margin-left: 150px;
}

#qq1,#qq2,#qq3,#qq4 {
	font-size: 12px;
	font-style: normal;
	font-family: 돋움;
}
</style>

<!-- 스타일 -->
<style type="text/css">
#imgList1 {
	margin: 10px;
	float: left;
	border: 1px solid gray;
}

#txtList1 {
	float: left;
	border: 1px solid gray;
	width: 550px;
	height: 300px;
	margin-top: 10px;
}

#txtList2{
	padding: 20px;
}
#txtList2

#txtList1 p {
	padding-left: 50px;
}

hr {
	width: 500px;
}

#submit {
	font-size: 30px;
	margin-top: -20px;
	margin-left: 200px;
}

#tabs {
	float: left;
}

.tabs {
	width: 900px;
}

.subtitle {
	color: skyblue;
}

#application {
	cursor: pointer;
	width: 200px;
	height: 70px;
	margin-top: -30px;
	margin-left: 160px;
}
</style>

<!-- 자바스크립트 -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#tabs").tabs();
	});
	function send(){
		document.forms[0].submit();
	}
	function mouseover(){
		$("#application").css("border","1px solid red");
	}
	function mouseout(){
		$("#application").css("border", "1px solid white");
	}
</script>

</head>


<body class="home image-sphere-style responsive">

	<!-- START SHADOW WRAPPER -->
	<div class="shadowBg group">

		<!-- START WRAPPER -->
		<div class="wrapper group">

			<!-- START TOPBAR -->
			<div id="topbar">
				<div class="inner">
					<ul class="topbar_links">

						<!-- 로그인 상단 메뉴 -->
						<li><c:if test="${empty id}">
								<a href="/FridayTrip/Trip/login.jsp">로그인</a>
							</c:if> <c:if test="${!empty id}">
						      	${id} 회원님 반갑습니다 
						      	</c:if> <%
 	//세션저장된 id 얻어오기
 	String id = (String) session.getAttribute("id");
 	if (id == null) {//세션에 id가 없으면 로그인하지 않은 사용자
 %> <%
 	}
 %></li>
						<li>| <a href="/FridayTrip/Trip/Mypage.jsp">Mypage</a></li>
						<li>| <c:if test="${!empty id}">
								<a href="/FridayTrip/Trip/TMemberLogout.do">로그아웃</a>
							</c:if></li>
						<li>| <c:if test="${empty id}">
								<a href="/FridayTrip/Trip/tMemberCont.jsp">회원가입</a>
							</c:if>
					</ul>
					<div class="clear"></div>
				</div>
				<!-- end.inner -->
			</div>
			<!-- END TOPBAR -->

			<!-- START HEADER -->
			<div class="header">
				<div class="wrap">
					<div class="logo">
						<a href="Index.do"><img src="/FridayTrip/Trip/images/logo.png"
							alt="" /></a>
					</div>
					<div class="h_right">

						<!-- start nav-->
						<ul class="flexy-menu thick orange" id="aaaaa">
							<li class="active"><a href="Index.do"> <span
									class="color">Home</span>

							</a></li>
							<li><a href="Trip.do"> <span>TOUR</span> <i
									class="icon2"></i>
							</a>
								<ul>
									<li><a href="Bike.do" id="menuname0">자전거 여행</a></li>
									<li><a href="LocalTrip.do" id="menuname1">지역 탐방</a>
									<li><a href="Food.do" id="menuname2">맛집 여행</a></li>
									<li><a href="Mt.do" id="menuname3">등산 여행</a></li>
									<li><a href="Fish.do" id="menuname4">낚시 여행</a></li>
								</ul></li>
							<li><a href="Map.do"> <span>ALLIANCE</span> <i
									class="icon2"></i>
							</a></li>


							<li><a href="FreeList.do"> <span>COMMUNITY</span> <i
									class="icon3"></i>
							</a>
								<ul>
									<li><a href="FreeList.do" id="menuname5">자유게시판</a></li>
									<li><a href="EndList.do" id="menuname6">여행 후기</a>
									<li><a href="List.do" id="menuname7">회원끼리</a></li>
								</ul></li>


							<li><a href="CoinAdd.do"> <span>Coin</span> <i
									class="icon3"></i>
							</a>
								<ul>
									<li><a href="CoinAdd.do" id="menuname5">충전하기</a></li>
									<li><a href="Coin.do" id="menuname6">충전내역</a>
									<li><a href="Coinre.do" id="menuname7">결제내역</a></li>
								</ul></li>

							<li><a href="QA.do"> <span>Q&A</span> <i class="icon3"></i>
							</a>
								<ul>
									<li><a href="QA.do" id="menuname5">자주 묻는 질문</a></li>
									<li><a href="QA2.do" id="menuname6">1:1 질문</a>
								</ul></li>
							<li><c:if test="${id == 'admin' }">
									<a href="#"> <span>Manage</span> <i class="icon3"></i>
									</a>
									<ul>
										<li><a href="Member.do" id="menuname5">회원관리</a></li>
										<li><a href="TripAdd.do" id="menuname6">여행상품추가</a></li>
									</ul>
								</c:if></li>
							<li style="border: 0px; width: 70px;">&nbsp;</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- END HEADER -->


			<!-- HOME SECTIONS -->
			<form method="POST"
				action="/FridayTrip/Trip/Pay.do?seq=${dto.seq}&table=${table}&app=${app}">
				<div class="home-sections">
					<div id="dealinfo">
						<img src="/FridayTrip/Trip/images/trip/${dto.img}" id="imgList1" />
						<div id="txtList1">
							<div id="txtList2">
								<h5>${dto.subcontent}</h5>
								<h3 style="font-weight:bold;">${dto.name}</h3>
								<h4>가격 : &nbsp;<span style="color: skyblue; font-weight: bold; font-size: 30px; padding-top: 60px;">${dto.coin}</span> 원</h4>
								<p>남 : ${dto2.mcnt} 명 &nbsp;&nbsp;&nbsp; 여 : ${dto3.wcnt} 명
									참가</p>
							</div>
							<hr />
							<img src="/FridayTrip/Trip/images/trip/application.jpg"
								alt="/FridayTrip/Trip/images/trip/application.jpg"
								onclick="send();" style="" id="application" onmouseover="mouseover();" onmouseout="mouseout();"/>
						</div>
					</div>
				</div>
			</form>

			<div id="tabs">
				<ul>
					<li><a href="#tabs-1">상품 설명</a></li>
					<li><a href="#tabs-2">상품 문의</a></li>
					<li><a href="#tabs-3">상품 필수 표기 정보</a></li>
				</ul>
				<div id="tabs-1" class="tabs">
					<p class="subtitle">[기본정보]</p>
					최대참여인원 : ${dto.total} 명<br /> 신청기간 : ${dto.appstart} ~
					${dto.appends}<br /> 여행기간 : ${dto.starts} ~ ${dto.ends}
					(${dto.days} 일)

					<p class="subtitle">[상품정보]</p>
					${dto.content}

					<p class="subtitle">[유의사항]</p>
					최소 출발시간 10분 전까지 도착하시기 바랍니다. 탑승 시 구매순으로 좌석이 지정됩니다. 일자별 최소인원(30명) 미달
					시 행사가 취소 및 연기될 수 있습니다. 출발시간 이후 도착하실 경우 당일 취소로 간주됩니다. (당일 취소된 쿠폰은 환불
					불가합니다.) 여행일정은 기상상태나 현지사정에 따라 변경될 수 있습니다. 출발 및 현장에서의 시간 엄수는 필수입니다.
					탑승지 변경 시 업체에 연락하여 알려주시기 바랍니다. 동행인이 있을 때 '추가정보'입력란의 추가버튼을 눌러 별도의 정보를
					입력 바랍니다. ※날씨에 따라 풍경이 이미지와 다를 수 있습니다. ※차량 및 탑승지별로 모객 인원이 부족할 시
					출발지(탑승지)가 변경 될 수 있습니다.
					<p class="subtitle">[취소/환불규정]</p>
					딜이 진행 되는 동안에는 쿠팡 '마이쿠팡' 내역에서 직접 취소가 가능하며, 종료 후에는 7일 이내에 유선상으로
					취소/환불이 가능합니다.(쿠팡고객센터 : 1577 - 7011) 단, 7일 이후 업체의 규정에 따릅니다.(변경도 동일하게
					적용) 본 상품은 구매와 동시에 차량 예약 및 좌석 배정이 선진행되므로 여행 확정 된 이후에는 취소 수수료가 부과됩니다.
					영업일 기준이며 공휴일,휴일은 포함되지 않습니다. - 출발일 4일전까지 취소시 100% 환불 - 출발일 3일전까지 취소시
					80% 환불 - 출발일 2일전까지 취소시 50% 환불 - 여행 출발 1일 전/당일 취소 시 취소/환불 불가 (미연락,
					불참시도 환불 불가) 날짜변경도 취소와 동일하게 적용됩니다. ※취소접수는 영업일기준(월~금요일)이며,
					영업시간(오전9시~오후6시)까지만 가능합니다.
				</div>
				<div id="tabs-2" class="tabs">[기본정보] 최대참여인원: 6 명 신청기간:
					2014-04-01 ~ 2014-04-15 여행기간: 2014-05-31 ~ 2014-06-02 (3 일) [상품정보]
					즉흥적인 ! 다이나믹하게 ! 자유로운 영혼이 되어보세요 ! 코스는 없다 ! 오로지 필요한건 여러분의 선택과 의지만
					있으시면 됩니다 여러분의 도전을 기다립니다 ! [유의사항] 최소 출발시간 10분 전까지 도착하시기 바랍니다. 탑승 시
					구매순으로 좌석이 지정됩니다. 일자별 최소인원(30명) 미달 시 행사가 취소 및 연기될 수 있습니다. 출발시간 이후
					도착하실 경우 당일 취소로 간주됩니다. (당일 취소된 쿠폰은 환불 불가합니다.) 여행일정은 기상상태나 현지사정에 따라
					변경될 수 있습니다. 출발 및 현장에서의 시간 엄수는 필수입니다. 탑승지 변경 시 업체에 연락하여 알려주시기 바랍니다.
					동행인이 있을 때 '추가정보'입력란의 추가버튼을 눌러 별도의 정보를 입력 바랍니다. ※날씨에 따라 풍경이 이미지와 다를
					수 있습니다. ※차량 및 탑승지별로 모객 인원이 부족할 시 출발지(탑승지)가 변경 될 수 있습니다. [취소/환불규정]
					딜이 진행 되는 동안에는 쿠팡 '마이쿠팡' 내역에서 직접 취소가 가능하며, 종료 후에는 7일 이내에 유선상으로
					취소/환불이 가능합니다.(쿠팡고객센터 : 1577 - 7011) 단, 7일 이후 업체의 규정에 따릅니다.(변경도 동일하게
					적용) 본 상품은 구매와 동시에 차량 예약 및 좌석 배정이 선진행되므로 여행 확정 된 이후에는 취소 수수료가 부과됩니다.
					영업일 기준이며 공휴일,휴일은 포함되지 않습니다. - 출발일 4일전까지 취소시 100% 환불 - 출발일 3일전까지 취소시
					80% 환불 - 출발일 2일전까지 취소시 50% 환불 - 여행 출발 1일 전/당일 취소 시 취소/환불 불가 (미연락,
					불참시도 환불 불가) 날짜변경도 취소와 동일하게 적용됩니다. ※취소접수는 영업일기준(월~금요일)이며,
					영업시간(오전9시~오후6시)까지만 가능합니다.</div>
				<div id="tabs-3" class="tabs">[기본정보] 최대참여인원: 6 명 신청기간:
					2014-04-01 ~ 2014-04-15 여행기간: 2014-05-31 ~ 2014-06-02 (3 일) [상품정보]
					즉흥적인 ! 다이나믹하게 ! 자유로운 영혼이 되어보세요 ! 코스는 없다 ! 오로지 필요한건 여러분의 선택과 의지만
					있으시면 됩니다 여러분의 도전을 기다립니다 ! [유의사항] 최소 출발시간 10분 전까지 도착하시기 바랍니다. 탑승 시
					구매순으로 좌석이 지정됩니다. 일자별 최소인원(30명) 미달 시 행사가 취소 및 연기될 수 있습니다. 출발시간 이후
					도착하실 경우 당일 취소로 간주됩니다. (당일 취소된 쿠폰은 환불 불가합니다.) 여행일정은 기상상태나 현지사정에 따라
					변경될 수 있습니다. 출발 및 현장에서의 시간 엄수는 필수입니다. 탑승지 변경 시 업체에 연락하여 알려주시기 바랍니다.
					동행인이 있을 때 '추가정보'입력란의 추가버튼을 눌러 별도의 정보를 입력 바랍니다. ※날씨에 따라 풍경이 이미지와 다를
					수 있습니다. ※차량 및 탑승지별로 모객 인원이 부족할 시 출발지(탑승지)가 변경 될 수 있습니다. [취소/환불규정]
					딜이 진행 되는 동안에는 쿠팡 '마이쿠팡' 내역에서 직접 취소가 가능하며, 종료 후에는 7일 이내에 유선상으로
					취소/환불이 가능합니다.(쿠팡고객센터 : 1577 - 7011) 단, 7일 이후 업체의 규정에 따릅니다.(변경도 동일하게
					적용) 본 상품은 구매와 동시에 차량 예약 및 좌석 배정이 선진행되므로 여행 확정 된 이후에는 취소 수수료가 부과됩니다.
					영업일 기준이며 공휴일,휴일은 포함되지 않습니다. - 출발일 4일전까지 취소시 100% 환불 - 출발일 3일전까지 취소시
					80% 환불 - 출발일 2일전까지 취소시 50% 환불 - 여행 출발 1일 전/당일 취소 시 취소/환불 불가 (미연락,
					불참시도 환불 불가) 날짜변경도 취소와 동일하게 적용됩니다. ※취소접수는 영업일기준(월~금요일)이며,
					영업시간(오전9시~오후6시)까지만 가능합니다.</div>
			</div>
			<!-- END HOME SECTIONS -->

			<!-- START TWITTER -->
			<div id="twitter-slider" class="group">
				<div class="tweets-list"></div>
				<div class="bird"></div>
			</div>
			<!-- END TWITTER -->

			<!-- START COPYRIGHT -->
			<div id="copyright" class="group two-columns">
				<div class="inner group">
					<p class="left">
						Copyright <a href="#"><strong>Diverso</strong></a> 2010 - Powered
						by <a href="http://www.yithemes.com" title="Free HTML Template"><strong>Your
								Inspiration Themes</strong></a>
					</p>
					<p class="right">
						<a href="#" class="socials facebook" title="Facebook">facebook</a>
						<a href="#" class="socials rss" title="Rss">rss</a> <a href="#"
							class="socials flickr" title="Flickr">flickr</a> <a href="#"
							class="socials youtube" title="Youtube">youtube</a> <a href="#"
							class="socials twitter" title="Twitter">twitter</a> <a href="#"
							class="socials linkedin" title="Linkedin">linkedin</a> <a
							href="#" class="socials mail" title="Mail">mail</a> <a href="#"
							class="socials skype" title="Skype">skype</a>
					</p>
				</div>

			</div>
			<!-- END COPYRIGHT -->

		</div>
		<!-- END WRAPPER -->

	</div>
	<!-- END SHADOW -->

	<!-- START GOOGLE ANALYTICS -->
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-36516261-31', 'yithemes.com');
		ga('send', 'pageview');
	</script>
	<!-- END GOOGLE ANALYTICS -->
</body>
</html>