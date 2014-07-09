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
		alert("글쓰기 완료 !!");
		var form = document.forms[0];
		form.submit();
	}
</script>

</head>
<body onload="init()">
	<form action="/FridayTrip/Trip/FreeList.do?page=${page}"></form>
</html>