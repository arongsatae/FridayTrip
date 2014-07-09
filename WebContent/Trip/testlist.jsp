<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.DB.DBUtil"%>    
<%@page import="com.main.joinDTO"%>      
<%@page import="com.main.TMemberDAO"%> 
<%@page import="com.main.TMemberDTO"%>     
    
  <%
  
  
  
  request.setCharacterEncoding("UTF-8");
  
  String person = request.getParameter("r1");
  
  String g1 = request.getParameter("g1");
  
  String id = session.getAttribute("id").toString();
  
  
  Connection con = null;
  
  Statement stat = null;
  
  
  ResultSet rs = null;
  
  TMemberDTO dto = new TMemberDTO();
  
  
  
  try{
	  
	  
		con = DBUtil.connect();
		
		stat = con.createStatement();

		String sql = String.format("select * from tmember where id= '%s'", id);
	  
	  
		rs = stat.executeQuery(sql);

		//System.out.print(sql);
		//디버깅용
	  
		
		
		if(rs.next()){
			

			dto.setGender(rs.getString("gender"));
		
			
		}
		
	  
	  
}catch(Exception e){
	  
}










  
  
  
  
  
  
  
  String trv="";
  String rsname="";
  
  System.out.println(person);
  System.out.println(g1);  
  
  
  

  
  if(g1.equals("1")  ){
  
  trv ="낚시여행";
  
  }else if (g1.equals("2") ){
	  
  trv = "지역탐방";	  
	  
  }else if( g1.equals("3") ){
	  
  trv = "맛집여행";	  
	  
  }else if ( g1.equals("4")) {
	  
	  
   trv = "등산여행";	  
  }else if (g1.equals("5") ){
	  
   trv = "자전거여행";
	  
  }
  
  
  if(person.equals("passion")){
	  
	  
	  rsname="리드하는 스타일";
	  
  }else if(person.equals("social")){
	  
	  rsname="친근한 스타일";
	  
  }else if(person.equals("dic")){
	  
	  rsname="지적인 스타일";
	  
  }else if(person.equals("friend")){
	  
	  rsname="다정한 스타일";
	  
  }else if(person.equals("saint")){
	  
	  rsname="자상한 스타일";
	  
  }else if(person.equals("predict")){
	  
	  rsname="센스있는 스타일";
	  
  }
  
  
  ArrayList<joinDTO> list2 = new ArrayList<joinDTO>();
 
  try{
	  
  TMemberDAO dao = new TMemberDAO();	
  
  
  list2 = dao.list2(g1, person);
  
  
  System.out.println(list2.toString());
  //디버깅
 
  
  }catch(Exception e){
	  
	   
  }
    
  %>  
    
            
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>



<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<style type="text/css">


table{


border: 0px solid gray;
border- collapse: collapse;
text-align: center;
margin-top: 50px;
color: darkgreen;
margin-left: 335px;
font-size: 12px;

width: 590px;


}


table td{

font-family:"dotum" , verdana;
font-weight: bold;
border: gray 1px solid;
border- collapse: collapse;



}

td
{
border: 0px solid gray;
border- collapse: collapse;
width:  140px; 
height: 124px;
background-color: #FFE4E1;
opacity: 0.6;
}




th{
border- collapse: collapse;
height : 40px;
background-color: blue;
opacity: 0.3;
color: yellow;
}


span{

font-weight: bold;
 

}

span#cs{

      margin-left: 335px;  
      margin-top: 190px;
      
}



table td.center{


background-color: ghostwhite;

}

table td.center a:hover{


background-color: gainsboro;


}



input{

border: 0px solid ;

background-color: white;

color: blue;

}


div#kk{

margin-top: 140px;
margin-left: 140px;

}


span#op{

color: blue;


}

span#n1 {

margin-left: 560px;





}


span#n1:hover{
color: green;

}


tbody tr:hover {

  background: #FFD800;
  border: 1px solid #03476F;
  color: drakgray;
  
}






</style>


<script type="text/javascript">


function move1() {

location.href="/FridayTrip/Trip/Fish.do";

}


function move2() {

	location.href="/FridayTrip/Trip/LocalTrip.do";

}



function move3() {

	location.href="/FridayTrip/Trip/Food.do";

}



function move4() {

	location.href="/FridayTrip/Trip/Mt.do";

}



function move5() {

	location.href="/FridayTrip/Trip/Bike.do";

}




</script>


</head>

<body>

<div id ="kk">

<span id = "cs">회원님이 선택한 여행 테마는 <span id="op"><%= trv %></span>입니다.</span><br>
<span id = "cs">회원님이 선택한 스타일은 <span id="op"><%= rsname %></span>입니다.</span>
         
<table border="1" >

<tr>
<th>사진</th>
<th>이름</th>
<th>아이디</th>
<th>성별</th>
<th>이상형</th>
<th>여행지</th>
</tr>


<% if(list2.toString().equals("[]")){ %>

<tr>
<td colspan=6 > 원하는 이상형의 사람이 없습니다. </td>
</tr>

<%  }else { %>


<%   for ( int i=0; i < list2.size() ; i++ )  { %>

<%      if( !( dto.getGender().equals(list2.get(i).getGender())   )  ) {   %> 


<tr>
<td><img width="140" height="124" src="/FridayTrip/Trip/images/member/<%= list2.get(i).getId() %>.jpg" alt="member" /></td>
<td><%= list2.get(i).getName() %></td>
<td><%= list2.get(i).getId() %></td>
<td><%= list2.get(i).getGender() %> </td>
<td><%= list2.get(i).getBefore() %></td>
<td><%= list2.get(i).getPlace() %></td>
</tr>


                             <%  }  %>

                       

                 <% } %>


<%  } %>
</table>
<br>
<br>


<%  if( trv.equals("낚시여행")) { %>

<span id="n1" ><input type="button" value="<%= trv %>으로 가기" onclick="move1();"      ></span>


<%  }else if (trv.equals("지역탐방")) {  %>


<span id="n1"><input type="button" value="<%= trv %>으로 가기" onclick="move2();"      ></span>

<%  }else if (trv.equals("맛집여행")) { %>

<span id="n1"><input type="button" value="<%= trv %>으로 가기" onclick="move3();"      ></span>


<%  }else if (trv.equals("등산여행")) { %>

<span id="n1"><input type="button" value="<%= trv %>으로 가기" onclick="move4();"      ></span>


<%   }else if (trv.equals("자전거여행")) {  %>

<span id="n1"><input type="button" value="<%= trv %>으로 가기" onclick="move5();"      ></span>


<%  } %>

</div>


</body>

</html>