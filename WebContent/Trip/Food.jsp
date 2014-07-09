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
        <link rel="stylesheet" type="text/css" media="all" href="/FridayTrip/Trip/style.css" />
        <link rel="stylesheet" type="text/css" media="screen and (max-width: 960px)" href="/FridayTrip/Trip/css/lessthen800.css" />
        <link rel="stylesheet" type="text/css" media="screen and (max-width: 600px)" href="/FridayTrip/Trip/css/lessthen600.css" />
        <link rel="stylesheet" type="text/css" media="screen and (max-width: 480px)" href="/FridayTrip/Trip/css/lessthen480.css" />
                                   
        <!-- CUSTOM STYLE -->                                                                        
        <link rel="stylesheet" type="text/css" media="all" href="/FridayTrip/Trip/css/custom-style.css" />
        
        <!-- [favicon] begin -->
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
        <link rel="icon" type="image/x-icon" href="favicon.ico" />
        <!-- [favicon] end -->  
        
        <!-- MAIN FONT STYLE -->  
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz%3A400&amp;subset=latin%2Ccyrillic%2Cgreek" type="/FridayTrip/Trip/text/css" media="all" />      
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
	  #logoimg { position:absolute; left:200px; top:125px; z-index: 20; }
	  </style> 
        
        <!-- 스타일 -->
        <style type="text/css">
        	h2{ padding: 20px; padding-top: 40px;}
        	.boxList{ 
        		width: 400px; 
        		height: 400px; 
        		border: 1px solid gray;
        		margin: 20px auto;
        		margin-top: 5px;
        		margin-left: 50px;
        	}
        	#boxList1{ float: left;}
        	#boxList2{ float: left;}
        	#boxList3{ float: left;}
        	#boxList4{ float: left;}
        	#boxList5{ float: left;}
        	#boxList6{ float: left;}
        	#imgList1{ width: 380px; height: 300px; border: 1px solid gray; margin: 10px auto; }
        	#imgList2{ width: 380px; height: 300px; border: 1px solid gray; margin: 10px auto; }
        	#imgList3{ width: 380px; height: 300px; border: 1px solid gray; margin: 10px auto; }
        	#imgList4{ width: 380px; height: 300px; border: 1px solid gray; margin: 10px auto; }
        	#imgList5{ width: 380px; height: 300px; border: 1px solid gray; margin: 10px auto; }
        	#imgList6{ width: 380px; height: 300px; border: 1px solid gray; margin: 10px auto; }    	
             	.name{ 
        		color: black; 
        		padding-left: 10px;
        		margin-top: 0px; 
        		font-size: 15px; 
        		font-weight: bold;
        		font-family: 돋움;
        	}
        	.price{
        		padding-left: 10px;
        		color: red;
        		font-size: 20px;
        		font-family: 돋움;
        		font-weight: bold;
        	}
        	.coin{
        		font-family: 돋움;
        		font-weight: bold;
        	}
        	.subcontent{
        		font-size: 10px;
        		padding-left: 10px;
        		font-family: 돋움;
        	}
        </style>
        <!-- 자바스크립트 -->
        <script type="text/javascript">
        function mouseover1(){
    		$("#boxList1").css("border","1px solid skyblue");
    	}
    	function mouseout1(){
    		$("#boxList1").css("border", "1px solid gray");
    	}
    	function mouseover2(){
    		$("#boxList2").css("border","1px solid skyblue");
    	}
    	function mouseout2(){
    		$("#boxList2").css("border", "1px solid gray");
    	}
    	function mouseover3(){
    		$("#boxList3").css("border","1px solid skyblue");
    	}
    	function mouseout3(){
    		$("#boxList3").css("border", "1px solid gray");
    	}
    	function mouseover4(){
    		$("#boxList4").css("border","1px solid skyblue");
    	}
    	function mouseout4(){
    		$("#boxList4").css("border", "1px solid gray");
    	}
    	function mouseover5(){
    		$("#boxList5").css("border","1px solid skyblue");
    	}
    	function mouseout5(){
    		$("#boxList5").css("border", "1px solid gray");
    	}
    	function mouseover6(){
    		$("#boxList6").css("border","1px solid skyblue");
    	}
    	function mouseout6(){
    		$("#boxList6").css("border", "1px solid gray");
    	}
        </script>
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
                            <c:if test="${!empty id}"> 
      						<li> |<a href="/FridayTrip/Trip/TMemberLogout.do" >로그아웃</a>  
      						</li></c:if>
                           <c:if test="${empty id}"> <li> | <a href ="/FridayTrip/Trip/tMemberCont.jsp">회원가입</a></li></c:if>
                            
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
        
                <!-- START SLIDER -->
                 <div class="slider-wrapper theme-default">
                    <div class="ribbon"></div>
                    <div id="slider" class="nivo" style="height:350px">
                        <img src="/FridayTrip/Trip/images/trip/foodsl01.jpg" width="960" height="350" alt="" /> 
                        <img src="/FridayTrip/Trip/images/trip/foodsl02.jpg" width="960" height="350" alt="" /> 
                        <img src="/FridayTrip/Trip/images/trip/foodsl03.jpg" width="960" height="350" alt="" /> 
                    </div>
                </div>
                <script type="text/javascript"> 
                    // edit here
                    var 	slider_nivo_fx = 'random',
                            slider_nivo_speed = 500,
                            slider_nivo_timeout = 5000,
                            slider_nivo_directionNav = true,
                            slider_nivo_directionNavHide = true,
                            slider_nivo_controlNav = false; 
                    // end editing    
                    
                    $('#slider.nivo').nivoSlider({
                        effect           : slider_nivo_fx,
                        animSpeed        : slider_nivo_speed,
                        pauseTime        : slider_nivo_timeout,
                        directionNav     : slider_nivo_directionNav,
                        directionNavHide : slider_nivo_directionNavHide,
                        controlNav       : slider_nivo_controlNav
                    });
                </script>
                <!-- END #slider -->     
                
                <!-- HOME SECTIONS -->
                <form action="" method="post"></form>   
                <div class="home-sections">
					<h2>맛집 여행</h2>
					<c:set var="i" value="1" />
					<c:forEach items="${list}" var="dto">
					<div id="boxList${i}" class="boxList" onclick="location.href='/FridayTrip/Trip/Detail.do?seq=${dto.seq}&table=tFood&app=tAppFood';" style="cursor:pointer;" onmouseover="mouseover${i}();" onmouseout="mouseout${i}();"><!-- ?seq=${dto.seq} -->		
					<div id="imgList1" ><img src="/FridayTrip/Trip/images/trip/${dto.img}" /></div>
						<span class="name">${dto.name}</span><br/>
						<strong class="price">가격</strong><span class="coin">　${dto.coin} 원</span><br />
						<span class="subcontent">${dto.subcontent}</span>
					</div>
					<c:set var="i" value="${i+1}" />
					</c:forEach>
                </div>
                
        

                <!-- START TWITTER -->
                <div id="twitter-slider" class="group">
                    <div class="tweets-list"></div>
                    <div class="bird"></div>
                </div>
                <!-- END TWITTER -->   
                           
                <!-- START COPYRIGHT -->
                <div id="copyright" class="group two-columns">
                    <div class="inner group">
                        <p class="left">Copyright <a href="#"><strong>Diverso</strong></a> 2010 - Powered by <a href="http://www.yithemes.com" title="Free HTML Template"><strong>Your Inspiration Themes</strong></a></p>
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
        
    <!-- START GOOGLE ANALYTICS -->
        <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement( o ),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

          ga('create', 'UA-36516261-31', 'yithemes.com');
          ga('send', 'pageview');

        </script>
        <!-- END GOOGLE ANALYTICS -->
</body>
</html>