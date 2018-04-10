<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
</script>
</head>
<body>

	<div class="card">
		<div class="card-header">
			<h2>상담일지</h2>
		</div>
		<div class="card-body" style="border-bottom: :0px">
		</div>
		<form action="insertConsult" method="post">
			<div class="form-group row">
				<label class="col-md-3 col-form-label" for="select1">과정</label>
				<div class="col-md-9">
					<select id="select1" name="cl_no" class="form-control">
						<option value="">과정선택</option>
						<c:forEach items="${classList}" var="cl">
						<option value="${cl.cl_no}" onchange="getStudent(${cl.cl_no})">${cl.class_name}</option>
						</c:forEach>					
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 col-form-label" for="select1">과정</label>
				<div class="col-md-9">
					<select id="select1" name="s_detail" class="form-control">
						<option value="">학생선택</option>
						<c:forEach items="${memberList}" var="ml">
						<option value="${ml.member_id}">${ml.name}</option>
						</c:forEach>					
					</select>
				</div>
			</div>
			
			<div class="form-group row">
              <label class="col-md-3 col-form-label" for="text-input">제목</label>
              <div class="col-md-9">
                <input type="text" id="text-input" name="title" class="form-control" placeholder="Text">
              </div>
             </div>
			<div class="form-group row">
              <label class="col-md-3 col-form-label" for="textarea-input">내용</label>
              <div class="col-md-9">
                <textarea id="textarea-input" name="content" rows="9" class="form-control" placeholder="Content.."></textarea>
              </div>
            </div>
			<div class="card-body" align="right">
			<input type="submit" class="btn btn-info " value="등록"/>
			</div>
			</form>
	</div>
</body>
</html>