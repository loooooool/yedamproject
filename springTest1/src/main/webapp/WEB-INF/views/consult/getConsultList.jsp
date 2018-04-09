<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<script>
</script>
</head>
<body>

	<div class="card">
		<div class="card-header">
			<h2>상담일지</h2>
		</div>
		<div class="card-body" style="border-bottom: :0px">
			<div class="form-group row">
				<label class="col-md-3 col-form-label" for="select1">과정</label>
				<div class="col-md-9">
					<select id="select1" name="select1" class="form-control">
						<option value="0">과정선택</option>
						<option value="1">Option #1</option>
						<option value="2">Option #2</option>
						<option value="3">Option #3</option>
					</select>
				</div>
			</div>


			<div class="form-group row">
				<label class="col-md-3 col-form-label" for="select1">학생이름</label>
				<div class="col-md-9">
					<select id="select1" name="select1" class="form-control">
						<option value="0">학생선택</option>
						<option value="">과정평가반</option>
						<option value="">단위기간 평가반</option>
					</select>
				</div>
			</div>
		</div>
		<div class="card-body" align="right">
		

		<a href="insertSugtForm"><input type="button" class="btn btn-info " value="글쓰기"/></a>
		</div>
		
			<table class="table table-responsive-sm table-striped">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>학생이름</th>
						<th>작성일자</th>
						<th>과정</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${consultList}" var="consult">
						<tr>
							<td>${consult.c_no}</td>
							<td><a href="getConsult?c_no=${consult.c_no}">${consult.title}</a></td>
							<td>${consult.s_detail}</td>
							<td>${consult.cdate}</td>
							<td>${consult.course_cd}</td>
							<td>${consult.writer}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
					  	<my:paging paging="${paging}" jsfunc="go_list" />
	</div>
</body>
