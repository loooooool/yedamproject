<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<script>
	function go_list(page) {
		document.getElementsByName("page")[0].value = page;
		document.noticeForm.submit();
		
	}
</script>
</head>
<body >
	<div class="card" style="border:50px solid white;">
		<div class="card-header">
			<h2>공지사항
				<div class="card-body" align="right">
					<form action="getNoticeList" style="height:10.96px;">
							<input type="hidden" name="page" />
							<input type="submit" value="Search" class="btn btn-secondary" style="height:35.5px; margin-bottom:4px;"/>
							<input type="text" name="searchKeyword" style="width:160px; height:35px;"/>
					</form>
				</div>
			</h2>
		</div>
		<div class="card-body" >
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
							<td><a href="getNotice?n_no=${notice.n_no}">${notice.title}</a></td>
							<td>${notice.writer}</td>
							<td><fmt:formatDate pattern = "yyyy-MM-dd"  value = "${notice.ndate}" /></td>
							<td>${notice.viewcount}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			
			<div class="card-body" align="right">
				<a href="insertNotice">
					<button type="button" class="btn btn-info">
					글쓰기
					</button>
				</a>
				<div align="left">
			 		<my:paging paging="${paging}" jsfunc="go_list"/>
				</div>
			</div>
		</div>
	</div>

	