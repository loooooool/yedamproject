<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과정 상세</title>

</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h2>과정 상세</h2>
				</div>
				<div class="card-body">
					<div class="form-group row">
						<label class="col-md-3 col-form-label">과정명</label>
						<div class="col-md-9">
							<p class="form-control-static">${cl.class_name}</p>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 col-form-label">강의실</label>
						<div class="col-md-9">
							<p class="form-control-static">${cl.address}</p>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 col-form-label">총 수업시간</label>
						<div class="col-md-9">
							<p class="form-control-static">${cl.totalTime}</p>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 col-form-label">구분 코드</label>
						<div class="col-md-9">
							<p class="form-control-static">${cl.class_cd}</p>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 col-form-label">시간표</label>
						<div class="col-md-9">
							<c:if test="${not empty timeTable}">
								<p class="form-control-static">${cl.timeTable}"></p>
							</c:if>
							<c:if test="${empty timeTable}">
								<p class="form-control-static">첨부된 파일 없음</p>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<input type="button" class="btn btn-secondary"
		onclick="location.href='getClassList'" value="목록" />&nbsp;
	<input type="button" class="btn btn-warning"
		onclick="location.href='updateClassForm?cl_no=${cl_no}'" value="수정" />&nbsp;
	<form action="deleteClass">
		<input type="submit" class="btn btn-danger" value="삭제" />
	</form>
</body>
</html>