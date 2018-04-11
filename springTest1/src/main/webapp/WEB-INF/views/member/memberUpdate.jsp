<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>마이페이지 회원정보수정</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<div class="row">
  <div class="col-md-12">
	<div class="card">
		<div class="card-header">
			<h1>훈련 수강 신청서</h1>
		</div>

		<div class="card-body">
			<form action="memberUpdate" method="post"
				enctype="multipart/form-data">

				<div class="form-group">
					<label for="nf-email"><strong> 과정구분 </strong></label>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="C1"
							id="radio1" name="mypage_c"> <label
							class="form-check-label" for="radio1"> 과정평가반 </label>
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
						type="text" id="school_spec_cd" name="school_spec_cd"
						class="form-control" value="최종학력 및 전공" onfocus="this.value=''">
					<span class="help-block"></span>
				</div>

				<div class="form-group">
					<label for="nf-email"><strong>주민등록번호</strong></label> <input
						type="text" id="social_number" name="social_number"
						class="form-control" value="주민등록번호" onfocus="this.value=''">
					<span class="help-block">예)910808-2785623</span>
				</div>

				<!-- 이메일은 @gmail.com등의 주소형식 선택 기능 구현 -->
				<div class="form-group">
					<label for="nf-email"><strong>이메일</strong></label> <input
						type="text" id="email" name="email" class="form-control"
						value="이메일" onfocus="this.value=''"> <span
						class="help-block">예)abcde@gmail.com</span>
				</div>

				<div class="form-group">
					<label for="nf-email"><strong>주소</strong></label> <input
						type="text" id="address" name="address" class="form-control"
						value="주소" onfocus="this.value=''"> <span
						class="help-block"></span>
				</div>

				<div class="form-group">
					<label for="nf-email"><strong>휴대폰</strong></label> <input
						type="text" id="h_phone" name="h_phone" class="form-control"
						value="휴대폰" onfocus="this.value=''"> <span
						class="help-block">휴대폰</span> <span>휴대폰</span>
				</div>

				<div class="form-group">
					<label for="nf-email"><strong>훈련참여경로</strong></label>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="O1"
							id="radio1" name="open_route_cd"> <label
							class="form-check-label" for="radio1"> 인터넷검색</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="O2"
							id="radio2" name="open_route_cd"> <label
							class="form-check-label" for="radio2"> 현수막</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="O3"
							id="radio3" name="open_route_cd"> <label
							class="form-check-label" for="radio3"> 고용지원센터</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="O4"
							id="radio4" name="open_route_cd"> <label
							class="form-check-label" for="radio4"> 지인권유</label>
					</div>
				</div>

				<div class="form-group">
					<label for="nf-email"><strong>훈련참여경로 기타</strong></label> <input
						type="text" id="open_route_etc" name="open_route_etc"
						class="form-control" value="훈련참여경로 기타" onfocus="this.value=''">
					<span class="help-block">훈련참여경로 기타</span> <span>훈련참여경로 기타</span>
				</div>

				<div class="form-group">
					<label for="nf-email"><strong>실업급여 수급 여부</strong></label>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="U1"
							id="radio1" name="unemployee_pay_yn"> <label
							class="form-check-label" for="radio1"> 수급 </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="U2"
							id="radio2" name="unemployee_pay_yn"> <label
							class="form-check-label" for="radio2"> 미수급</label>
					</div>
				</div>

				<div class="form-group">
					<label for="nf-email"><strong>이직 전 직장명</strong></label> <input
						type="text" id="previout_job" name="previout_job"
						class="form-control" value="이직 전 직장명" onfocus="this.value=''">
					<span class="help-block">이직 전 직장명</span> <span>이직 전 직장명</span>
				</div>

				<div class="form-group">
					<label for="nf-email"><strong>이직 일자</strong></label> <input
						type="text" id="job_change_date" name="job_change_date"
						class="form-control" value="이직 일자" onfocus="this.value=''">
					<span class="help-block">이직 일자</span> <span>이직 일자</span>
				</div>


				<div class="form-group">
					<label for="nf-email"><strong>보훈대상자</strong></label>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="B1"
							id="radio1" name="bohun_yn"> <label
							class="form-check-label" for="radio1"> 보훈 해당(보훈대상자 월 4만원
							지급, 3개월에 한번씩) </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="B2"
							id="radio2" name="bohun_yn"> <label
							class="form-check-label" for="radio2"> 해당없음 </label>
					</div>

					<div class="card-body">
						<input type="submit" class="btn btn-info" value="수정" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="button" class="btn btn-secondary"
							onclick="location.href='getClassList'" value="목록" />
					</div>
				</div>
		
		</form>
	</div>
	</div>
</div>
</div>
</body>
</html>