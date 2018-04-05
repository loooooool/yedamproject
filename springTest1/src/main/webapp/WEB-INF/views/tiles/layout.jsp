<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="CoreUI - Open Source Bootstrap Admin Template">
  <meta name="author" content="Łukasz Holeczek">
  <meta name="keyword" content="Bootstrap,Admin,Template,Open,Source,AngularJS,Angular,Angular2,Angular 2,Angular4,Angular 4,jQuery,CSS,HTML,RWD,Dashboard,React,React.js,Vue,Vue.js">
  <link rel="shortcut icon" href="resources/img/favicon.png">

  <!-- Bootstrap and necessary plugins -->
  <script src="scripts/jquery-3.3.1.min.js"></script>
  <script src="scripts/popper.min.js"></script>
  <script src="scripts/bootstrap.js"></script>
  <script src="scripts/pace.min.js"></script>

  <!-- Plugins and scripts required by all views -->
  <script src="scripts/charts.js"></script>

  <!-- CoreUI main scripts -->
  <script src="scripts/app.js"></script>

  <title>예담 학원 관리 시스템</title>

  <!-- Icons -->
  <link href="resources/css/flag-icon.min.css" rel="stylesheet">
  <link href="resources/css/fontawesome.css" rel="stylesheet">
  <link href="resources/css/simple-line-icons.css" rel="stylesheet">

  <!-- Main styles for this application -->
  <link href="resources/css/style.css" rel="stylesheet">
</head>

<!-- BODY options, add following classes to body to change options

// Header options
1. '.header-fixed'					- Fixed Header

// Brand options
1. '.brand-minimized'       - Minimized brand (Only symbol)

// Sidebar options
1. '.sidebar-fixed'					- Fixed Sidebar
2. '.sidebar-hidden'				- Hidden Sidebar
3. '.sidebar-off-canvas'		- Off Canvas Sidebar
4. '.sidebar-minimized'			- Minimized Sidebar (Only icons)
5. '.sidebar-compact'			  - Compact Sidebar

// Aside options
1. '.aside-menu-fixed'			- Fixed Aside Menu
2. '.aside-menu-hidden'			- Hidden Aside Menu
3. '.aside-menu-off-canvas'	- Off Canvas Aside Menu

// Breadcrumb options
1. '.breadcrumb-fixed'			- Fixed Breadcrumb

// Footer options
1. '.footer-fixed'					- Fixed footer

-->

<body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">

<!-- ----------------------------------------헤더 ---------------------------------------------------->
  <header class="app-header navbar">
   <tiles:insertAttribute name="header" />

  </header>
<!-- ---------------------------------------사이드바-------------------------------------------- -->
  <div class="app-body">
    <div class="sidebar">
     <tiles:insertAttribute name="menu" />
    </div>

    <!-- Main content -->
    <main class="main">

<!--       Breadcrumb
      <ol class="breadcrumb">
        <li class="breadcrumb-item">Home</li>
        <li class="breadcrumb-item"><a href="#">Admin</a></li>
        <li class="breadcrumb-item active">Dashboard</li>

        Breadcrumb Menu
        <li class="breadcrumb-menu d-md-down-none">
          <div class="btn-group" role="group" aria-label="Button group">
            <a class="btn" href="#"><i class="icon-speech"></i></a>
            <a class="btn" href="./"><i class="icon-graph"></i> &nbsp;Dashboard</a>
            <a class="btn" href="#"><i class="icon-settings"></i> &nbsp;Settings</a>
          </div>
        </li>
      </ol>
 -->
      <div class="container-fluid">
        <div id="ui-view"></div>
      </div>
      <!-- /.conainer-fluid -->
  	<tiles:insertAttribute name="content" />
	</main>
  </div>
  
  
  
    
  <footer class="app-footer">
  <tiles:insertAttribute name="footer" />
  </footer>



</body>
</html>