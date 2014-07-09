<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <title>장소추가</title>
    </head>
    <body>
       <form method="post" action="/FridayTrip/PlaceMtAddOk.do">
          <table>
          <tr>
              <td>지역명:</td>
              <td><input type="text" name="name" id="name" /></td>
          </tr>
          </table>
          
          <input type="submit" value="등록하기" />
       </form>
    </body>
</html> 