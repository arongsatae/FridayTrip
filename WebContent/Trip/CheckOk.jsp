<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>금요일에 만나요~♡</title>
<style type="text/css">
	#111 { display: none; }
</style>

<script type="text/javascript">
	
	function init() {		
		<c:if test = "${sum == '1'}">
		alert("확인 완료 !!");
		location.href="/FridayTrip/Trip/Edit.do?seq=" + ${seq};
		</c:if>
		
		<c:if test = "${sum == '0'}">
		alert("암호 틀림 !!");
		history.back();
		</c:if>
	}
</script>

</head>
<body onload="init()">
	
			
</html>