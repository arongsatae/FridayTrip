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
 <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width" />
        
        <title>금요일에 만나요~♡</title>
        
        <link rel="stylesheet" type="text/css" media="all" href="/FridayTrip/Trip/style.css" />
        <link rel="stylesheet" type="text/css" media="screen and (max-width: 960px)" href="/FridayTrip/Trip/css/lessthen800.css" />
        <link rel="stylesheet" type="text/css" media="screen and (max-width: 600px)" href="/FridayTrip/Trip/css/lessthen600.css" />
        <link rel="stylesheet" type="text/css" media="screen and (max-width: 480px)" href="/FridayTrip/Trip/css/lessthen480.css" />
                                   
        <!-- CUSTOM STYLE -->                                                                        
        <link rel="stylesheet" type="text/css" media="all" href="/FridayTrip/Trip/css/custom-style.css" />
        
        <!-- [favicon] begin -->
        <link rel="shortcut icon" type="image/x-icon" href="/FridayTrip/Trip/favicon.ico" />
        <link rel="icon" type="image/x-icon" href="/FridayTrip/Trip/favicon.ico" />
        <!-- [favicon] end -->  
        
        <!-- MAIN FONT STYLE -->  
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz%3A400&amp;subset=latin%2Ccyrillic%2Cgreek" type="text/css" media="all" />      
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Droid+Sans" type="text/css" media="all" />    
	    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald" type="text/css" media="all" />
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz%3A200%2C400" type="text/css" media="all" />
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed%3A300%7CPlayfair+Display%3A400italic" type="text/css" media="all" />
        <!-- END MAIN FONT STYLE -->  
        
        <link rel="stylesheet" id="prettyPhoto-css" href="/FridayTrip/Trip/css/prettyPhoto.css" type="text/css" media="all" />
        <link rel="stylesheet" id="jquery-tipsy-css" href="/FridayTrip/Trip/css/tipsy.css" type="text/css" media="all" />
        
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.js"></script>
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.prettyPhoto.js"></script>
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.tipsy.js"></script>
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.tweetable.js"></script>        
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.nivo.slider.pack.js"></script>  
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.flexslider.min.js"></script>
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.cycle.min.js"></script>  
        
        <!-- for accordion slider in staff page -->
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.hrzAccordion.js"></script>  
        
        <!-- for filterable effect in gallery and portfolio filterable page -->
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.quicksand.js"></script>  
        
        <!-- for portfolio slider -->
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.jcarousel.min.js"></script> 
        
        <!-- for the contact page -->
        <script type="text/javascript" src="/FridayTrip/Trip/js/contact.js"></script>  
        
        <!-- SLIDER ELASTIC -->                                                               
        <link rel="stylesheet" id="slider-elastic-css" href="/FridayTrip/Trip/css/slider-elastic.css" type="text/css" media="all" />
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.eislideshow.js"></script>
        
        <!-- SLIDER CYCLE -->                                                               
        <link rel="stylesheet" id="slider-cycle-css" href="/FridayTrip/Trip/css/slider-cycle.css" type="text/css" media="all" />
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.slides.min.js"></script>
        
        <!-- SLIDER THUMBNAILS -->                                                               
        <link rel="stylesheet" id="slider-thumbnails-css" href="/FridayTrip/Trip/css/slider-thumbnails.css" type="text/css" media="all" />
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.aw-showcase.js"></script>
        
        <!-- SLIDER FLASH -->                                                               
        <script type="text/javascript" src="/FridayTrip/Trip/js/swfobject.js"></script>      
        
        <!-- SLIDER ELEGANT -->                                                               
        <link rel="stylesheet" id="slider-elegant-css" href="/FridayTrip/Trip/css/slider-elegant.css" type="text/css" media="all" />
        
        <!-- SLIDER NIVO -->                                                               
        <link rel="stylesheet" id="slider-nivo-css" href="/FridayTrip/Trip/css/slider-nivo.css" type="text/css" media="all" />     
        
        <!-- CUSTOM JAVASCRIPT -->                           
        <script type="text/javascript" src="/FridayTrip/Trip/js/jquery.custom.js"></script>
        
        
        <link href="/FridayTrip/Trip/css2/flexy-menu.css" rel="stylesheet">
<script type="text/javascript" src="/FridayTrip/Trip/js/flexy-menu.js"></script>
<script type="text/javascript">$(document).ready(function(){$(".flexy-menu").flexymenu({speed: 400,type: "horizontal",align: "right"});});</script>


<script type="text/javascript">
/*  충북 */
function overmapcb() {  document.images["mapcb00"].src="/FridayTrip/Trip/images/mapcb.png"; 
document.images["mapcbjh"].src="/FridayTrip/Trip/images/mapcbjh.png";}
function downmapcb() {  document.images["mapcb00"].src="/FridayTrip/Trip/images/mapcb00.png";
document.images["mapcbjh"].src="";}

/* 수도권 */
function overmapkk() {  document.images["mapkk00"].src="/FridayTrip/Trip/images/mapkk.png"; document.images["mapkkjh"].src="/FridayTrip/Trip/images/mapkkjh.png";}
function downmapkk() {  document.images["mapkk00"].src="/FridayTrip/Trip/images/mapkk00.png"; 
document.images["mapkkjh"].src="";}

