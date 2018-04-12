<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과목 목록</title>

<script>
	function go_list(page) {
		document.getElementsByName("page")[0].value = page;
		// location.href="getBoardList?page="+page;
		document.forms[0].submit();
	}

	window.onload = function() {}

	var context = '${pageContext.request.contextPath}';

	function getClass() {
		var params = {	cl_no : $("#selectClass").val() }
		$.getJSON(context + "/getSubjectListAjax", params, function(datas) {
			$("#table").empty();
			for (i = 0; i < datas.length; i++) {
				$("#table").append("<tr><td><a href=getSubject/" + datas[i].su_no + ">" + datas[i].su_no + "</a></td>"
					+ "<td>" + datas[i].subject + "</td>"
					+ "<td>" + datas[i].totalTime + "</td>"
					+ "<td>" + datas[i].class_name + "</td>"
					+ "<td>" + datas[i].status_yn + "</td></tr>");
			}
		})
	}
</script>
</head>
<body>
	<div class="card">
		<div class="card-header">
			<h2>과목 목록</h2>
		</div>
		<div class="card-body" style="border-bottom: :0px">
			<div class="form-group row">
				<label class="col-md-3 col-form-label" for="select1">과정</label>
				<div class="col-md-9">
					<select id="selectClass" name="select1" onchange="getClass()" class="form-control">
						<option value="0">과정선택</option>
						<c:forEach items="${classList}" var="cl">
							<option value="${cl.cl_no}">${cl.class_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="card-body">
				<form action="getSubjectList">
					<br>
					<table id="example" class="table table-responsive-sm table-striped"
						style="width: 100%">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">과목명</th>
								<th scope="col">시간</th>
								<th scope="col">과정명</th>
								<th scope="col">사용여부</th>
							</tr>
						</thead>
						<tbody id="table">
							<c:forEach items="${SubjectList }" var="su">
								<tr>
									<th scope="row"><a href="getSubject/${su.su_no }">${su.su_no}</a></th>
									<td>${su.subject}</td>
									<td>${su.totalTime}</td>
									<td>${su.class_name}</td>
									<td>${su.status_yn}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
				<my:paging paging="${paging }" jsfunc="go_list" />
				<div class="card-body" align="right">
					<input type="button" class="btn btn-info" onclick="location.href='insertSubject'" value="등록" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>