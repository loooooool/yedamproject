<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head><title>Insert title here</title></head>
<body>
<form action="./insertTimeTableView">
<select name="sub_no" id="sub_no">
	<c:forEach items="${classList}" var="list">
		<option value="${list.cl_no}">${list.class_name}</option>
	</c:forEach>

</select>
<input type="submit" value="시간표등록"/>
</form>
</body>
</html>