<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>


<!DOCTYPE html>
<html>
<head><title>Insert title here</title>




</head>
<body>

<div class="card">
		<div class="card-header">
			<h2>과목별 출석부 조회</h2>
		</div>
		<div class="card-body" style="border-bottom: :0px">
			

		
			<table class="table table-responsive-sm table-striped">
				<thead>
					<tr>
						<th>학생명</th>
						<c:forEach items="${attSubjectList}" var="as">
						<th>${as.subject}</th>
						</c:forEach>
					</tr>
				</thead>
				<tbody id="table">
					<c:forEach items="${attList}" var="at">
						<tr>
							<td>${at.name}</td>
							
						</tr>
					</c:forEach>

				</tbody>
			</table>
					  	<my:paging paging="${paging}" jsfunc="go_list" />
		</div>
	</div>


</body>
</html>