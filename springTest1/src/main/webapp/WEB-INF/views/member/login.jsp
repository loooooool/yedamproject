<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	String member_id = request.getParameter("member_id"); // request에서 id 파라미터를 가져온다
	String passwd = request.getParameter("pwd"); // request에서 passwd 파라미터를 가져온다.

	if (member_id!=null) { // 로그인 성공시
		session.setAttribute("member_id", member_id); // 세션에 "id" 이름으로 id 등록
		response.sendRedirect("main.jsp"); // 로그인 성공 메인페이지 이동
	} else {	// 로그인 실패
%>


<script>
	alert("로그인 실패");
	history.go(-1); // 이전 페이지로 이동
</script>

<%
	}
%>



