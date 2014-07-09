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
        
        <title>Diverso | Just another YIW Themes Demo Sites site</title>
        
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

<style type="text/css">
	  	#aaaaa { z-index: 10;}
	  	#menuname0, #menuname1, #menuname2, #menuname3, #menuname4, #menuname5, #menuname6, #menuname7, #menuname8{ font-size: 11px; font-style: 돋움; }
	  	#title01 { font-size: 12px; font-style: normal; font-family: 돋움; }
	  	#primary { margin-left:150px;  }
	  	#qq1, #qq2, #qq3, #qq4 {font-size: 12px; font-style: normal; font-family: 돋움;}
	  	#logoimg { position:absolute; left:200px; top:125px; z-index: 20; }
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
                         <c:if test="${!empty id}">   <li> | 
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
        
                <!-- START CONTENT -->
                <div id="content" class="layout-sidebar-right group">
                
                    <!-- SLOGAN --> 
                    <div id="slogan" class="inner"><br/>
                     <br/><br/>  <img src="/FridayTrip/Trip/images/qandaimg.png"/>
                    </div>         
                    <!-- END SLOGAN --> 
                
                    <!-- START PRIMARY -->
                    <div id="primary" class="hentry group wrapper-content" role="main">
                    
                        <div class="toggle">
                            <p class="tab-index tab-opened" id="qq1"><a href="#" title="Close">[예약취소] 예약을 취소하고 싶습니다.</a></p>
                            <div class="content-tab opened">
                                <div class="arrow">&nbsp;</div>
                                <p>
                                    인터넷상에서 예약취소나 수정은 불가능합니다. 예약취소나 여행자정보 변경을 원하시면 반드시 담당자에게 연락을 주셔야 합니다. 
모든 취소는 근무일(공휴일 및 토, 일요일 제외) 및 근무시간(18시 30분까지) 내에 취소요청을 해주셔야 가능합니다. 

또한 여행자의 여행계약 해제 요청이 있는 경우 여행약관에 의거 소정의 취소료비용이 발생할 수 있습니다. <br/>
<br/>
[여행약관] <br/>
제15조(여행출발 전 계약해제) <br/>
- 여행출발일 20일전까지 취소 요청시 - 여행요금의 10% 배상 <br/>
- 여행출발일 19~10일전까지 취소 요청시 - 여행요금의 15% 배상 <br/>
- 여행출발일 9~8일전까지 취소 요청시 - 여행요금의 20% 배상<br/> 
- 여행출발일 7~1일전까지 취소 요청시 - 여행요금의 30% 배상 <br/>
- 여행출발 당일 취소 통보시 - 여행요금의 50% 배상 <br/>
(※공정거래위원회 고시 제2011-10호 소비자분쟁해결기준에 의한 것으로 제9조,제15조의 변경사항은 2011년12월28일 여행상품예약자부터 적용) <br/>
<br/>

[특별약관] <br/>
- 일부 상품은 상품 구성의 특성상 특별약관이 부과됩니다. <br/>
- 여행고객의 해당 일정표의 취소료 규정을 확인하시기 바랍니다. <br/>
- 일반약관 제 5조(특약)에 의거하여 특별약관은 운영됩니다.<br/>
                                </p>
                            </div>
                        </div>
                        
                        <div class="toggle">
                            <p class="tab-index tab-closed" id="qq2"><a href="#" title="Close">[상품예약 및 결제] 여행상품 예약은 어떻게 하나요 ?</a></p>
                            <div class="content-tab closed">
                                <div class="arrow">&nbsp;</div>
                                <p>
                                   여행상품의 예약은 온라인상에서, 전화, 또는 e-mail을 통해 문의 및 예약하실수 있으며, 365일 24시간 언제든지 예약하실 수 있습니다. (단, 전화상담 가능시간 월~금 09:00 - 18:00 / 토 09:00 - 13:00 ) <br/>

예약후 24시간내에 고객께 전화나 메일로 여행 출발일로부터 종료일까지 예약의 전반적인 사항을 체크하여 처리해 드립니다. 온라인상 예약은 최소 여행 출발일 10일전에 하셔야 하며, 그외경우 담당자에게 문의후 예약 바랍니다. <br/>


