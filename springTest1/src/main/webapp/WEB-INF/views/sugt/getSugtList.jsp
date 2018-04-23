<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<script>
function go_list(page){
	document.getElementsByName("page")[0].value=page;
	document.forms[0].submit();
	//location.href="getBoardList?page="+page;
}

</script>
</head>
<body>


	<div class="card">
		<div class="card-header">
			<h2>건의사항</h2>
		</div>
		<div class="card-body" style="border-bottom: :0px">
			<table class="table table-responsive-sm table-striped">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성일자</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sugtList}" var="sugt">
						<tr>
							<td>${sugt.s_no}</td>
							<td><a href="getSugt?s_no=${sugt.s_no}">${sugt.title}</a></td>
							<td>${sugt.s_date}</td>
							<td>${sugt.cnt}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
	
			<div class="card-body" align="right">
				<a href="insertSugtForm"><input type="button" class="btn btn-info " value="글쓰기"/></a>
			</div>
			
			
			<my:paging paging="${paging}" jsfunc="go_list" />
		</div>
	</div>

	<!--/.col-->

	<!--/.row-->