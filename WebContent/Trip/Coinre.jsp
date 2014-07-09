<!-- 코인 사용내역 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.DB.DBUtil"%>    
<%@page import="com.main.TMemberDTO"%>      
<%@page import="com.main.tUsedcoinDTO"%>      
<%@page import="com.main.tAddcoinDTO"%>         
<%@page import="com.main.TMemberDAO"%>                      
    
<%


String id1=(String)session.getAttribute("id");
String seq="";

System.out.println(id1);


Connection con = null;

Statement stat = null;

ResultSet rs = null;



TMemberDTO dto = new TMemberDTO();
tUsedcoinDTO dto2 = new tUsedcoinDTO();
tAddcoinDTO dto3  = new tAddcoinDTO();



ArrayList<tAddcoinDTO> list = new ArrayList<tAddcoinDTO>();
ArrayList<tUsedcoinDTO> list1 = new ArrayList<tUsedcoinDTO>();


try {
	
	con = DBUtil.connect();
	
	stat = con.createStatement();

	String sql = String.format("select * from tmember where id= '%s'", id1);
	
	rs = stat.executeQuery(sql);

	System.out.print(sql);
	//디버깅용

	if(rs.next()){
			
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
		
	if(dto.getAfter()== null ){		
		dto.setAfter("");	
	}
	
	//코인사용기록, 코인충전기록의 db를 가져오기 위한 회원번호를 session에 담는다.	
	seq= dto.getSeq();
	session.setAttribute("seq", seq);

	
	 TMemberDAO dao = new TMemberDAO();	 
	 //list메서드를 호출하기 위한 dao객체 생성  
	 list1 = dao.list1(seq);
	 //코인사용기록 테이블을 출력하기 위한 용도   
	 list =  dao.list(seq);
     //코인충전기록 테이블을 출력하기 위한 용도
    
     
     System.out.println(list);
     //디버깅
   
     
	String coin=dto.getCoin();
	//마이페이지에 보여질 현재 코인 잔액
	session.setAttribute("coin", coin);
	
	
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
	  	#tblbox { width: 500px;  text-align: center; margin: 5px auto; margin-left: 270px; font-size: 13px; margin-top: 30px; }
	  	#tblbox th { font-size: 12px;   }	  	
	  	#tblbox td { border:1px solid #ededed; } 
		#tblbox tr td:first-child  {width: 200px; text-align: center; }
		#tblbox tr td:nth-child(2)  {width: 100px; text-align: center;  }
		#tblbox tr td:nth-child(3)  {width: 200px; text-align: center; }
		#cc {font-size: 13px; color:#4f4f4f; font-weight: bold; margin-left: 610px; margin-top: 10px; margin-bottom: 0px;}
		#coinuse2 { margin:0px; margin-top: 80px; margin-left: 100px; }
		#coinusebt { margin:0px; margin-top: -20px; margin-left: 600px; }
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
                           <c:if test="${!empty id}"> <li> | 
      						<a href="/FridayTrip/Trip/TMemberLogout.do" >로그아웃</a>  
      					</li>	</c:if>
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
				<img src="/FridayTrip/Trip/images/coinuse2.png" id="coinuse2" />
       					<table id="tblbox">
        					
        					<tr>
        						<td>날짜</td>        						
        						<td>사용 코인</td>
        						<td>사용 내역</td>
        				        					</tr>
        					
        					<%  if ( list.toString().equals("[]") )  { %>
        					<tr>
        					<td colspan="4">
        					             사용 내역이 없습니다.
        					    </td>        
        			</tr>
        					            
        					<%  }else{    %>
        					     
        					           					    
        			    
        					 <% for(int i=0; i < list1.size() ; i++) { %>
        					  
        					    <%   if( i == 100 ) break; %>
        					    
        					    
        					<tr>
        					
     						
        						<td><%= list1.get(i).getRegdate().substring(0, 4) %> 년 <%= list1.get(i).getRegdate().substring(5, 7) %> 월 <%= list1.get(i).getRegdate().substring(8, 10) %> 일</td>
        						<td> <%= list1.get(i).getCoin() %> Coin</td>
        						<td>
        					   <% if(list1.get(i).getTravname().equals("1")) { %>
        					
        					   여행 종류 :&nbsp;&nbsp; 낚시 여행  <br>
        					
        					   <% }else if(list1.get(i).getTravname().equals("2"))   {  %>
        					
        					   여행 종류 :&nbsp;&nbsp; 지역 여행  <br>
        					
        					   <% }else if(list1.get(i).getTravname().equals("3"))   {  %>        					
        					
        					   여행 종류 :&nbsp;&nbsp; 맛집 여행 <br>        					
        					
        					   <% }else if(list1.get(i).getTravname().equals("4"))   {  %>        					        					
        					
        					   여행 종류 :&nbsp;&nbsp; 등산 여행  <br>        					        					
        					
        					   <% }else if(list1.get(i).getTravname().equals("5"))   {  %>        					        					        					
        					
        					   여행 종류 :&nbsp;&nbsp; 자전거 여행  <br>        					        					        					
        					
        					   <%  } %>
        					
        					        					
        					<%   }   %>        					
        					
        				<% } %>	
        					       </td>
        						
        					</tr>	
        			
        					</table>
        						<p id="cc">현재 남은 코인: <%= dto.getCoin() %> Coin</p> <br>
        					<input type="button" value="코인 충전내역 보러가기" id="coinusebt" onclick="location.href='/FridayTrip/Trip/Coin.jsp'"/><br /><br /><br /><br />
        					<br /><br /><br /><br />
        					
        					
        					
        					
        				
        				
        				
        		<!-- START TWITTER -->
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