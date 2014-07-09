<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.DB.DBUtil"%>
    
    
    

<%

        

	Connection con = null;
	Statement stat = null;
	ResultSet rs = null;

	
	try {
		con = DBUtil.connect();
		stat = con.createStatement();

		String sql = "select * from tCharacter where rownum = 1 order by seq desc";
		
		rs = stat.executeQuery(sql);

		System.out.print(sql);
		//디버깅용
	} catch (Exception e) {
		System.out.println(e.toString());
	}
	
%>

    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>차트 결과</title>


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>



<script type="text/javascript">
		
$(function () {

	$('#container').highcharts({
	            
	    chart: {
	        polar: true,
	        type: 'line'
	    },
	    
	    title: {
	        text: '  회원님의 성격유형검사 결과입니다.',
	        x: -25
	    },
	    
	    pane: {
	    	size: '85%'
	    },
	    
	    xAxis: {
	        categories: ['지도자형 ', '사교적인 유형', '성인 군자형', '예언자형', 
	                '친선도모형','백과사전형'],
	        tickmarkPlacement: 'on',
	        lineWidth: 0
	    },
	        
	    yAxis: {
	        gridLineInterpolation: 'polygon',
	        lineWidth: 0,
	        min: 0
	        
	    },
	    
	 
	    
	    legend: {
	        align: 'right',
	        verticalAlign: 'top',
	        y: 70,
	        layout: 'vertical'
	    },
	    
	    	<% while (rs.next()) { %>
	    series: [{
	        name: '성향정도',
	        data: [ <%= rs.getString("passion") %> , <%= rs.getString("social") %>,  <%= rs.getString("saint") %>,  <%= rs.getString("predict") %>,  <%= rs.getString("friend") %>,  <%= rs.getString("dic") %>],	        
	        pointPlacement: 'on'
	    }
	    
	    ]
	        <% } %>
	
	});
});



//10초뒤에 메인으로 이동하는 메서드
var n = 10;
function init() {
	setInterval(function() {
		n--;
		
		if (n == 0) {
			location.href = "../Trip/Index.do";
		}
		
		document.all.txt1.value =  n;
	}, 1000);
}


function go() {
	
	location.href = "/FridayTrip/Trip/Index.jsp";
	
}




</script>




<style type="text/css">

#container{

  margin: 10px;

}


input{

margin-left : 40%;
text-align: right;

}


INPUT, TEXTAREA 
{ 
background-color: lightgray; 
border: lightgray 1px solid;
margin-left: 350px;
margin-top: 30px;

} 



div#sc{

margin-top: 120px;
background-color: lightgray;
width: 1000px;
margin-left: 160px;
height: 500px;
padding: 100px;
}

body{


background-color: dimgray;

}



</style>




</head>


<body onload="init();">


<script src="js/highcharts.js"></script>
<script src="js/highcharts-more.js"></script>
<script src="js/exporting.js"></script>

<div id="sc" >

<div id="container" style="min-width: 400px; max-width: 600px; height: 400px; margin: 0 auto"></div>

<input type="text" name="txt1" id="txt1" value="10" size="1" /> 초 뒤에 메인으로 이동합니다.

<input type="button" name="btn1" id="btn1" value="바로 메인으로 가기" onclick="go();"  /><br>

</div>

</body>



</html>