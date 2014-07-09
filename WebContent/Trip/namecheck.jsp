<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.DB.DBUtil"%>
<%@page import="com.main.TMemberDTO"%>        
    
<%
    
    request.setCharacterEncoding("UTF-8");
         
    String name = request.getParameter("name");
    

    System.out.println(name);
    
	Connection con = null;
	Statement stat = null;
	ResultSet rs = null;
    String id1="";
	TMemberDTO dto = new TMemberDTO();
	
	try {
		con = DBUtil.connect();
		stat = con.createStatement();

		String sql = String.format("select * from tmember where name= '%s'  ", name );
		
		rs = stat.executeQuery(sql);

		System.out.print(sql);
		//디버깅용
	
		if(rs.next()){
			
		  id1 = rs.getString("id");
		
		}
		
	} catch (Exception e) {
		System.out.println(e.toString());
	}
	
%>
    
    


     
    
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" type="text/css" media="all" href="style.css" />
        <link rel="stylesheet" type="text/css" media="screen and (max-width: 960px)" href="css/lessthen800.css" />
        <link rel="stylesheet" type="text/css" media="screen and (max-width: 600px)" href="css/lessthen600.css" />
        <link rel="stylesheet" type="text/css" media="screen and (max-width: 480px)" href="css/lessthen480.css" />
                                   
        <!-- CUSTOM STYLE -->                                                                        
        <link rel="stylesheet" type="text/css" media="all" href="css/custom-style.css" />
        
        <!-- [favicon] begin -->
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
        <link rel="icon" type="image/x-icon" href="favicon.ico" />
        <!-- [favicon] end -->  
        
        <!-- MAIN FONT STYLE -->  
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz%3A400&amp;subset=latin%2Ccyrillic%2Cgreek" type="text/css" media="all" />      
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Droid+Sans" type="text/css" media="all" />      
	    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald" type="text/css" media="all" />
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz%3A200%2C400" type="text/css" media="all" />
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed%3A300%7CPlayfair+Display%3A400italic" type="text/css" media="all" />
        <!-- END MAIN FONT STYLE -->  
        
        <link rel="stylesheet" id="prettyPhoto-css" href="css/prettyPhoto.css" type="text/css" media="all" />
        <link rel="stylesheet" id="jquery-tipsy-css" href="css/tipsy.css" type="text/css" media="all" />
        
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/jquery.prettyPhoto.js"></script>
        <script type="text/javascript" src="js/jquery.tipsy.js"></script>
        <script type="text/javascript" src="js/jquery.tweetable.js"></script>        
        <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>  
        <script type="text/javascript" src="js/jquery.flexslider.min.js"></script>
        <script type="text/javascript" src="js/jquery.cycle.min.js"></script>  
        
        <!-- for accordion slider in staff page -->
        <script type="text/javascript" src="js/jquery.hrzAccordion.js"></script>  
        
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


<style type="text/css">


body{
height: 600px;

}


h2{

margin-left: 20px;

}



div#sc{


height: 300px;
padding-left: 400px;
padding-top: 80px;
}


</style>



<script type="text/javascript">


function back() {

location.href="/FridayTrip/Trip/login.jsp";

}




</script>



</head>


