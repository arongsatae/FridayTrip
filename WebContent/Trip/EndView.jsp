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

#tbl1 td {
	border: 2px solid #DEDEDE;
	font-size: 13px;
	font-weight: bold;
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

#End {
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
	height: 200px;
	width: 30px;
}

#tbl2 td {
	border: 2px solid #DEDEDE;
}

#img02 {
	float: left;
	padding-right: 4px;
}

#comment { 
	width: 750px; border: 2px solid #DEDEDE; margin-left: 170px; 
	border-collapse: collapse; margin-top: -28px;
}

#comment td { border: 2px solid #DEDEDE; text-align: center;}
#comm1 { width: 58px; margin: 0px; padding: 3px 5px; }
#comm2 { width:	480px; margin: 0px; padding: 3px 5px; }
#comm3 { width: 75px; margin: 0px; padding: 3px 5px; }
#comm4 { width: 50px; margin: 0px; padding: 3px 0px; }
#comm5 { width: 30px; margin: 0px; padding: 3px 5px; }

#comment2 { width: 750px; border: 2px solid #DEDEDE; 
	margin-left: 170px; margin-top: -28px; border-collapse: collapse; }
#comment2 td { text-align: center; padding: 3px 5px; margin: 0px; border: 2px solid #DEDEDE;}
#comin1 { width: 45px; margin: 0px; padding: 0px; }
#comin2 { width: 500px; margin: 0px; padding: 0px; }
#comin3 { width: 38px; margin: 0px; padding: 0px; }
#comin4 { width: 30px; margin: 0px; padding: 0px; }

