<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    
            String id = session.getAttribute("id").toString();
    
            String coin = session.getAttribute("coin").toString();
    
          
            
            
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
	  	
	  </style> 
<style type="text/css">


body{
height: 500px;

}

h4{

margin-left: 360px;
margin-top: 120px;

}

span{

margin-left: 40px;
font-size: 16px;
color: black;

}


input{

margin-left: 45px;

}



div#scc{

background-color: WhiteSmoke;
width: 400px;
padding: 10px;
margin-left: 300px;
margin-top: 40px;
}

</style>


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
								  String id1=(String)session.getAttribute("id");
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
                            <c:if test="${empty id}"><li> | <a href ="/FridayTrip/Trip/tMemberCont.jsp">회원가입</a></li></c:if>
                            
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
                <!-- END HEADER -->        


<div style="height: 500px" >


<form method="POST" action="/FridayTrip/Trip/Refund.do"  >

<br>
<br>
<h4> <%= id %>님의 환불 요청을 진행합니다.</h4> 

<div id="scc">

<span>현재 코인 잔액은 <%= coin%></span> 입니다. <br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;환불할 코인 금액을 입력해주세요  <br>

<input type="text" name="refund" id="refund" >

<%   if( Integer.parseInt(coin) == 0  )  {%>

<script type="text/javascript">

alert("환불 대상이 아닙니다.");

location.href="/FridayTrip/Trip/Mypage.jsp";

</script>

<%  }else{ %>

<input type="submit"  value="환불하기"   >

<% } %>

</div>

</form>

</div>



  <div id="twitter-slider" class="group">
                    <div class="tweets-list"></div>
                    <div class="bird"></div>
                </div>
                <!-- END TWITTER -->   
                           
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