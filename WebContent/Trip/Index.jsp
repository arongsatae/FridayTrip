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

	//System.out.print(sql);
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
        <script type="text/javascript" src="js/jquery.quicksand.js"></script>  
        
        <!-- for portfolio slider -->
        <script type="text/javascript" src="js/jquery.jcarousel.min.js"></script> 
        
        <!-- for the contact page -->
        <script type="text/javascript" src="js/contact.js"></script>  
        
        <!-- SLIDER ELASTIC -->                                                               
        <link rel="stylesheet" id="slider-elastic-css" href="css/slider-elastic.css" type="text/css" media="all" />
        <script type="text/javascript" src="js/jquery.eislideshow.js"></script>
        
        <!-- SLIDER CYCLE -->                                                               
        <link rel="stylesheet" id="slider-cycle-css" href="css/slider-cycle.css" type="text/css" media="all" />
        <script type="text/javascript" src="js/jquery.slides.min.js"></script>
        
        <!-- SLIDER THUMBNAILS -->                                                               
        <link rel="stylesheet" id="slider-thumbnails-css" href="css/slider-thumbnails.css" type="text/css" media="all" />
        <script type="text/javascript" src="js/jquery.aw-showcase.js"></script>
        
        <!-- SLIDER FLASH -->                                                               
        <script type="text/javascript" src="js/swfobject.js"></script>      
        
        <!-- SLIDER ELEGANT -->                                                               
        <link rel="stylesheet" id="slider-elegant-css" href="css/slider-elegant.css" type="text/css" media="all" />
        
        <!-- SLIDER NIVO -->                                                               
        <link rel="stylesheet" id="slider-nivo-css" href="css/slider-nivo.css" type="text/css" media="all" />     
        
        <!-- CUSTOM JAVASCRIPT -->                           
        <script type="text/javascript" src="js/jquery.custom.js"></script>
        <!-- //js경로 끝 -->
        
        
        
        
        <link href="/FridayTrip/Trip/css2/flexy-menu.css" rel="stylesheet">
		<script type="text/javascript" src="/FridayTrip/Trip/js/flexy-menu.js"></script>
		<script type="text/javascript">$(document).ready(function(){$(".flexy-menu").flexymenu({speed: 400,type: "horizontal",align: "right"});});</script>
		<!--start slider -->
		<script src="/FridayTrip/Trip/js/responsiveslides.min.js"></script>
	 
	  
	  
	  
      <style type="text/css">
	  	#aaaaa { z-index: 10;}
	  	#menuname0, #menuname1, #menuname2, #menuname3, #menuname4, #menuname5, #menuname6, #menuname7, 		#menuname8{font-size: 11px; font-style: 돋움;}	
	  	#want1 { position:absolute; left:360px; top:30px; font-size: 12px;  width: 200px; margin:0px; }
	  	#want2 { position:absolute; left:250px; top:0px; font-size: 12px;  width: 200px; margin:0px; }
	  	#qsearch { position:absolute; left:180px; top:220px; }
	  	#client1, #client1say, #client2, #client2say, #client3, #client3say {font-size: 12px; color:#626262; line-height:120%;}	
	  	#logoimg { position:absolute; left:200px; top:125px; z-index: 20; }
	  	#ppsearch { position:absolute; left:210px; top:600px; z-index: 22; }
	  	#ppafter { position:absolute; left:210px; top:940px; z-index: 22; }
	  	div#so{


				 border: 0px solid gray;
				 margin-left: 200px;
				 margin-top: 200px;
				 width: 300px;
				 padding: 20px;
				 background-color: ghostwhite;
				 
				
				}
				
			
				  </style> 
				        
    </head>
    
    
    <body class="home image-sphere-style responsive">
    <img src="/FridayTrip/Trip/images/ppsearch.png" id="ppsearch"/>
     <img src="/FridayTrip/Trip/images/ppafter.png" id="ppafter"/>
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
                           <c:if test="${!empty id}"> <li> | 
      						<a href="/FridayTrip/Trip/TMemberLogout.do" >로그아웃</a>  
      						</c:if></li>
                             <c:if test="${empty id}"><a href ="/FridayTrip/Trip/tMemberCont.jsp"><li> |회원가입</a></li></c:if>
                            
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
					<li><a href="Survey.do" id="menuname7">설문조사참여</a></li>		
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
					<li><a href="QA.do" id="menuname5">자주묻는 질문</a></li>
									<li><a href="QA2.do" id="menuname6">1:1 질문</a>
								</ul>
							</li>
							<li><c:if test="${id == 'admin' }">
								<a href="#"> <span>Manage</span> <i class="icon3"></i>
							</a>
								<ul>
									<li><a href="Member.do" id="menuname5">회원관리</a></li>
									<li><a href="TripAdd.do" id="menuname6">여행상품추가</a></li>
								</ul></c:if>
							</li>
	
	<!-- 	<li>
				<a href="Admin.do">
					 <span>Admin</span>	
					 <i class="icon2"></i>
				</a></li>
							
		
			<li> -->
							<li style="border: 0px; width: 70px;">&nbsp;</li>
						</ul>
					</div>
				</div>
			</div>
	    <!-- BEGIN #slider -->                  
               <!-- START SLIDER -->
               <div id="slider" class="inner flash">
                    <div id="piecemaker"></div>
                </div>
                <script type="text/javascript">
                    var flashvars = {};
                    flashvars.cssSource = "piecemaker.css";
                    flashvars.xmlSource = "piecemaker.xml";
                    
                    var flash_params = {};
                    flash_params.play = "true";
                    flash_params.menu = "false";
                    flash_params.scale = "showall";
                    flash_params.wmode = "transparent";
                    flash_params.allowfullscreen = "true";
                    flash_params.allowscriptaccess = "always";
                    flash_params.allownetworking = "all";
                    
                    swfobject.embedSWF('piecemaker.swf', 'piecemaker', '920', '390', '10', null, flashvars, flash_params, null);
                    
                </script> 
                <!-- END #slider -->    
                                          
                <!-- HOME SECTIONS -->   
                <div class="home-sections">
                
                    <!-- SECTION #1 -->
                    <div class="section gradient s-1 group">
                        <div class="section-title for-not-mobile">
                           
                        </div>
                        <div class="section-content">
                            <h2 class="for-mobile">About</h2>
                           <div id="so">

