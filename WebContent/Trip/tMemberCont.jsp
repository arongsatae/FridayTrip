<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	  	#logoimg { position:absolute; left:280px; top:125px; z-index: 20; }
	  	</style>
	 



<style type="text/css">


table {

margin-top: 160px;
width: 400px;

}


span{

 font-weight: bold;

}


</style>







<script type="text/javascript">


function chk(){
	
 var req = document.form.req.checked;
 var num = 0;
 
 if(req == true){
	 
	 location.href="/FridayTrip/Trip/tMember.jsp";
  num = 1;
 }
 
 if(num==1){
  document.form.submit();
 }else{
  alert("개인정보 약관에 동의하셔야 합니다.");
 }
 
}



function nochk(){
	
 alert("동의하지 않으면 가입하실 수 없습니다");
 
 return false;
 
 
}

</script>











</head>

<body class="home image-sphere-style responsive" >
 <a href="Index.do"><img src="/FridayTrip/Trip/images/logo2.png" id="logoimg" /></a>

    <!-- START SHADOW WRAPPER -->
        <div class="shadowBg group">
            
            <!-- START WRAPPER -->
            <div class="wrapper group">
                
                <!-- START TOPBAR -->
                <div id="topbar">
                    <div class="inner">
                        <ul class="topbar_links">
                            <li>
                                    	 <a href="/FridayTrip/Trip/login.jsp">로그인</a>  						      	     
                            </li>
                            <li> | <a href ="/FridayTrip/Trip/Mypage.jsp">Mypage</a></li>
                        
                      <li> |     <a href ="/FridayTrip/Trip/tMemberCont.jsp">회원가입</a></li>
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
					<li><a href="QA.do" id="menuname5">자주묻는 질문</a></li>
					<li><a href="QA2.do" id="menuname6">1:1 질문</a>				
				</ul>				
			</li>
			<li style="border:0px;width:70px;">&nbsp;</li>
		</ul>
	</div></div></div>
                <!-- END HEADER -->        





<form action="tMember.jsp" name="form" method="post">


 <table >

  <tr>
  
   <td width="100%" height="50%" align="center">
   <p align="left">
   <span style="padding-left: 0px" >약관동의</span>
   </p>
   
   <br>
   
   <textarea rows="20" cols="150">가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소
   한의 개인정보를 필수항목으로 수집하고 있습니다.
회원가입
- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
만14세 미만 아동 회원가입 
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
단체아이디 회원가입 
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정
보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다. 
넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 
있습니다. 
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국
인 정보
다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다. 
- 신용카드 결제시 : 카드사명, 카드번호 등
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호
나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다. 
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공 
- 생성정보 수집 툴을 통한 수집
   </textarea>
   
   <br>
   
   
   <input type="checkbox" name="req"> 개인정보 수집 및 이용에 동의합니다. 
   </td>
  </tr>
  
  <tr>
    <td align="center" valign="top" >
       <input type="button" value="동의" onclick="chk()"/>&nbsp;&nbsp;&nbsp;
       <input type="button" value="동의하지 않습니다" onclick="nochk()"/>
    
   </td>
  </tr>
  
  
  
 </table>
 
 
 
</form>





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