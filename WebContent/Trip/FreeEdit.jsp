<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>          
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.DB.DBUtil"%>    
<%@page import="com.main.TMemberDTO"%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String id1=(String)session.getAttribute("id");

System.out.println(id1);

Connection con = null;
Statement stat = null;
ResultSet rs = null;

TMemberDTO dto = new TMemberDTO();

try {
	
	con = DBUtil.connect();
	stat = con.createStatement();

	String sql = String.format("select * from tmember where id= '%s'", id1);
	
	
	rs = stat.executeQuery(sql);

	System.out.print(sql);
	//디버깅용
	
	if(rs.next()){
				
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
		
	if(dto.getAfter()==null){
			
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

<!-- for the contact page -->
<script type="text/javascript" src="/FridayTrip/Trip/js/contact.js"></script>

<!-- CUSTOM JAVASCRIPT -->
<script type="text/javascript"
	src="/FridayTrip/Trip/js/jquery.custom.js"></script>
<!-- //js경로 끝 -->



        <link href="/FridayTrip/Trip/css2/flexy-menu.css" rel="stylesheet">
<script type="text/javascript" src="/FridayTrip/Trip/js/flexy-menu.js"></script>
<script type="text/javascript">$(document).ready(function(){$(".flexy-menu").flexymenu({speed: 400,type: "horizontal",align: "right"});});</script>

<style type="text/css">
	  	#aaaaa { z-index: 10;}
	  	#menuname0, #menuname1, #menuname2, #menuname3, #menuname4, #menuname5, #menuname6, #menuname7, #menuname8{ font-size: 11px; font-style: 돋움; }
	  	#title01 { font-size: 12px; font-style: normal; font-family: 돋움; }
	  	#primary { margin-left:150px;  }
	  	#qq1, #qq2, #qq3, #qq4 {font-size: 12px; font-style: normal; font-family: 돋움;}
	  	
	  </style> 

<style type="text/css">
#box1 {
	width: 960px;
	margin-top: -20px;
}

#box2 {
	width: 150px;
	float: left;
	margin-left: 20px;
}

#box3 {
	width: 960px;
}

#tbl1 {
	border: 2px solid #DEDEDE;
	border-collapse: collapse;
	margin-top: -2px;
}

.write {
	margin-left: 167px;
	margin-top: -15px;
	margin-bottom: 15px;
}

.write .img1 {
	width: 40px;
	height: 40px;
}

#free {
	padding: 20px;
	padding-left: 380px;
}

#tbl2 {
	width: 750px;
	height: 600px;
	border-collapse: collapse;
	border: 2px solid #DEDEDE;
}

#tbl2  th {
	text-align: center;
	border: 2px solid #DEDEDE;
}

#tbl2 #th1 {
	height: 30px;
	width: 30px;
}

#tbl2 #th2 {
	height: 30px;
	width: 30px;
}

#tbl2 #th3 {
	height: 30px;
	width: 30px;
}

#tbl2 #th4 {
	height: 405px;
	width: 30px;
}

#tbl2 td {
	border: 2px solid #DEDEDE;
}

#tbl2 .td1 {
	width: 100px;
}

#tbl2 .td2 {
	width: 100px;
}

#tbl2 .td3 {
	width: 300px;
}