/* 강원 */
function overmapkw() {  document.images["mapkw00"].src="/FridayTrip/Trip/images/mapkw.png"; 
document.images["mapkwjh"].src="/FridayTrip/Trip/images/mapkwjh.png";}
function downmapkw() {  document.images["mapkw00"].src="/FridayTrip/Trip/images/mapkw00.png";
document.images["mapkwjh"].src="";}

/* 충남 */
function overmapcn() {  document.images["mapcn00"].src="/FridayTrip/Trip/images/mapcn.png"; 
document.images["mapcnjh"].src="/FridayTrip/Trip/images/mapcnjh.png"}
function downmapcn() {  document.images["mapcn00"].src="/FridayTrip/Trip/images/mapcn00.png";
document.images["mapcnjh"].src="";}


/* 경북 */
function overmapkb() {  document.images["mapkb00"].src="/FridayTrip/Trip/images/mapkb.png"; document.images["mapkbjh"].src="/FridayTrip/Trip/images/mapkbjh.png";}
function downmapkb() {  document.images["mapkb00"].src="/FridayTrip/Trip/images/mapkb00.png"; 
document.images["mapkbjh"].src="";}


/* 전북*/
function overmapjb() {  document.images["mapjb00"].src="/FridayTrip/Trip/images/mapjb.png"; 
document.images["mapjbjh"].src="/FridayTrip/Trip/images/mapjbjh.png";}
function downmapjb() {  document.images["mapjb00"].src="/FridayTrip/Trip/images/mapjb00.png";
document.images["mapjbjh"].src="";}


/* 경남 */
function overmapkn() {  document.images["mapkn00"].src="/FridayTrip/Trip/images/mapkn.png"; 
document.images["mapknjh"].src="/FridayTrip/Trip/images/mapknjh.png";}
function downmapkn() {  document.images["mapkn00"].src="/FridayTrip/Trip/images/mapkn00.png";
document.images["mapknjh"].src=""; }


/* 전남 */
function overmapjn() {  document.images["mapjn00"].src="/FridayTrip/Trip/images/mapjn.png";
document.images["mapjnjh"].src="/FridayTrip/Trip/images/mapjnjh.png";}
function downmapjn() {  document.images["mapjn00"].src="/FridayTrip/Trip/images/mapjn00.png";
document.images["mapjnjh"].src="";}

/* 제주 */
function overmapjj() {  document.images["mapjj00"].src="/FridayTrip/Trip/images/mapjj.png"; 
document.images["mapjjjh"].src="/FridayTrip/Trip/images/mapjjjh.png";}
function downmapjj() {  document.images["mapjj00"].src="/FridayTrip/Trip/images/mapjj00.png"; 
document.images["mapjjjh"].src="";}

</script>