단체여행(패키지상품)인 경우, 상품출발 최소인원(보통 10명)이 모집되지 않았을 때 출발하지 않는 상품도 있습니다. 이러한 경우는 담당자가 연락을 드립니다. <br/>
<br/>
[ 예약시 필요사항 ] <br/>
- 주민번호 / 여행일정(출발일) <br/>
- 예약자 연락처(전화, 핸드폰, 메일주소) 


                                </p>
                            </div>
                        </div>
                        
                        <div class="toggle">
                            <p class="tab-index tab-closed" id="qq3"><a href="#" title="Close">[여행상품]  남녀 비율이 안맞는 경우는 어떻게 되나요?</a></p>
                            <div class="content-tab closed">
                                <div class="arrow">&nbsp;</div>
                                <p>
                                당사 상품은 단체 여행이기 때문에 여행 신청 기간동안 최소 출발 인원(남녀 비율)이 맞지 않을 경우 다른 날로 상품을 변경 또는 해당 상품이 취소될 수도 있습니다. 이럴 경우는 담당 상담원이 미리 연락을 드려 날짜 변경을 도와드립니다.
                                
                                </p>
                            </div>
                        </div>
                        
                        <div class="toggle">
                            <p class="tab-index tab-closed" id="qq4"><a href="#" title="Close">[할인혜택] 여성 회원의 경우 할인 혜택이 따로 있나요?</a></p>
                            <div class="content-tab closed">
                                <div class="arrow">&nbsp;</div>
                                <p>
                                   여성 회원님의 경우 여행 상품 가격의 30% 할인 혜택을 받으실 수 있습니다. 또한 여성 회원님의 등급이 VIP 등급이신 경우 추가로 20% 할인 혜택이 주어져 총 50% 할인 혜택을 받으실 수 있습니다. 
                                </p>
                            </div>
                        </div>
                        
                    </div>
                    <!-- END CONTENT -->
                    
                   
                    
                </div>
                <!-- END CONTENT -->
        

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
                        <div class="widget-first widget widget_text">
                            <h3>COMPANY</h3>
                            <p>
                                Di'verso is a new WordPress all in one, clean & modern In in 
                                odio ut lectus posuere consequat in nec ipsum. Proin pretium 
                                ullamcorper lectus non feugiat. 
                            </p>
                        </div>            
                        <!-- END WIDGET -->
                                    
                        <!-- START WIDGET -->
                        <div class="widget widget_flickrRSS">
                            <h3>PHOTOSTREAMING</h3>
                            <a href="http://www.flickr.com/photos/sunny660201/6875279379/" title="DSC02227"><img src="http://farm8.staticflickr.com/7206/6875279379_c4a025d262_s.jpg" alt="DSC02227" /></a>
                            <a href="http://www.flickr.com/photos/54104175@N04/6875279427/" title="IMG_0825"><img src="http://farm8.staticflickr.com/7066/6875279427_63f7c56731_s.jpg" alt="IMG_0825" /></a>
                            <a href="http://www.flickr.com/photos/315521/6875279443/" title="DSC_0161"><img src="http://farm8.staticflickr.com/7203/6875279443_2f76d251d3_s.jpg" alt="DSC_0161" /></a>
                            <a href="http://www.flickr.com/photos/lwvtp/6875279463/" title="P1030647"><img src="http://farm8.staticflickr.com/7183/6875279463_0942d0fc57_s.jpg" alt="P1030647" /></a>
                            <a href="http://www.flickr.com/photos/71108778@N04/6875279477/" title="RIMG0093"><img src="http://farm8.staticflickr.com/7199/6875279477_872f15c182_s.jpg" alt="RIMG0093" /></a>
                            <a href="http://www.flickr.com/photos/shacho/6875279483/" title="IMG_0163"><img src="http://farm8.staticflickr.com/7180/6875279483_7cd6edf66f_s.jpg" alt="IMG_0163" /></a>
                        </div>              
                        <!-- END WIDGET -->
                                    
                        <!-- START WIDGET -->
                        <div class="widget recent-posts">
                            <h3>RECENT POSTS</h3>
                            <div class="last-news group">
                                <div class="box-post group">
                                    <div class="box-post-body group">
                                        <div class="news_title">
                                            <a href="#" title="A fresh and nice blog layout: do u like it?" class="title">A fresh and nice blog layout: do u like it?</a>
                                        </div>
                                        <p class="meta"><span class="date">December 13, 2011</span></p>
                                    </div>
                                </div>
                                <div class="box-post group">
                                    <div class="box-post-body group">
                                        <div class="news_title">
                                            <a href="#" title="50% off on our products for the month of August" class="title">50% off on our products for the month of August</a>
                                        </div>
                                        <p class="meta"><span class="date">December 7, 2011</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>     
                        <!-- END WIDGET -->
                                    
                        <!-- START WIDGET -->
                        <div class="widget-last widget widget_nav_menu">
                            <h3>MENU</h3>
                            <ul class="menu">
                                <li><a href="about.html">About Di&#8217;verso</a></li>
                                <li><a href="contact.html">Contact Di&#8217;verso</a></li>
                                <li><a href="shortcodes.html">Shortcodes</a></li>
                                <li><a href="blog.html">Blog</a></li>
                                <li><a href="http://www.yourinspirationweb.com/en">Your Inspiration Web</a></li>
                            </ul>
                        </div>    
                        <!-- END WIDGET -->
                                  
                    </div>
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