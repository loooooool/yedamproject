<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과정 등록</title>

</head>
<body>
	<div class="card">
		<div class="card-header">
			<h2>과정 등록</h2>
		</div>
		<div class="card-body">
			<form action="insertClass" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="nf-email"><strong>과정명</strong></label> 
					<input type="text" id="nf-email" name="nf-email" class="form-control" placeholder="과정명"> 
					<span class="help-block">과정명을 입력하세요</span>
				</div>
				<div class="form-group">
					<label for="nf-email"><strong>강의실</strong></label>
					<input type="text" id="nf-email" name="nf-email" class="form-control" placeholder="강의실"> 
					<span class="help-block">강의실을 입력하세요</span>
				</div>
				<div class="form-group row">
					<label class="col-md-3 col-form-label" for="file-input"><strong>시간표 등록</strong></label>
					<div class="col-md-10">
						<input type="file" id="file-input" name="file-input">
					</div>
				</div>
				<div class="form-group">
					<label for="nf-email"><strong>총 수업시간</strong></label> 
					<input type="text" id="nf-email" name="nf-email" class="form-control" placeholder="총 수업시간"> 
					<span class="help-block">총	수업시간을 입력하세요</span>
				</div>
				<div class="form-group">
					<label for="nf-email"><strong>과정구분</strong></label>
						<div class="form-check">
							<input class="form-check-input" type="radio" value="radio1" id="radio1" name="myRadio"> 
							<label class="form-check-label" for="radio1"> 과정평가형</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" value="radio2" id="radio2" name="myRadio"> 
							<label class="form-check-label" for="radio2"> 단위기간형</label>
					</div>
				</div>
				<input type="submit" class="btn btn-info" value="등록" />&nbsp; 
				<input type="button" class="btn btn-success" onclick="location.href='getClassList'" value="취소" />
			</form>
		</div>
	</div>

</body>
</html>