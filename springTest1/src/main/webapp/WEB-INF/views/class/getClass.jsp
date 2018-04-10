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
						<label class="col-md-3 col-form-label"><strong>과정명</strong></label>
						<div class="col-md-9">
							<p class="form-control-static">${cl.class_name}</p>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 col-form-label"><strong>강의실</strong></label>
						<div class="col-md-9">
							<p class="form-control-static">${cl.address}</p>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 col-form-label"><strong>총 수업시간</strong></label>
						<div class="col-md-9">
							<p class="form-control-static">${cl.totalTime}시간</p>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 col-form-label"><strong>과정 구분</strong></label>
						<div class="col-md-9">
							<p class="form-control-static"></p>
							
							<input type="radio" name="class_cd" id = "radio1" value="C1"  
								<c:if test="${cl.class_cd eq 'C1'}"> checked="checked" </c:if>/>과정평가반
							<br>
							<input type="radio" name="class_cd" id = "radio2" value="C2" 
								<c:if test="${cl.class_cd eq 'C2'}"> checked="checked" </c:if>/>단위기간평가반
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 col-form-label"><strong>시간표</strong></label>
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
	<div class="card-body">
	<input type="button" class="btn btn-warning" onclick="location.href='../updateClassForm?cl_no=${cl.cl_no}'" value="수정" />&nbsp;
	<input type="button" class="btn btn-danger"  onclick="location.href='../deleteClass?cl_no=${cl.cl_no }'" value="삭제" />&nbsp;
	<input type="button" class="btn btn-secondary" onclick="location.href='../getClassList'" value="목록" />
	</div>
</body>
</html>