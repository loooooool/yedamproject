<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과목 등록</title>

</head>
<body>
	<div class="card">
		<div class="card-header">
			<h2>과목 등록</h2>
		</div>
		<div class="card-body">
			<form action="insertSubject" method="post">
				<div class="form-group">
					<label for="nf-email"><strong>과목명</strong></label> 
					<input type="text" id="nf-email" name="subject" class="form-control" value="${su.subject }" onfocus="this.value=''"> 
					<span class="help-block">과목명을 입력하세요</span>
				</div>
				<div class="form-group row">
					<label class="col-md-3 col-form-label" for="select1"><strong>과정명</strong></label>
					<div class="col-md-12">
						<select id="select1" name="cl_no" class="form-control">
							<option value="0">선택</option>
							<c:forEach items="${ClassList }" var="cl">
							<option value="${cl.cl_no }">${cl.class_name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="nf-email"><strong>시간</strong></label> 
					<input type="text" id="nf-email" name="totalTime" class="form-control" value="${su.totalTime }" onfocus="this.value=''"> 
					<span class="help-block">시간을 입력하세요</span>
				</div>
				<div class="form-group">
					<label for="nf-email"><strong>사용여부</strong></label>
						<div class="form-check">
							<input class="form-check-input" type="radio" value="Y" id="radio1" name="status_yn"> 
							<label class="form-check-label" for="radio1"> YES</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" value="N" id="radio2" name="status_yn"> 
							<label class="form-check-label" for="radio2"> NO</label>
					</div>
				</div>
				<div class="card-body" align="right">
				<input type="submit" class="btn btn-info" value="등록" />&nbsp; 
				<input type="button" class="btn btn-secondary" onclick="location.href='getSubjectList'" value="목록" />
				</div>
			</form>
		</div>
	</div>

</body>
</html>