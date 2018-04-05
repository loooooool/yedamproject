<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과정 목록</title>
    <link rel="stylesheet" type="text/css" href="./resources/datatable/datatables.min.css"/>
 	<script type="text/javascript" src="./resources/datatable/datatables.min.js"></script>
	

<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>

</head>
<body>
<h4>과정 목록</h4>
<p>
<form action="getClassList">
<table id="example" class="table table-striped table-bordered" style="width:100%">
  <thead>
    <tr>
      <th scope="col">No</th>
      <th scope="col">과정명</th>
      <th scope="col">강의실</th>
      <th scope="col">시간표</th>
      <th scope="col">총수업시간</th>
      <th scope="col">코드</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${classList }" var="cl">
    <tr>
      <th scope="row">${cl.cl_no}</th>
      <a href="/updateClass/${cl.className }"><td>${cl.className}</a></td>
      <td>${cl.address}</td>
      <td>${cl.timeTable}</td>
      <td>${cl.totalTime}</td>
       <td>${cl.class_cd}</td>
    </tr>
   </c:forEach>
  </tbody>
</table>
<input type="button" class="btn btn-default" onclick="location.href='insertClass'" value="등록"/>
</form>
</body>
</html>