<form method= "POST" action="/FridayTrip/Trip/testlist.jsp ">
<div id="want1">
Q) 내가 원하는 스타일?<br><br>
<input type=radio name="r1" value="passion" checked="checked">리드하는 스타일<br>
<input type=radio name="r1" value="dic" >지적인 스타일<br>
<input type=radio name="r1" value="friend" >자상한 스타일<br>
<input type=radio name="r1" value="predict" >센스있는 스타일<br>
<input type=radio name="r1" value="saint" >다정한 스타일<br>
<input type=radio name="r1" value="social" >친근한 스타일 <br>


<div id="want2">
Q) 내가 원하는 여행코스는?<br><br>
<input type=radio name="g1" value="1" checked="checked">낚시여행에서 찾기<br>
<input type=radio name="g1" value="4" >지역탐방에서 찾기 <br>
<input type=radio name="g1" value="3" >맛집여행에서 찾기<br>
<input type=radio name="g1" value="2" >등산여행에서 찾기<br>
<input type=radio name="g1" value="5" >자전거 여행에서 찾기<br>
</div>
<br>
<span id="mm"><input type=submit value=검색 id="qsearch" style="width:80px; height:30px "></span>

</form>
</div>
</div>
                        </div>
                        <div class="shadow"></div>
                    </div>               
                    <!-- END SECTION #1 -->
                    
                    <!-- SECTION #2 -->
