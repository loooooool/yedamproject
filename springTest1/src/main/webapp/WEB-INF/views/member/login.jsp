<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	String member_id = request.getParameter("member_id"); // request���� id �Ķ���͸� �����´�
	String passwd = request.getParameter("pwd"); // request���� passwd �Ķ���͸� �����´�.

	if (member_id!=null) { // �α��� ������
		session.setAttribute("member_id", member_id); // ���ǿ� "id" �̸����� id ���
		response.sendRedirect("main.jsp"); // �α��� ���� ���������� �̵�
	} else {	// �α��� ����
%>


<script>
	alert("�α��� ����");
	history.go(-1); // ���� �������� �̵�
</script>

<%
	}
%>



