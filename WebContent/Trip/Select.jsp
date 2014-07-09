<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코인 충전하기</title>
<script type="text/javascript">
	
</script>
<style type="text/css">
	#boxList{
		border: 1px solid black;
		width: 306px;
		height: 190px;
		margin: 0px auto;		
	}
	.boxList{
		float: left; 
		width: 80px; 
		height: 70px; 
		border: 1px solid black;
		margin: 10px;	
	}
	#boxList1{background-image: url("/FridayTrip/Trip/images/coin/card.jpg");}
	#boxList2{background-image: url("/FridayTrip/Trip/images/coin/mobile.jpg");}
	#boxList3{background-image: url("/FridayTrip/Trip/images/coin/phone.jpg");}
	#boxList4{background-image: url("/FridayTrip/Trip/images/coin/ars.jpg");}
	#boxList5{background-image: url("/FridayTrip/Trip/images/coin/moon.jpg");}
	#boxList6{background-image: url("/FridayTrip/Trip/images/coin/happy.jpg");}
	
	#tblList{
		border: 1px solid gray;
		border-collapse: collapse;
		margin: 10px auto;
		width: 306px;		
	}
	#tblList tr, td { border: 1px solid gray; height: 30px;}
	#tblList tr th:FIRST-CHILD { 
		width: 100px; 
		text-align: center; 
		background-color: #e0e0e0; }
	#tblList tr td:LAST-CHILD { width: 200px; text-align: left; padding-left: 10px;}
</style>
<script type="text/javascript">
	function confirm1(){
		if(confirm("결제를 하시겠습니까?")){
			opener.document.location.href="/FridayTrip/Trip/CoinAddOk.do";
			self.close();
			
		}
	}
	function confirm2(){
		if(confirm("결제를 하시겠습니까?")){
			
		}
	}
	function confirm3(){
		if(confirm("결제를 하시겠습니까?")){
			
		}
	}
	function confirm4(){
		if(confirm("결제를 하시겠습니까?")){
			
		}
	}
	function confirm5(){
		if(confirm("결제를 하시겠습니까?")){
		
		}
	}
	function confirm6(){
		if(confirm("결제를 하시겠습니까?")){
			
		}
	}
</script>
</head>
<body>
	<h3>코인 충전하기</h3>
	<div id=boxList>
		<div id="boxList1" class="boxList" onclick="confirm1();" style="cursor: pointer;"></div>
		<div id="boxList2" class="boxList" onclick="confirm2();" style="cursor: pointer;"></div>
		<div id="boxList3" class="boxList" onclick="confirm3();" style="cursor: pointer;"></div>
		<div id="boxList4" class="boxList" onclick="confirm4();" style="cursor: pointer;"></div>
		<div id="boxList5" class="boxList" onclick="confirm5();" style="cursor: pointer;"></div>
		<div id="boxList6" class="boxList" onclick="confirm6();" style="cursor: pointer;"></div>	
	</div>
	<table id="tblList">
		<tr>
			<th>아이디</th>
			<td>${id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<th>충전금액</th>
			<td>${rbs} 코인</td>
		</tr>
	</table>
</body>
</html>