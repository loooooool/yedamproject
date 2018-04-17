<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 시간표</title>
<script>
	function go_list(page) {
		document.getElementsByName("page")[0].value = page;
		 //location.href="getClassList?page="+page;
		document.forms[0].submit();
	}
</script>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h2>나의 시간표</h2>
				</div>
				<div class="card-body">
					<form action="getClassList">
						<input type="hidden" name="page" value="1" /> <br>
						<table id="example" class="table table-responsive-sm table-striped" style="width: 100%">
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">날짜</th>
									<th scope="col">훈련시간</th>
									<th scope="col">세부내용</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${timeTable }" var="tt">
									<tr>
										<th scope="row">${tt.t_id}</th>
										<td>${tt.s_date}</td>
										<td>${tt.classtime_cd}</td>
										<td>${tt.subject}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
					<my:paging paging="${paging }" jsfunc="go_list" />
					</div>
				</div>
			</div>
		</div>
</body>
</html>