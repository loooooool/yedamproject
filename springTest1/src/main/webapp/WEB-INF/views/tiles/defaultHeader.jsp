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
	<div class="nav-item d-md-down-none" style="padding-right:120px;"><a class="loginForm"
		href="loginForm">●로그인</a></div>
</c:if>
<c:if test="${not empty sessionScope.memberVO}">
	<!-- sessionScope id가 있으면 -->
	<div style="align:right; padding:100px;" class="nav-item d-md-down-none">
		${sessionScope.memberVO.name} 님 어서오세요! <a class="login" href="logout">&nbsp;&nbsp;로그아웃</a>
	</div>
</c:if>

 
