<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>Insert title here</title>
<script>
</script>
</head>
<body>
<c:forEach items="${sugtList}" var="sugt">
	${sugt.s_no} 
	<a href="getSugt?s_no=${sugt.s_no}">${sugt.title}</a> 
	${sugt.content}
	${sugt.s_date}
	<br>
</c:forEach>
</body>
</html>