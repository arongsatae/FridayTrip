<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.DB.DBUtil"%>
    
    
<%

        
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    System.out.println(id);
    
	Connection con = null;
	Statement stat = null;
	ResultSet rs = null;

	String sql = "";
	try {
		con = DBUtil.connect();
		stat = con.createStatement();
	
		if(id.equals("admin")){
			sql = String.format("select * from tAdmin where id= 'admin' and pw = '%s'", pw);
		}else{
			sql = String.format("select * from tmember where id= '%s' and pw = '%s'", id, pw);
		}
		
		
		
		
		rs = stat.executeQuery(sql);

		System.out.print(sql);
		//디버깅용
	
		
		
		boolean ismember =false;
		
		if(rs.next()){
			
			ismember = true;
			
		}
		
		if(ismember){
			
			
			session.setMaxInactiveInterval(60*30);
			//로그인하기 , 세션에 로그인 정보(id)담기
			
			session.setAttribute("id", id);
			
			
			response.sendRedirect("Index.do");
			
		}else{
		
			response.sendRedirect("alert.jsp");
	
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

</head>



<body>





</body>



</html>