<!--                     <div class="section gradient s-2 group">
                        <div class="section-title for-not-mobile">
                            <h2>Services</h2>
                        </div>
                        <div class="section-content">
                            <div class="tabs-container">
                                <ul class="tabs">
                                    <li>
                                        <h4><a href="#webdesign" title="Web Design">Web Design</a></h4>
                                    </li>
                                    <li>
                                        <h4><a href="#brand" title="Brand Identity">Brand Identity</a></h4>
                                    </li>
                                    <li>
                                        <h4><a href="#photo" title="Photography">Photography</a></h4>
                                    </li>
                                    <li>
                                        <h4><a href="#advertise" title="Advertising">Advertising</a></h4>
                                    </li>
                                    <li>
                                        <h4><a href="#copywrite" title="Copywriting">Copywriting</a></h4>
                                    </li>
                                    <li>
                                        <h4><a href="#marketing" title="Marketing">Marketing</a></h4>
                                    </li>
                                </ul>
                                <div class="border-box group">
                                
                                    <div id="webdesign" class="panel group">
                                        <img src="/FridayTrip/Trip/images/sections/web.png" alt="" class="alignright" />
                                        <h3>We do beautiful things</h3>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel dui ut 
                                            augue tempus condimentum., vestibulum eget quam. Aenean molestie viverra ante 
                                            at tincidunt. Etiam rhoncus elementum ultricies. ecenas volutpat seori ornare auctor.
                                        </p>
                                    </div>
                                    
                                    <div id="brand" class="panel group">
                                        <img src="/FridayTrip/Trip/images/sections/brand.png" alt="" class="alignleft" />
                                        <h3>Brand & Corporate Identity</h3>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel dui ut 
                                            augue tempus condimentum., vestibulum eget quam. Aenean molestie viverra ante 
                                            at tincidunt. Etiam rhoncus elementum ultricies. ecenas volutpat seori ornare auctor.
                                        </p>
                                    </div>
                                    
                                    <div id="photo" class="panel group">
                                        <img src="/FridayTrip/Trip/images/sections/foto.png" alt="" class="alignright" />
                                        <h3>Photobooks</h3>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel dui ut 
                                            augue tempus condimentum., vestibulum eget quam. Aenean molestie viverra ante at tincidunt.
                                        </p>
                                    </div>
                                    
                                    <div id="advertise" class="panel group">
                                        <img src="/FridayTrip/Trip/images/sections/adv.png" alt="" class="alignleft" />
                                        <h3>Advertising: Be Smart</h3>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel dui ut 
                                            augue tempus condimentum., vestibulum eget quam. Aenean molestie viverra ante 
                                            at tincidunt. Etiam rhoncus elementum ultricies. ecenas volutpat seori ornare auctor.
                                        </p>
                                    </div>
                                    
                                    <div id="copywrite" class="panel group">
                                        <img src="/FridayTrip/Trip/images/sections/copy.png" alt="" class="alignright" />
                                        <h3>Copywriting services</h3>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel dui ut 
                                            augue tempus condimentum., vestibulum eget quam. Aenean molestie viverra ante 
                                            at tincidunt. Etiam rhoncus elementum ultricies. ecenas volutpat seori ornare auctor.
                                        </p>
                                    </div>
                                    
                                    <div id="marketing" class="panel group">
                                        <img src="/FridayTrip/Trip/images/sections/marketing.png" alt="" class="alignleft" />
                                        <h3>Marketing Strategies</h3>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel dui ut 
                                            augue tempus condimentum., vestibulum eget quam. Aenean molestie viverra ante 
                                            at tincidunt. Etiam rhoncus elementum ultricies. ecenas volutpat seori ornare auctor.
                                        </p>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="shadow"></div>
                    </div>   -->            
                    <!-- END SECTION #2 -->
                    
                    <!-- SECTION #3 -->
                    <div class="section gradient s-3 group">
                        <div class="section-title for-not-mobile">
                           
                        </div>
                        <div class="section-content">
                            <h2 class="for-mobile">Testimonials</h2>
                            <h3>Our clients say</h3>
                            <div class="cites group">
                                <div class="text">
                                    <span id="client1say">좋았습니다. 그 때 지리산 둘레길 여행 밥도 맛있었고 버스기다리는 시간 지루한 느낌 나쁘지 않았어요 작은 뱀 보고두 흥분했던 기억도 나네요.  
