<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style type="text/css">

div#so{


 border: 0px solid gray;
 margin-left: 200px;
 margin-top: 200px;
 width: 300px;
 padding: 20px;
 background-color: ghostwhite;
 

}


div#mm{

 margin-left: 230px;

}


</style>

</head>


<body>



<div id="so">


<form method= "POST" action="/FridayTrip/Trip/testlist.jsp ">

내가 원하는 스타일?<br><br>

<input type=radio name="r1" value="passion" checked="checked">리드하는 스타일<br>
<input type=radio name="r1" value="dic" >지적인 스타일<br>
<input type=radio name="r1" value="friend" >자상한 스타일<br>
<input type=radio name="r1" value="predict" >센스있는 스타일<br>
<input type=radio name="r1" value="saint" >다정한 스타일<br>
<input type=radio name="r1" value="social" >친근한 스타일 <br>

<br><br>

내가 원하는 여행코스는?<br><br>

<input type=radio name="g1" value="1" checked="checked">낚시여행에서 찾기<br>
<input type=radio name="g1" value="4" >지역탐방에서 찾기 <br>
<input type=radio name="g1" value="3" >맛집여행에서 찾기<br>
<input type=radio name="g1" value="2" >등산여행에서 찾기<br>
<input type=radio name="g1" value="5" >자전거 여행에서 찾기<br>


<br>

<span id="mm"><input type=submit value=검색 style="width:60px; height:30px "></span>

</form>

</div>

</body>

</html>