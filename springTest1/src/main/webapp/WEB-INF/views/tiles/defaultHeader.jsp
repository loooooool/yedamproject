<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>


<button class="navbar-toggler sidebar-toggler d-md-down-none" 
	type="button">
	<span class="navbar-toggler-icon"></span>
</button>



<c:if test="${empty sessionScope.memberVO}">
	<!-- sessionScope id가 없으면 -->
	<ul class="nav navbar-nav ml-auto"></ul>
	<li class="nav-item d-md-down-none"><a class="loginForm"
		href="loginForm">login<i class="icon-bell"></i><span
			class="badge badge-pill badge-danger">5</span></a></li>
</c:if>
<c:if test="${not empty sessionScope.memberVO}">
	<!-- sessionScope id가 있으면 -->
	<div style="align:right; padding:200px;" class="nav-item d-md-down-none">
		${sessionScope.memberVO.name} 님 어서오세요! <a class="login" href="logout">&nbsp;&nbsp;LOGOUT</a>
	</div>
</c:if>



   
   <c:if test="${empty sessionScope.memberVO}"> <!-- sessionScope id가 없으면 -->
    <ul class="nav navbar-nav ml-auto">
      <li class="nav-item d-md-down-none">
        <a class="loginForm" href="loginForm">login<i class="icon-bell"></i><span class="badge badge-pill badge-danger">5</span></a>
      </li>
    </ul>
   </c:if>    
   
   <c:if test="${not empty sessionScope.memberVO}"> <!-- sessionScope id가 있으면 -->
   	${sessionScope.memberVO.name} 님 어서오세요!
   	 <ul class="nav navbar-nav ml-auto">
      <li class="nav-item d-md-down-none">
        <a class="login" href="logout">logout<i class="icon-list"></i></a>
      </li>
     </ul>
   </c:if>
     
 
>>>>>>> branch 'master' of https://github.com/loooooool/yedamproject.git
