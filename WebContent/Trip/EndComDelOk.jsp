<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>금요일에 만나요~♡</title>
<script type="text/javascript">
	function init() {
		<c:if test = "${check == '1'}">
		alert("삭제 완료 !!");
		location.href="/FridayTrip/EndView.do?seq="+ ${seq} + "&page=" + ${page};
	</c:if>
	
	<c:if test = "${check == '0'}">
		alert("암호가 틀렸습니다 !!");
		history.back();
	</c:if>
		
	}
</script>

</head>
<body onload="init()">

</html>