#tbl2 .td4 {
	width: 95%;
}
</style>
<script type="text/javascript">
	function init() {
		
	}

	function send() {
		var form = document.forms[0];
		var name = document.getElementById("name");
		var title = document.getElementById("title");
		var content = document.getElementById("content");
		var pw = document.getElementById("pw");

		// 유효성 검사 (잘못된 부분 검사)
		if (name.value == "") {
			alert("이름을 입력하세요.");
			name.focus();
			return;
		}
		if (title.value == "") {
			alert("제목을 입력하세요.");
			subject.focus();
			return;
		}
		if (content.value == "") {
			alert("내용을 입력하세요.");
			content.focus();
			return;
		}
		if (pw.value == "") {
			alert("암호를 입력하세요.");
			pw.focus();
			return;
		}
		form.submit(); // 데이터 전송
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
                                 <li>                             
                                <c:if test="${empty id}">
						      	 <a href="/FridayTrip/Trip/login.jsp">로그인</a>  
						      	</c:if>
						      							      	
						      	<c:if test="${!empty id}">
						      	${id} 회원님 반갑습니다 
						      	</c:if>
						      	
	                           <%
								  //세션저장된 id 얻어오기
								  String id=(String)session.getAttribute("id");
								  if(id==null){//세션에 id가 없으면 로그인하지 않은 사용자
								%>
									<%            
									  }
									%>                                
                            </li>
                            <li> | <a href ="/FridayTrip/Trip/Mypage.jsp">Mypage</a></li>
                          <li> |  <c:if test="${!empty id}"> 
      						<a href="/FridayTrip/Trip/TMemberLogout.do" >로그아웃</a>  
      						</c:if></li>
                            <li> | <c:if test="${empty id}"><a href ="/FridayTrip/Trip/tMemberCont.jsp">회원가입</a></c:if>
                            
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
		<a href="Index.do"><img src="/FridayTrip/Trip/images/logo.png" alt="" /></a>
	</div>
	<div class="h_right">
		
		<!-- start nav-->
			<ul class="flexy-menu thick orange" id="aaaaa">
			<li class="active">
				<a href="Index.do">
					 <span class="color">Home</span>	
					 
				</a>
			</li>
			<li>
				<a href="Trip.do">
					 <span>TOUR</span>	
					 <i class="icon2"></i>
				</a>
				<ul>
					<li><a href="Bike.do" id="menuname0">자전거 여행</a></li>
					<li><a href="LocalTrip.do" id="menuname1">지역 탐방</a>			
					<li><a href="Food.do" id="menuname2" >맛집 여행</a></li>
					<li><a href="Mt.do" id="menuname3" >등산 여행</a></li>
					<li><a href="Fish.do" id="menuname4">낚시 여행</a></li>
				</ul>
			</li>
			<li>
				<a href="Map.do">
					 <span>ALLIANCE</span>	
					 <i class="icon2"></i>
				</a></li>
							
		
			<li>
				<a href="FreeList.do">
					 <span>COMMUNITY</span>	
					 <i class="icon3"></i>
				</a>
				<ul>
					<li><a href="FreeList.do" id="menuname5">자유게시판</a></li>
					<li><a href="EndList.do" id="menuname6">여행 후기</a>			
					<li><a href="List.do" id="menuname7" >회원끼리</a></li>		
				</ul>				
			</li>
			
			
				<li>
				<a href="CoinAdd.do">
					 <span>Coin</span>	
					 <i class="icon3"></i>
				</a>
				<ul>
					<li><a href="CoinAdd.do" id="menuname5">충전하기</a></li>
					<li><a href="Coin.do" id="menuname6">충전내역</a>			
					<li><a href="Coinre.do" id="menuname7" >결제내역</a></li>		
				</ul>				
			</li>
			
			<li>
				<a href="QA.do">
					 <span>Q&A</span>	
					 <i class="icon3"></i>
				</a>
				<ul>
					<li><a href="QA.do" id="menuname5">자주 묻는 질문</a></li>
					<li><a href="QA2.do" id="menuname6">1:1 질문</a>				
				</ul>				
			</li>
			<li style="border:0px;width:70px;">&nbsp;</li>
		</ul>
	</div></div></div>
		<!-- START WRAPPER -->
		<div class="section gradient s-1 group">
			<div id="free">
				<img src="/FridayTrip/Trip/images/free.jpg" alt="자유게시판" />
			</div>

			<div id="box1">
				<div id="box2">
					<table id="tbl1">
						<tr>
							<td><a href="/FridayTrip/Trip/FreeList.do">자유게시판</a></td>
						</tr>
						<tr>
							<td><a href="/FridayTrip/Trip/EndList.do">여행후기</a></td>
						</tr>
						<tr>
							<td><a href="/FridayTrip/Trip/List.do">회원끼리</a></td>
						</tr>
					</table>
				</div>

				<div id="box3">
					<form action="/FridayTrip/Trip/FreeEditOk.do" method="POST">
						<table id="tbl2">
							<tr>
								<th id="th1">이름</th>
								<td><input type="text" id="name" class="td1" name="name" disabled="disabled"
								value="${dto.name}" /></td>
							</tr>
							<tr>
								<th id="th2">암호</th>
								<td><input type="password" id="pw" class="td2" name="pw" /></td>
							</tr>
							<tr>
								<th id="th3">제목</th>
								<td><input type="text" id="title" class="td3" name="title" 
								value="${dto.title}" /></td>
							</tr>
							<tr>
								<th id="th4">내용</th>
								<td><textarea rows="25" cols="60" id="content" class="td4" 
								name="content">${dto.content}</textarea></td>
							</tr>
						</table>
						<input type="hidden" name="seq" value="${dto.seq}" />
						<input type="hidden" name="page" value="${page}"/>
					</form>
					
					<div class="write">
						<img src="/FridayTrip/Trip/images/004.JPG" alt="리스트" style="cursor: pointer"
							onclick="location.href='/FridayTrip/Trip/FreeList.do';" class="img1" />
							
						<img src="/FridayTrip/Trip/images/006.JPG" alt="이전으로" style="cursor: pointer"
							onclick="history.back();" class="img1" />	

						<img src="/FridayTrip/Trip/images/005.JPG" alt="수정완료" style="cursor: pointer" 
						onclick="send();" class="img1" />
					</div>
					
				</div>
			</div>
			<!-- box1 -->

		</div>
		<!-- 마지막 -->
		<%@include file="inc/bottom.jsp"%>
	</div>

</body>
</html>