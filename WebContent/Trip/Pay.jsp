<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.DB.DBUtil"%>
<%@page import="com.main.TMemberDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id1 = (String) session.getAttribute("id");

	//System.out.println(id1);

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

		//System.out.print(sql);
		//디버깅용

		if (rs.next()) {
			dto.setSeq(rs.getString("seq"));
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
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />

<title>금요일에 만나요~♡</title>

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

<link href="/FridayTrip/Trip/css/smoothness/jquery-ui-1.10.4.custom.css"
	rel="stylesheet">

<!-- [favicon] begin -->
<link rel="shortcut icon" type="image/x-icon"
	href="/FridayTrip/Trip/favicon.ico" />
<link rel="icon" type="image/x-icon" href="/FridayTrip/Trip/favicon.ico" />
<!-- [favicon] end -->

<!-- MAIN FONT STYLE -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz%3A400&amp;subset=latin%2Ccyrillic%2Cgreek"
	type="text/css" media="all" />
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

<!-- for portfolio slider -->
<script type="text/javascript"
	src="/FridayTrip/Trip/js/jquery.jcarousel.min.js"></script>

<!-- for the contact page -->
<script type="text/javascript" src="/FridayTrip/Trip/js/contact.js"></script>

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

<!-- Pop up -->
<script src="/FridayTrip/Trip/js/jquery-1.10.2.js"></script>
<script src="/FridayTrip/Trip/js/jquery-ui-1.10.4.custom.js"></script>

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

#tblmain {
	margin: 10px auto;
	margin-top: 10px;
}

#coinbox {
	width: 960px;
	height: 400px;
}

#sendbt {
	margin: 40px auto;
	margin-left: 650px;
	margin-top: 220px;
}

#coin01 {
	margin: 40px auto;
	text-align: center;
	margin-left: 90px;
	margin-bottom: 0px;
}

#coincontentbox {
	margin: 40px auto;
	border: 2px solid #ededed;
	width: 480px;
	height: 100px;
	position: absolute;
	top: 600px;
	left: 400px;
	padding: 20px;
}

.content {
	font-size: 12px;
}

#tblList1,#tblList2,#tblList3 {
	width: 800px;
	margin: 10px auto;
	border: 1px solid #e0e0e0;
	font-size: 14px;
	font-family: 돋움, dotum;
}

#tblList1 th {
	width: 120px;
	text-align: right;
	border: 1px solid #e0e0e0;
}

#tblList1 td {
	width: 677px;
	border: 1px solid #e0e0e0;
}

#tblList2 tr th,td:FIRST-CHILD {
	width: 697px;
	border: 1px solid #e0e0e0;
}

#tblList2 tr th,td:LAST-CHILD {
	width: 100px;
	border: 1px solid #e0e0e0;
}

#tblList3 tr td:FIRST-CHILD {
	width: 100px;
	border: 1px solid #e0e0e0;
}

#tblList3 tr td:LAST-CHILD {
	width: 697px;
	border: 1px solid #e0e0e0;
}

#boxList1 {
	margin: 10px auto;
	width: 800px;
	height: 100px;
	text-align: center;
}

#boxList2 {
	width: 800px;
	margin: 10px auto;
	text-align: left;
	font-size: 12px;
	padding-left: 45px;
}

h1 {
	padding-left: 30px;
	padding-top: 20px;
	font-family: 돋움, dotum;
}

h2 {
	padding-left: 30px;
	padding-top: 20px;
	font-family: 돋움, dotum;
}

hr {
	width: 850px;
}
</style>

