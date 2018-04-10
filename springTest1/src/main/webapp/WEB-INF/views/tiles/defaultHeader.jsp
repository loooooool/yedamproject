<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>

 <button class="navbar-toggler mobile-sidebar-toggler d-lg-none mr-auto" type="button">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button">
      <span class="navbar-toggler-icon"></span>
    </button>

    <ul class="nav navbar-nav d-md-down-none">
      <li class="nav-item px-3">
        <a class="nav-link" href="#">Home</a>
      </li>
      <li class="nav-item px-3">
        <a class="nav-link" href="#">Users</a>
      </li>
      <li class="nav-item px-3">
        <a class="nav-link" href="#">Admin</a>
      </li>
    </ul>
   
   <c:if test="${empty sessionScope.member_id}"> <!-- sessionScope id가 없으면 -->
    <ul class="nav navbar-nav ml-auto">
      <li class="nav-item d-md-down-none">
        <a class="loginForm" href="loginForm">login<i class="icon-bell"></i><span class="badge badge-pill badge-danger">5</span></a>
      </li>
   </c:if>    
   
   <c:if test="${not empty sessionScope.member_id}"> <!-- sessionScopre.id가 있으면 -->
   	${sessionScope.name} 님 어서오세요!
      <li class="nav-item d-md-down-none">
        <a class="login" href="logout">logout<i class="icon-list"></i></a>
      </li>
   </c:if>
     
    </ul>
 