</style>
<script type="text/javascript">
	function send() {
		var form = document.forms[3];
		form.submit();
	}
	
	function comin(n) {
		/* input 에 value 내용 적었다 클릭시 사라지게 만들기 */
		if (n == 1) {
			var in1 = document.getElementById("comin2");
			in1.value = "";
		} else if (n == 2) {
			var in2 = document.getElementById("comin3");
			in2.value = "";
		}		
	}
	
	function comWrite() {
		/* 댓글 쓰기 자료 전하기 */
		var form2 = document.forms[2];
		var in1 = document.getElementById("comin2");
		var in2 = document.getElementById("comin3");
	
		if (in1.value == "" || in1.value == "내용") {
			alert("내용을 입력하세요 !!");
			in1.focus();
			return;
		} else if (in2.value == "" || in2.value == "1111") {
			alert("암호를 입력하세요 !!");
			in2.focus();
			return;
		}
		form2.submit();
	}

	/* 삭제와 암호 태그 연결 */
	function comDel(del, txt, seq) {
			var sum = document.getElementById(txt).value;
			
	
			if (sum == "") {
				alert("암호를 입력하세요!!");
				sum.focus();
					
			}
			
			
			document.getElementById("pw2").value = sum;
			document.getElementById("boardSeq").value = seq;
			
			//alert(document.getElementById("pw2").value);
			
			document.getElementById("form2").submit();	
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
			<div id="End">
				<img src="/FridayTrip/Trip/images/End.jpg" alt="자유게시판" />
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
				<!-- 폼 첫번째 -->
					<form action="" method="POST" id="form1">
						<table id="tbl2">
							<tr>
								<th id="th1">번호</th>
								<td>${dto.seq}</td>
							</tr>
							<tr>
								<th id="th1">날짜</th>
								<td>${dto.regDate}</td>
							</tr>
							<tr>
								<th id="th1">조회</th>
								<td>${dto.count}</td>
							</tr>
							<tr>
								<th id="th7">장소</th>
								<td>${dto.travel}</td>
							</tr>
							<tr>
								<th id="th1">이름</th>
								<td>${dto.name}</td>
							</tr>
							<tr>
								<th id="th3">제목</th>
								<td>${dto.title}</td>
							</tr>
							<tr>
								<th id="th4">내용</th>
								<td>${dto.content}</td>
							</tr>
						</table>
					</form>
				
				<!-- 댓글 삭제 및 출력 start-->
				<!-- 폼 두번째 -->
				<form method="POST" id="form2" action="/FridayTrip/Trip/EndCommentDel.do">
					<table id="comment">
					<c:set var="i" value="1" />
					<c:forEach items="${clist}" var="clist">
						<tr>
							<td id="comm1">${clist.name}</td>
							<td id="comm2" style="text-align: left;">${clist.content}</td>
							<td id="comm3">${clist.regDate}</td>
							<td id="comm4">
								<input type="text" name="delpw" id="delpw${i}" 
									style="width: 50px; margin: 0px 3px;" value="암호입력" onfocus="this.value='';" />
							</td>
							<td id="comm5" onclick="comDel(this, 'delpw${i}', ${clist.seq});" style="cursor:pointer;" >삭제</td>
						</tr>
					<c:set var="i" value="${i +1}" />
					<input type="hidden" name="boardseq" id="boardSeq"/>
					</c:forEach>												
					</table>
					<input type="hidden" name="seq" value="${dto.seq}" />
					<input type="hidden" name="pw2" id="pw2" />
				</form>
				<!-- 댓글 삭제 end -->
						
					<!-- 댓글쓰기 start -->
					<!-- 폼 세번째 -->
					<form action="/FridayTrip/Trip/EndCommentOk.do" method="POST" id="form3" >
					<table id="comment2">
						<tr>
							<td><input type="text" id="comin1" value="${me.name}" disabled="disabled"/></td>
							<td style="text-align: left;">
								<input type="text" id="comin2" name="content" value="내용" 
									onfocus="comin(1);"/></td>
							<td><input type="password" id="comin3" value="1111" name="pw" 
								onfocus="comin(2);"/></td>
							<td id="comin4" onclick="comWrite();" style="cursor:pointer;" >쓰기</td>
						</tr>
					</table>
					
					<input type="hidden" name="memSeq" value="${me.seq}" />
					<input type="hidden" name="boardSeq" value="${seq}" />
					<input type="hidden" name="page" value="${page}"/>
					</form>
					<!-- 댓글쓰기 종료 end -->
					
					<div class="write">
						
						<!-- 검색중일시 검색 적용후 리스트로 다시 넘겨서 검색전 장면 보여주기 -->
						<!-- 검색중 아닐경우 -->
						<c:if test="${empty col}">
						<img src="/FridayTrip/Trip/images/004.JPG" alt="리스트" 
							onclick="location.href='/FridayTrip/Trip/EndList.do?page=${page}';" 
							style="cursor:pointer;" class="img1" />
						</c:if>
						
						<!-- 검색중 -->
						<c:if test="${!empty col}">
						<img src="/FridayTrip/Trip/images/004.JPG" alt="리스트" 
							onclick="location.href='/FridayTrip/Trip/EndList.do?col=${col}&word=${word}&${page}';" 
							style="cursor:pointer;" class="img1" />
						</c:if>
						<!-- 종료 -->
						
						<!-- 폼 네번째 -->
						<form action="/FridayTrip/Trip/EndWrite.do" method="POST" id="img02">
							<img src="/FridayTrip/Trip/images/001.JPG" alt="글쓰기" style="cursor: pointer"
								onclick="send();" class="img1" /> 
								<input type="hidden" name="name" value="${dto.name}" /> 
								<input type="hidden" name="memseq" value="${dto.seq}" />
								<input type="hidden" name="thread" value="${dto.thread}" />
								<input type="hidden" name="depth" value="${dto.depth}" />
								<input type="hidden" name="page" value="${page}" />
						</form>
		
						<img src="/FridayTrip/Trip/images/002.JPG" alt="수정하기" style="cursor: pointer"
							onclick="location.href='/FridayTrip/Trip/EndCheck.do?seq=${dto.seq}&page=${page}';"
							class="img1" /> 
						<img src="/FridayTrip/Trip/images/003.JPG" alt="삭제하기" style="cursor: pointer"
							onclick="location.href='/FridayTrip/Trip/EndDel.do?seq=${dto.seq}';"
							class="img1" />
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