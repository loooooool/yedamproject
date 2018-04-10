<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>마이페이지(mypage)</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="card">
		<div class="card-header">
			<h1>훈련 수강 신청서</h1>
		</div>

		<div class="card-body">
			<form action="mypage" method="post" enctype="multipart/form-data">

				<div class="form-group">
					<label for="nf-email"><strong>과정구분</strong></label>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="C1"
							id="radio1" name="mypage_c"> <label
							class="form-check-label" for="radio1"> 과정평가반</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="C2"
							id="radio2" name="mypage_c"> <label
							class="form-check-label" for="radio2"> 단위기간평가반</label>
					</div>
				</div>

				<div class="form-group">
					<label for="nf-email"><strong>모집구분</strong></label>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="R1"
							id="radio1" name="mypage_r"> <label
							class="form-check-label" for="radio1"> 내일배움카드</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="R2"
							id="radio2" name="mypage_r"> <label
							class="form-check-label" for="radio2"> 취업성공패키지</label>
					</div>
				</div>

			<!-- 지원과정 선택하면, 훈련기간 자동 설정하기 -->
				<div class="container">
					<h2>지원과정</h2>
					<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-toggle="dropdown">
							지원하신 과정명을 선택하세요 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">1강의장 : 웹디자인</a></li>
							<li><a href="#">2강의장 : 자바 개발자</a></li>
							<li><a href="#">3강의장 : 빅데이터</a></li>
						</ul>
					</div>
				</div>

				<div class="form-group">
					<label for="nf-email"><strong>성명</strong></label> <input
						type="text" id="name" name="name" class="form-control"
						value="name" onfocus="this.value=''"> <span
						class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="nf-email"><strong>영문명</strong></label> <input
						type="text" id="ebg_name" name="eng_name" class="form-control"
						value="eng_name" onfocus="this.value=''"> <span
						class="help-block">여권(passport)상의 영문명과 동일하게 작성하여 주세요 </span>
				</div>

				<div class="form-group">
					<label for="nf-email"><strong>최종학력 / 전공</strong></label> <input
						type="text" id="school_spec_cd" name="school_spec_cd" class="form-control"
						value="최종학력 및 전공" onfocus="this.value=''"> <span
						class="help-block"></span>
				</div>
				
				<div class="form-group">
					<label for="nf-email"><strong>주민등록번호</strong></label> <input
						type="text" id="social_number" name="social_number" class="form-control"
						value="주민등록번호" onfocus="this.value=''"> <span
						class="help-block">예)910808-2785623</span>
				</div>
				
				<!-- 이메일은 @gmail.com등의 주소형식 선택 기능 구현 -->
				<div class="form-group">
					<label for="nf-email"><strong>이메일</strong></label> <input
						type="text" id="email" name="email" class="form-control"
						value="이메일" onfocus="this.value=''"> <span
						class="help-block">예)910808-2785623</span>
				</div>

				<div class="card-body">
					<input type="submit" class="btn btn-info" value="등록" />&nbsp; <input
						type="button" class="btn btn-secondary"
						onclick="location.href='getClassList'" value="목록" />
				</div>

			</form>
		</div>
	</div>

</body>
</html>