<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style type="text/css">


#loginbox {margin:10px auto; text-align: center; border: 10px solid #ededed; width: 500px; height: 300px; margin-top: 200px;}
#idsearch {position: absolute; top:370px; left:600px;}
#pwsearch {position: absolute; top:372px; left:672px;}
#loginbt {position: absolute; top:342px; left:693px;}
#logoimg { position:absolute; left:395px; top:134px; z-index: 20; }
#qqqq { position:absolute; left:570px; top:400px; z-index: 20; }	
#pjoin{ position:absolute; left:590px; top:430px; z-index: 20; }	
</style>

</head>

<body>
 <a href="Index.do"><img src="/FridayTrip/Trip/images/logo2.png" id="logoimg" /></a>
<img src="/FridayTrip/Trip/images/qqqq.png" id="qqqq" />
 <a href="/FridayTrip/Trip/tMemberCont.jsp"><img src="/FridayTrip/Trip/images/pjoin.png" id="pjoin" /></a>
<div id="loginbox">

<h2>로그인</h2>


<form method="post" action="loginCheck.jsp">

<img src="images/idimg.PNG" /><input type="text" name="id"><br/>
<img src="images/pwimg.PNG" /><input type="password" name="pw"><br/>
   <input type="submit" value="로그인" id="loginbt">

    <br />
  <a href="/FridayTrip/Trip/idfind.jsp">  <img src="/FridayTrip/Trip/images/idsearch.PNG" id="idsearch"/></a> <!-- 아이디찾기 -->
      
  <a href="/FridayTrip/Trip/pwfind.jsp">  <img src="/FridayTrip/Trip/images/pwsearch.PNG" id="pwsearch"/></a> <!-- 비밀번호찾기 -->  
</form>




</div>




</body>
</html>