<script type="text/javascript">
	function send() {

		var form = document.forms[0];
		var name = document.getElementById("name");
		var id = document.getElementById("id");
		var birth = document.getElementById("birth");
		var lv = document.getElementById("lv");
		var address = document.getElementById("address");
		var coin = document.getElementById("coin");
		var before = document.getElementById("before");
		var after = document.getElementById("after");

		form.submit();
	}
	function check() {
		var check1 = document.form.chbList1.checked; //체크박스1
		var check2 = document.form.chbList2.checked; //체크박스2
		var check3 = document.form.chbList3.checked; //체크박스3
		var check4 = document.form.chbList4.checked; //체크박스4

		var num = 0; //체크박스 체크 수 검사

		if (check1 == true) {
			num = 1;
			if (check2 == true) {
				num = 2;
				if (check3 == true) {
					num = 3;
					if (check4 == true) {
						num = 4;
					} else {
						alert("환불규정에 동의하셔야 합니다.");
						return false;
					}
				} else {
					alert("환불규정에 동의하셔야 합니다.");
					return false;
				}
			} else {
				alert("개인정보 제공에 동의하셔야 합니다.");
				return false;
			}
		} else {
			alert("결제 시 유의사항에 동의하셔야 합니다.");
			return false;
		}

		if (num == 4) {
			document.form.submit();
		} else {
			alert("모든 사항에 동의하셔야 합니다.");
			return false;
		}

	}
	function mouseover(){
		$("#application").css("border","1px solid red");
	}
	function mouseout(){
		$("#application").css("border", "1px solid white");
	}
</script>
</head>


<body class="image-sphere-style responsive">

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
			<div id="header" class="group">

				<!-- START LOGO -->
				<div id="logo" class="group">
					<a href="Index.do" title="Diverso"> <img src="images/logo.png"
						alt="Logo Diverso" />
					</a>
				</div>
				<!-- END LOGO -->

				<!-- start nav-->
				<ul class="flexy-menu thick orange" id="aaaaa">
					<li class="active"><a href="Index.do"> <span class="color">Home</span>

					</a></li>
					<li><a href="Trip.do"> <span>TOUR</span> <i class="icon2"></i>
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
							<li><a href="QA.do" id="menuname5">자주묻는 질문</a></li>
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

			<!-- END HEADER -->
			<div class="home-sections">
				<form name="form" method="POST"
					action="/FridayTrip/Trip/PayOk.do?seq=${seq}&table=${table}&app=${app}">
					<h1>신청/결제</h1>
					<hr />
					<h2>
						<span style="color: skyblue; font-size: 50px;">01</span> 구매자 정보
					</h2>
					<table id="tblList1">
						<tr>
							<th>이름</th>
							<td>${mdto.name}</td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td>${mdto.tel}</td>
						</tr>
						<tr>
							<th>등급</th>
							<td>${mdto.lv}</td>
						</tr>
						<tr>
							<th>현재 보유 코인</th>
							<td>${mdto.coin}원</td>
						</tr>

					</table>
					<h2>
						<span style="color: skyblue; font-size: 50px;">02</span> 결제 정보
					</h2>
					<table id="tblList2">
						<tr>
							<th>상품정보</th>
							<th>상품금액</th>
						</tr>
						<tr>
							<td>${dto.name}</td>
							<td>${dto.coin}원</td>
						</tr>
						<tr>
							<td colspan="2">여행기간 : ${dto.starts} ~ ${dto.ends} 까지
								${dto.days}일 간!</td>
						</tr>
					</table>

					<table id="tblList3">
						<tr>
							<td>상품금액</td>
							<td>${dto.coin}원</td>
						</tr>
						<tr>
							<td>할인금액</td>
							<td>${sale}원</td>
						</tr>
						<tr>
							<td>총 결제금액</td>
							<td>${dto.coin}- ${sale} = ${result} 원</td>
						</tr>
					</table>
					<div id="boxList1">
						<textarea name="txtarea1" id="txtarea1" cols="55" rows="6">
	               		결제 시 유의사항

1. 구매 후 환불
가. 청약철회기준에 의거하여 쿠폰을 수신 받은 날로부터 7일 이내에는 미사용쿠폰에 한하여 환불이 가능합니다.
나. 홈페이지 사용조건에 "미사용쿠폰환불"이 명시된 경우 쿠폰의 유효기간이 경과한 이후 구매대금의 70%를 쿠팡캐시로 환불하며, 쿠팡캐시 유효기간은 6개월로 합니다.
다. 구매쿠폰에 대한 취소 및 환불에 관한 자세한 사항은 쿠팡 이용약관 제19조, 제20조에 의합니다.

