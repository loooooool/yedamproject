<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과정 등록</title>

</head>
<body>
	<div class="card">
		<div class="card-header">
			<h2>과정 수정</h2>
		</div>
		<div class="card-body">
			<form action="updateClass" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="nf-email"><strong>과정명</strong></label> 
					<input type="text" id="nf-email" name="class_name" class="form-control" value="${cl.class_name }"> 
					<span class="help-block">수정할 과정명을 입력하세요</span>
				</div>
				<div class="form-group">
					<label for="nf-email"><strong>강의실</strong></label>
					<input type="text" id="nf-email" name="address" class="form-control"  value="${cl.address }"> 
					<span class="help-block">수정할 강의실을 입력하세요</span>
				</div>
				<div class="form-group">
				<c:if test="${not empty timeTable}">
					<label for="nf-email"><strong>기존 파일</strong></label>
					<input type="text" id="nf-email" name="file-input" class="form-control" value="${cl.timeTable }"> 
				</c:if>
				</div>				
				<div class="form-group row">
				<c:if test="${empty timeTable}">
					<label class="col-md-3 col-form-label" for="file-input"><strong>시간표 수정</strong></label>
					<div class="col-md-10">
						<input type="file" id="file-input" name="file-input">
					</div>
				</c:if>
				</div>
				<div class="form-group">
					<label for="nf-email"><strong>총 수업시간</strong></label> 
					<input type="text" id="nf-email" name="totalTime" class="form-control" value="${cl.totalTime }"> 
					<span class="help-block">수정할 총 수업시간을 입력하세요</span>
				</div>
				<div class="form-group">
					<label for="nf-email"><strong>과정</strong></label>
						<div class="form-check">
							<input class="radio" type="radio" value="C1" id="radio1" name="class_cd"> 
							<label class="radio" for="radio1"> 과정평가반</label>
						</div>
						<div class="form-check">
							<input class="radio" type="radio" value="C2" id="radio2" name="class_cd"> 
							<label class="radio" for="radio2"> 단위기간평가반</label>
					</div>
				</div>
				<div class="card-body">
				<input type="submit" class="btn btn-warning" value="수정" />&nbsp; 
				<input type="reset" class="btn btn-success" value="초기화" />&nbsp; 
				<input type="button" class="btn btn-secondary" onclick="location.href='getClassList'" value="목록" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>