<body class="home image-sphere-style responsive" >



  <!-- START SHADOW WRAPPER -->
        <div class="shadowBg group">
            
            <!-- START WRAPPER -->
            <div class="wrapper group">
                
                <!-- START TOPBAR -->
                <div id="topbar">
                    <div class="inner">
                        <ul class="topbar_links">
                            <li>
                            
                            
                                      <%
                              String id=(String)session.getAttribute("id");
                              if(id==null){//로그인된 사용자가 아니면 로그인 페이지로 링크
                                 %>
                               <a href="/FridayTrip/Trip/login.jsp">로그인</a>  
                                
                                <%
                               }else{//로그인된 사용자이면 로그아웃 페이지 링크
                                 %>
                                  <a href="/FridayTrip/Trip/logout.jsp">로그아웃</a> 
  
                                <%
                                 }
                                %>
                                                       
                                
                            </li>
                            <li> | <a href ="/FridayTrip/Trip/Mypage.jsp">Mypage</a></li>
                            <li> | <a href ="/FridayTrip/Trip/tMemberCont.jsp">회원가입</a>
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
                        <a href="index.html" title="Diverso"> 
                        <img src="images/logo.png" alt="Logo Diverso" />
                        </a>              
                    </div>
                    <!-- END LOGO -->   
                    
                    <!-- START NAV -->
                    <div id="nav" class="group">
                        <ul class="level-1 white">
                            <li class="home">
                                <a href="index.html">Main</a>
                              <!--   <ul class="sub-menu">
                                    <li><a href="home-version-2.html">HOME VERSION 2</a></li>
                                    <li><a href="home-version-3.html">HOME VERSION 3</a></li>
                                    <li><a href="home-version-4.html">HOME VERSION 4</a></li>
                                    <li><a href="home-version-5.html">HOME VERSION 5</a></li>
                                    <li><a href="home-version-6.html">HOME VERSION 6</a></li>
                                </ul> -->
                            </li>
                            <li class="folder">
                                <a href="#">여행</a>
                                <ul class="sub-menu">
                                    <li><a href="faq.html">자전거</a></li>
                                    <li><a href="testimonials.html">지역</a></li>
                                    <li><a href="staff.html">맛집</a></li>
                                    <li><a href="gallery.html">등산</a></li>
                                    <li><a href="archives.html">낚시</a></li>
                                </ul>
                            </li>
                            <li class="bookmark">
                                <a href="#">지역</a>
                              <!--   <ul class="sub-menu">
                                    <li><a href="portfolio-3-columns.html">3 Columns</a></li>
                                    <li><a href="portfolio-with-slider.html">With Slider</a></li>
                                    <li><a href="portfolio-big-image.html">Big Image</a></li>
                                    <li><a href="portfolio-full-description.html">Full Description</a></li>
                                    <li><a href="portfolio-filterable.html">Filterable</a></li>
                                    
                                </ul> -->
                            </li>
                            <li class="burst">
                                <a href="#">커뮤니티</a>
                                <ul class="sub-menu">
                                    <li><a href="shortcode-nivo-slider.html">Nivo Slider</a></li>
                                    <li><a href="shortcode-media-widgets.html">Media &#038; Widgets</a></li>
                                    <li><a href="shortcode-alert-box-buttons.html">Alert box &#038; buttons</a></li>
                                   <!--  <li><a href="shortcode-icon-sections.html">Icon Sections</a></li>
                                    <li><a href="shortcode-table-box-prices.html">Table &#038; Box prices</a></li>
                                    <li><a href="shortcode-typography.html">Typography</a></li>
                                    <li><a href="shortcode-mix-various.html">Mix &#038; Various</a></li> -->
                                </ul>
                            </li>
                            <li class="calendar">
                                <a href="blog.html">Q&A</a>
                            <!--     <ul class="sub-menu">
                                    <li><a href="blog-small-image.html">Small Image</a></li>
                                    <li><a href="blog-big-image.html">Big image</a></li>
                                </ul> -->
                            </li>
                            <li class="email"><a href="contact.html">관리자메뉴</a></li>
                        </ul>
                    </div>
                    <!-- END NAV -->   
                </div>
                <!-- END HEADER -->        

<div id="sc">

<h2>아이디 찾기</h2>


<%  if(id1== "" || id1== null ) { %>


<script type="text/javascript">

alert("잘못된 이름 입니다. ");
location.href="/FridayTrip/Trip/idfind.jsp";


</script>


<%   }else{         %>

회원님의 아이디는 <%=  id1 %> 입니다. <br>

<span id="op" style="margin-left: 30px" ><input type="button" value="로그인 페이지로 가기" onclick = "back();" ></span>


<%  } %>


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