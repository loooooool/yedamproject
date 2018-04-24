<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="sidebar-nav">
	<ul class="nav">
		<li class="nav-item"><a class="nav-link" href="/app"> <i
				class="icon-speedometer"></i> 홈</a>
		</li>

		<li class="nav-title">예담</li>
		<li class="nav-item"><a
			href="${pageContext.request.contextPath}/getNoticeList"
			class="nav-link"><i class="icon-drop"></i>공지사항</a></li>
		<li class="nav-item"><a href="typography.html" class="nav-link"><i
				class="icon-pencil"></i>예담 수업</a></li>
		<li class="nav-item"><a href="typography.html" class="nav-link"><i
				class="icon-pencil"></i>예담 달력</a></li>

		<!------------ 회원 ------------>
		<c:if test="${sessionScope.memberVO.member_cd=='M1'}">
			<li class="nav-title">${sessionScope.memberVO.name}회원님</li>
			<li class="nav-item nav-dropdown"><a
				class="nav-link nav-dropdown-toggle" href="#"><i
					class="icon-puzzle"></i>마이페이지</a>

				<ul class="nav-dropdown-items">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/memberUpdateForm"><i
							class="icon-puzzle"></i>회원정보수정</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/getTimeTableList"><i
							class="icon-puzzle"></i>나의 시간표</a></li>
					<li class="nav-item"><a class="nav-link"
						href="base/carousel.html"><i class="icon-puzzle"></i>나의 출석률</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/getSugtList"><i
							class="icon-calculator"></i>건의하기 <span
							class="badge badge-primary">NEW</span></a></li>
				</ul></li>

			<li class="nav-item nav-dropdown"><a
				class="nav-link nav-dropdown-toggle" href="#"><i
					class="icon-cursor"></i>과정</a>
				<ul class="nav-dropdown-items">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/getClassList"><i
							class="icon-cursor"></i>과정 목록</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/getSubjectList"><i
							class="icon-cursor"></i>과목 목록</a></li>
				</ul></li>
		</c:if>


		<!------------ 관리자 ------------>
		<c:if
			test="${sessionScope.memberVO.member_cd=='M2' or sessionScope.memberVO.member_cd=='M3'}">
			<li class="nav-title">${sessionScope.memberVO.name}관리자님</li>

			<li class="nav-item nav-dropdown"><a
				class="nav-link nav-dropdown-toggle" href="#"><i
					class="icon-cursor"></i>과정</a>
				<ul class="nav-dropdown-items">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/getClassList"><i
							class="icon-cursor" id="sub"></i>과정관리</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/getSubjectList"><i
							class="icon-cursor" id="sub"></i>과목관리</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/insertTimeTableForm"><i
							class="icon-cursor" id="sub"></i>시간표등록</a></li>
				</ul>
				
			</li>

			<li class="nav-item nav-dropdown"><a
				class="nav-link nav-dropdown-toggle" href="#"><i
					class="icon-cursor"></i>출결</a>
				<ul class="nav-dropdown-items">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/insertAttendanceForm"> <i class="icon-cursor" id="sub"></i>단위출석부생성
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/insertTimeTableForm"> <i class="icon-cursor" id="sub"></i>과정출석부생성
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/getUnitList"> <i class="icon-cursor" id="sub"></i>출석현황
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/getClassAtt"> <i
							class="icon-cursor" id="sub"></i>과목출석부
					</a></li>
				</ul>
			</li>
			<li class="nav-item nav-dropdown"><a
				class="nav-link nav-dropdown-toggle" href="#"><i
					class="icon-star"></i>학생관리</a>
				<ul class="nav-dropdown-items">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/insertMemberForm"
						id="sub"><i class="icon-cursor"></i>학생등록</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/viewMember" id="sub"><i
							class="icon-cursor"></i>학생조회</a></li>
					
				</ul></li>
			<li class="nav-item"><a class="nav-link" href="widgets.html"><i
					class="icon-calculator"></i>공휴일 </a>
			</li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/getConsultList"><i
					class="icon-calculator"></i>상담일지</a>
			</li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/getSugtList"><i
					class="icon-calculator"></i>건의사항</a>
			</li>
		</c:if>
	</ul>

</nav>
<button class="sidebar-minimizer brand-minimizer" type="button"></button>
<style>
#sub {
	margin-left: 25px;
}
</style>


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