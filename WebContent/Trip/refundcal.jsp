<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.DB.DBUtil"%>   
    
    
 <%

   
 
        String id = session.getAttribute("id").toString();
        String coin = session.getAttribute("coin").toString();
       
        
        
 
 
 
        
	Connection con = null;
	Statement stat = null;
	ResultSet rs = null;

	
	try {
		con = DBUtil.connect();
		stat = con.createStatement();

		String sql = String.format("update tmember set coin = '%d' where id='%s' ", coin, id);  
		
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
<title>Insert title here</title>
</head>
<body>











</body>
</html>