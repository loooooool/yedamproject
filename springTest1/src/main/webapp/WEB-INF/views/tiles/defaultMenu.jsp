<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <nav class="sidebar-nav">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href=""><i class="icon-speedometer"></i> 홈으로 <span class="badge badge-primary">NEW</span></a>
          </li>

          <li class="nav-title">
            	예담
          </li>
          <li class="nav-item">
            <a href="getNoticeList" class="nav-link"><i class="icon-drop"></i> 공지사항</a>
          </li>
          <li class="nav-item">
            <a href="typography.html" class="nav-link"><i class="icon-pencil"></i> 예담 수업</a>
          </li>
           <li class="nav-item">
            <a href="typography.html" class="nav-link"><i class="icon-pencil"></i> 예담 달력</a>
          </li>
          <!-- -회원 -->
          <li class="nav-title">
            ~회원님
          </li>
         
          <li class="nav-item nav-dropdown">
            <a class="nav-link nav-dropdown-toggle" href="#"><i class="icon-puzzle"></i> 마이페이지</a>
            
            <ul class="nav-dropdown-items">
              <li class="nav-item">
                <a class="nav-link" href="mypage"><i class="icon-puzzle"></i>회원정보수정</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="base/cards.html"><i class="icon-puzzle"></i> 나의 시간표</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="base/carousel.html"><i class="icon-puzzle"></i> 나의 출석률</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="base/collapse.html"><i class="icon-puzzle"></i> 휴가신청</a>
              </li>
          	  <li class="nav-item">
          	    <a class="nav-link" href="getSugtList"><i class="icon-calculator"></i>건의하기<span class="badge badge-primary">NEW</span></a>
        	  </li>
            </ul>
          </li>
          <!-- 관리자 -->
          <li class="nav-title">
            ~관리자님
          </li>
          <li class="nav-item nav-dropdown">
            <a class="nav-link nav-dropdown-toggle" href="#"><i class="icon-cursor"></i> 출결관리</a>
            <ul class="nav-dropdown-items">
              <li class="nav-item">
                <a class="nav-link" href="buttons/buttons.html"><i class="icon-cursor"></i>출석부생성</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="buttons/button-group.html"><i class="icon-cursor"></i>출석부현황</a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="charts.html"><i class="icon-pie-chart"></i> 일정표관리</a>
          </li>
          <li class="nav-item nav-dropdown">
            <a class="nav-link nav-dropdown-toggle" href="#"><i class="icon-star"></i>학생관리</a>
          </li>
          <li class="nav-item nav-dropdown">
            <a class="nav-link nav-dropdown-toggle" href="getClassList"><i class="icon-bell"></i>과정관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="widgets.html"><i class="icon-calculator"></i>공휴일관리<span class="badge badge-primary">NEW</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="getConsultList"><i class="icon-calculator"></i>상담일지<span class="badge badge-primary">NEW</span></a>
          </li>
        </ul>
      </nav>
      <button class="sidebar-minimizer brand-minimizer" type="button"></button>
      
<script>
$.navigation = $('nav > ul.nav');
// Add class .active to current link
$.navigation.find('a').each(function(){

  var cUrl = String(window.location).split('?')[0];

  if (cUrl.substr(cUrl.length - 1) == '#') {
    cUrl = cUrl.slice(0,-1);
  }

  if ($($(this))[0].href==cUrl) {
    $(this).addClass('active');

    $(this).parents('ul').add(this).each(function(){
      $(this).parent().addClass('open');
    });
  }
});

// Dropdown Menu
$.navigation.on('click', 'a', function(e){

  if ($.ajaxLoad) {
    e.preventDefault();
  }

  if ($(this).hasClass('nav-dropdown-toggle')) {
    $(this).parent().toggleClass('open');
    resizeBroadcast();
  }

});
</script>