<style type="text/css">
	  	#aaaaa { z-index: 10;}
	  	#menuname0, #menuname1, #menuname2, #menuname3, #menuname4, #menuname5, #menuname6, #menuname7, #menuname8{ font-size: 11px; font-style: 돋움; }
	  	#title01 { font-size: 12px; font-style: normal; font-family: 돋움; }
	  	#primary { margin-left:150px;  }
	  	#qq1, #qq2, #qq3, #qq4 {font-size: 12px; font-style: normal; font-family: 돋움;}
	  	
	  	#mapbox {height: 900px;}
	  	#mapknjh{margin:0px; padding: 0px; position: absolute; top: 280px; left:650px; z-index: 22;}
	  	#mapcb00 {margin:0px; padding: 0px; position: absolute; top: 445px; left:422px; z-index: 10; } 		
	  	#mapkk00 {margin:0px; padding: 0px; position: absolute; top: 300px; left:300px; }
	  	#mapkw00 {margin:0px; padding: 0px;  position: absolute; top:245px; left:400px;}
	  	#mapcn00 {margin:0px; padding: 0px; position: absolute; top: 480px; left:290px; } 		
 		#mapkb00 {margin:0px; padding: 0px; position: absolute; top: 460px; left:500px; }  
		#mapjb00 {margin:0px; padding: 0px; position: absolute; top: 600px; left:315px; } 		
		#mapjn00 {margin:0px; padding: 0px; position: absolute; top: 690px; left:310px; }
		#mapkn00 {margin:0px; padding: 0px; position: absolute; top: 630px; left:475px; }  
		#mapjj00 {margin:0px; padding: 0px; position: absolute; top: 860px; left:220px; }
		#mapkkjh{margin:0px; padding: 0px; position: absolute; top: 230px; left:420px; z-index: 11;}
		#mapkwjh{margin:0px; padding: 0px; position: absolute; top: 230px; left:600px; z-index: 12;}
		#mapkbjh{margin:0px; padding: 0px; position: absolute; top: 200px; left:600px; z-index: 13;}
		#mapcbjh{margin:0px; padding: 0px; position: absolute; top: 300px; left:460px; z-index: 14;}
		#mapcnjh{margin:0px; padding: 0px; position: absolute; top: 300px; left:380px; z-index: 14;}
		#mapjbjh{margin:0px; padding: 0px; position: absolute; top: 360px; left:440px; z-index: 14;}
		#mapjnjh{margin:0px; padding: 0px; position: absolute; top: 320px; left:440px; z-index: 14;}
		#mapjjjh{margin:0px; padding: 0px; position: absolute; top: 480px; left:300px; z-index: 14;}
		#logoimg { position:absolute; left:200px; top:105px; z-index: 20; }
		#maptitle { position:absolute; left:200px; top:230px; z-index: 20; }
	  </style> 
    </head>
    
    <body class="home image-sphere-style responsive">
     <a href="Index.do"><img src="/FridayTrip/Trip/images/logo2.png" id="logoimg" /></a>
   
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
                          <c:if test="${!empty id}">  <li> | 
      						<a href="/FridayTrip/Trip/TMemberLogout.do" >로그아웃</a>  
      						</li></c:if>
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
			<img src="/FridayTrip/Trip/images/logo.png" /></a><!-- 기존로고 투명처리 -->
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
                <!-- END HEADER -->        
        <div id="mapbox">
          <img src="/FridayTrip/Trip/images/maptitle.png"  id="lmaptitle"/>
                       <!-- 지도 시작  -->
                <img src="/FridayTrip/Trip/images/mapkk00.png" id="mapkk00" onmouseover="overmapkk();" onmouseout="downmapkk();" /><img src="" id="mapkkjh" onmouseout="downmapkk();" /><!-- 수도권 -->
                
                 <img src="/FridayTrip/Trip/images/mapkw00.png" id="mapkw00" onmouseover="overmapkw();" onmouseout="downmapkw();" /> <img src="" id="mapkwjh" onmouseout="downmapkw();" /><!-- 강원도 --> 
                                 
                  <img src="/FridayTrip/Trip/images/mapcb00.png" id="mapcb00" onmouseover="overmapcb();" onmouseout="downmapcb();" /> <img src="" id="mapcbjh" onmouseout="downmapcb();"/><!-- 충북-->
                  
                  <img src="/FridayTrip/Trip/images/mapcn00.png" id="mapcn00" onmouseover="overmapcn();" onmouseout="downmapcn();" />  <img src="" id="mapcnjh" onmouseout="downmapcn();"/> <!-- 충남 -->
                   <img src="/FridayTrip/Trip/images/mapkb00.png" id="mapkb00" onmouseover="overmapkb();" onmouseout="downmapkb();" /> <img src="" id="mapkbjh" onmouseout="downmapkb();"/><!-- 경북 -->
				 <img src="/FridayTrip/Trip/images/mapjb00.png" id="mapjb00" onmouseover="overmapjb();" onmouseout="downmapjb();" /> <img src="" id="mapjbjh" onmouseout="downmapjb();"/> <!-- 전북 -->
                  <img src="/FridayTrip/Trip/images/mapjn00.png" id="mapjn00" onmouseover="overmapjn();" onmouseout="downmapjn();" /> <img src="" id="mapjnjh" onmouseout="downmapjn();"/><!-- 전남 -->
                 <img src="/FridayTrip/Trip/images/mapkn00.png" id="mapkn00" onmouseover="overmapkn();" onmouseout="downmapkn();" /> <img src="" id="mapknjh" onmouseout="downmapkn();"/><!-- 경남 -->
                 <img src="/FridayTrip/Trip/images/mapjj00.png" id="mapjj00" onmouseover="overmapjj();" onmouseout="downmapjj();" /><img src="" id="mapjjjh" onmouseout="downmapjj();"/><!-- 제주도 -->
                              
                  
</div>
                <!-- START TWITTER -->
                <div id="twitter-slider" class="group">
                    <div class="tweets-list"></div>
                    <div class="bird"></div>
                </div>
                <!-- END TWITTER -->   
                
        
                
                

                
                
                <!-- START FOOTER -->
                <div id="footer" class="group columns-4"><!-- here you can change the number of columns -->
                    <div class="inner footer-main">
                        
                        <!-- START WIDGET -->
                       
                        </div>    
                        <!-- END WIDGET -->
                                  
                   
                </div>
                <!-- END FOOTER -->
                           
                <!-- START COPYRIGHT -->
                <div id="copyright" class="group two-columns">
                    <div class="inner group">
                        <p class="left">Copyright <a href="#"><strong>Diverso</strong></a> 2010 - Powered by <a href="http://www.yourinspirationweb.com/en"><strong>Your Inspiration Web</strong></a></p>
                        <p class="right">
                            <a href="#" class="socials facebook" title="Facebook">facebook</a>
                            <a href="#" class="socials rss" title="Rss">rss</a>
                            <a href="#" class="socials flickr" title="Flickr">flickr</a>
                            <a href="#" class="socials youtube" title="Youtube">youtube</a>
                            <a href="#" class="socials twitter" title="Twitter">twitter</a>
                            <a href="#" class="socials linkedin" title="Linkedin">linkedin</a>
                            <a href="#" class="socials mail" title="Mail">mail</a>
                            <a href="#" class="socials skype" title="Skype">skype</a>
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