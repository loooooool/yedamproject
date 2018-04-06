<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<script>
	function go_list(page) {
		document.getElementsByName("page")[0].value = page;
		document.forms[0].submit();
		//location.href="getBoardList?page="+page;
	}
</script>
</head>
<body>
	<div class="card">
		<div class="card-body">
			<form action="getBoardList">
						<!-- <button type="button" class="btn btn-secondary">Search</button> -->
						<input type="text" class="form-control" name="searchKeyword" value="${noticeVO.searchKeyword}" /> 
					    <input type="submit" class="btn btn-secondary" value="Search" />
			</form>
	</div>
		<div class="card-header">
			<h2>공지사항</h2>
		</div>
		<div class="card-body" style="border-bottom: :0px">
			<table class="table table-responsive-sm table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${noticeList}" var="notice">
						<tr>
							<td>${notice.n_no}</td>
							<td><a href="getNotice?n_no=${notice.n_no}">${sugt.title}</a></td>
							<td>${notice.writer}</td>
							<td>${notice.ndate}</td>
							<td>${notice.viewcount}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<div class="card-body" align="right">
				<a href="insertNoticeForm"><button type="button"
						class="btn btn-info ">글쓰기</button></a>
			</div>
			<my:paging paging="${paging}" jsfunc="go_list" />
		</div>
	</div>

	<!--/.col-->

	<!--/.row-->