이른 아침 숙소 자전거 빌려서 밀짚모자 쓰고 마을을 한 바퀴 도는 모습 두고두고 기억에 남아있어요. 
산길 힘차게 못올라가서 힘들어했지만  이야기도 나누고 웃고 마지막밤 흑돼지구이 파티하며 소주한잔씩 나누어 마신 그 시간이 그립네요
짝과의 여행은 저한테 큰 결심이었지만 후회하지 않을 만큼 최고의 선택이었지요!
</span>
                                </div>  <div class="text">
                               <span id="client2say">저번 자전거 여행 테마는 강원도였고 이번 자전거 여행 테마는 경상도 울릉도 독도 여행입니다.
대한민국 국토는 너무 아름다웠다는 걸 재 확인시켜줬네요. 특히 울릉도의 아름다움은 잊지 못할거 같습니다. 
구례에는 정말 유명한 사찰이 하나 있지요.  절벽에 사찰을 지은거 하며 구례 전체가 한눈에 보이는 명소이기도 합니다.
번 강원도 여행도 그랬지만 정말 아름다운 대한민국을 제대로 여행하고 왔네요.
울릉도 잊지못할거 같습니다. 저너무 아름다운 섬입니다.
결혼하면 신혼여행도 여기로 또 올까 생각하고 있습니다. 


</span>
                                </div>
                                <div class="text">
                                    <span id="client3say">사실 춘천닭갈비 골목에서 먹는 닭갈비와 서울에서 사먹는 체인점의 닭갈비 맛은 그렇게 차이나지 않았던 것 같습니다. 닭갈비의 본고정에서 닭갈비를 먹는다고 생각하며 함께 여행한 분들과
초입을 즐기는 마음으로 갔더니 즐거웠던거 같습니다. 이곳 저곳 에서 사진을 찍으면서
많은 추억을 만들고 힘들일 좋은일 속상한일 훌훌 털어버리며 마음이 뻥뚤린 여행인거같습니다
기회가 된다면 이분들과 또 여행을 가고싶군요</span>
                                </div>
                            </div>
                            <div class="border-line"></div>
                            <ul class="testimonials group">
                                <li class="active">
                                    <div class="sphere"><img width="78" height="78" src="/FridayTrip/Trip/images/testimonials/mergot-78x78.jpg" class="attachment-testimonial-thumb wp-post-image" alt="mergot" title="mergot" /></div>
                                    <div class="shadow-thumb"></div>
                                    <span id="client1">김정현 회원</span>
                                    
                                </li>
                                <li>
                                    <div class="sphere"><img width="78" height="78" src="/FridayTrip/Trip/images/testimonials/meis-78x78.jpg" class="attachment-testimonial-thumb wp-post-image" alt="meis" title="meis" /></div>
                                    <div class="shadow-thumb"></div>
                                     <span id="client2">김은서 회원</span>
                                    
                                </li>
                                <li>
                                    <div class="sphere"><img width="78" height="78" src="/FridayTrip/Trip/images/testimonials/mori-78x78.jpg" class="attachment-testimonial-thumb wp-post-image" alt="mori" title="mori" /></div>
                                    <div class="shadow-thumb"></div>
                                  	<span id="client3">성이민 회원</span>
                                  
                                </li>
                            </ul>
                        </div>
                        <div class="shadow"></div>
                    </div>  
                    
		<!-- 마지막 -->
		<%@include file="inc/bottom.jsp"%>


        
 

</body>
</html>