2. 상품에 대한 유의사항
가. 청약철회기준에 의거하여 상품을 공급 받은 날로부터 7일 이내에는 환불이 가능함이 원칙이며, 쿠팡 이용약관 제19조 제4항 각 호에 해당하는 경우에는 환불이 불가합니다.
나. 기타 상품의 취소 및 환불에 관한 자세한 사항은 쿠팡 이용약관 제19조, 제20조에 의합니다.

3. 고객은 홈페이지에 명시된 내용 및 사용조건을 확인하여야 할 책임이 있으며, 사용조건에 따라서만 쿠폰 및 상품을 사용하실 수 있습니다.

4. 회원의 개인정보는 당사의 개인정보취급방침에 따라 안전하게 보호됩니다. 
단 다음과 같은 경우 “회사”는 보다 나은 서비스 제공과 이용자의 편의 제공 등 업무수행을 원활하게 하기 위해 이용자의 개인정보를 동의 받은 이용목적 내에서 타 업체에 수집, 보관, 처리 등을 위탁하여 처리하고 있습니다. 
가. 판매자, 배송업체, 결제 처리 업체 등에게 거래 및 배송 등에 필요한 최소한의 회원의 정보 (성명, 주소, 이메일, 전화번호)를 제공하는 경우
나. 구매가 성사된 때에 그 이행을 위하여 필요한 경우 와 구매가 종료된 이후에도 반품, 교환, 환불, 취소 등을 위하여 필요한 경우
	               		</textarea>

						<textarea name="txtarea2" id="txtarea2" cols="50" rows="6">
	               		개인정보 제 3자 제공 추가 동의

회원의 개인정보는 당사의 개인정보취급방침에 따라 안전하게 보호됩니다.
“회사”는 이용자들의 개인정보를 "개인정보 취급방침의 개인정보의 수집 및 이용목적"에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다.
회사가 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 구매자 확인 및 해피콜 등 거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 업체에게 제공합니다.
상품명
제공받는자	제공목적	제공정보	보유 및 이용기간
8, 9월 여름 성수기 특가! 이스타항공 제주 편도 항공권
이스타항공주식회사	구매자 예약 확인, 해피콜	성명, 휴대전화번호, 이메일	상품 제공 완료 후 3개월

※ 동의 거부권 등에 대한 고지
개인정보 제공은 상품 구매를 위해 꼭 필요합니다. 개인정보 제공을 거부하실 수 있으나, 이 경우 상품 구매가 제한될 수 있습니다.
	               		</textarea>

					</div>
					<div id="boxList2">
						<input type="checkbox" name="chbList1" id="chbList1" /> 본인은 위의 결제
						시 유의사항에 대한 내용을 모두 이해하였으며 이에 동의합니다.<br /> <input type="checkbox"
							name="chbList2" id="chbList2" /> 본인은 위의 개인정보 제 3자 제공 추가 동의 내용을
						모두 이해하였으며 이에 동의합니다.<br /> <input type="checkbox" name="chbList3"
							id="chbList3" /> 본 상품은 특별 구성된 상품으로 7일 이후에 환불이 불가합니다. 이를 모두
						이해하였으며 이에 동의합니다.<br /> <input type="checkbox" name="chbList4"
							id="chbList4" /> 본 상품은 특별 구성된 상품으로 별도의 환불규정이 적용됩니다. 사용조건에 있는
						취소/환불 규정을 모두 이해하였으며 이에 동의합니다.<br />
					</div>

					<img src="/FridayTrip/Trip/images/trip/pay.JPG" alt="결제하기"
						onclick="check();" onmouseover="mouseover();" onmouseout="mouseout();" id="application"
						style="cursor: pointer; margin: 10px auto; margin-left: 400px;" />
				</form>
			</div>
			<!-- END HOME SECTIONS -->

			<!-- START COPYRIGHT -->
			<div id="copyright" class="group two-columns">
				<div class="inner group">
					<p class="left">
						Copyright <a href="#"><strong>Diverso</strong></a> 2010 - Powered
						by <a href="http://www.yourinspirationweb.com/en"><strong>Your
								Inspiration Web</strong></a>
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

</body>
</html>