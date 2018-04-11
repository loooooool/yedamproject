<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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
<script>
	window.onload = function() {}

	var context = '${pageContext.request.contextPath}';

	function getStudent() {
		var params = {
			cl_no : $("#selectStudent").val()
		}
		$.getJSON(context + "/getStudentList", params, function(datas) {
			$("#studentName option:gt(0)").remove();
			for (i = 0; i < datas.length; i++) {
				$("#studentName").append("<option value='" + datas[i].member_id + "'>" + datas[i].name + "</option>");
			}
		})
	}

	function getConsultAjax() {
		var params = {
			s_detail : $("#studentName").val()
		}
		$.getJSON(context + "/getConsultAjax", params, function(datas) {
			$("#table").empty();
			for (i = 0; i < datas.length; i++) {
				$("#table").append("<tr><td>" + datas[i].c_no + "</td>"
					+ "<td><a href=getConsult?c_no=" + datas[i].c_no + ">" + datas[i].title + "</a></td>"
					+ "<td>" + datas[i].s_name + "</td>"
					+ "<td>" + datas[i].cdate + "</td>"
					+ "<td>" + datas[i].c_name + "</td>"
					+ "<td>" + datas[i].c_writer + "</td></tr>");
			}

		})
	}
</script>
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

						<div class="card-body" style="border-bottom: :1px">
							<div class="form-group row">
								<label class="col-md-3 col-form-label" for="select1">과정</label>
								<div class="col-md-9">
									<select id="selectStudent" name="select1"
										onchange="getStudent()" class="form-control">
										<option value="0">과정선택</option>
										<c:forEach items="${classList}" var="cl">
											<option value="${cl.cl_no}">${cl.class_name}</option>
										</c:forEach>
									</select>
								</div>
							</div>


							<div class="form-group row">
								<label class="col-md-3 col-form-label" for="select1">학생이름</label>
								<div class="col-md-9">
									<select id="studentName" name="select1"
										onchange="getConsultAjax()" class="form-control">
										<option value="">학생선택</option>
									</select>
								</div>
							</div>
						</div>


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



						<div class="form-group">
							<label for="nf-email"><strong>영문명</strong></label> <input
								type="text" id="ebg_name" name="eng_name" class="form-control"
								value="여권(passport)상의 영문명과 동일하게 작성하여 주세요"
								onfocus="this.value=''"> <span class="help-block">
							</span>
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
								onfocus="this.value=''"> <span class="help-block"></span>
						</div>

						<div class="form-group">
							<label for="nf-email"><strong>연락처</strong></label> <input
								type="text" id="phone" name="phone" class="form-control"
								value="자택전화" onfocus="this.value=''"> <span
								class="help-block"></span>
						</div>

						<div class="form-group">
							<label for="nf-email"><strong>휴대폰</strong></label> <input
								type="text" id="h_phone" name="h_phone" class="form-control"
								value="휴대폰" onfocus="this.value=''"> <span
								class="help-block"></span>
						</div>

						<div class="form-group">
							<label for="nf-email"><strong>훈련참여경로(택1)</strong></label>
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
								class="form-control" value="이밖의 훈련참여경로가 있으시다면 적으세요"
								onfocus="this.value=''"> <span class="help-block"></span>
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
								class="form-control" value="최종 근무지명을 적으세요"
								onfocus="this.value=''"> <span class="help-block"></span>
						</div>

						<div class="form-group">
							<label for="nf-email"><strong>이직 일자</strong></label> <input
								type="text" id="job_change_date" name="job_change_date"
								class="form-control" value="최종 퇴사일을 적으세요"
								onfocus="this.value=''"> <span class="help-block"></span>
						</div>


						<div class="form-group">
							<label for="nf-email"><strong>보훈대상자</strong></label>
							<div class="form-check">
								<input class="form-check-input" type="radio" value="B1"
									id="radio1" name="bohun_yn"> <label
									class="form-check-label" for="radio1"> 보훈 해당(보훈대상자 월
									4만원 지급, 3개월에 한번씩) </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" value="B2"
									id="radio2" name="bohun_yn"> <label
									class="form-check-label" for="radio2"> 해당없음 </label>
							</div><br>

							<div class="card-body">
								<input type="submit" class="btn btn-info" value="수정" /><br><br>
								<input type="button" class="btn btn-secondary"
									onclick="location.href='getClassList'" value="과정목록" />&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-secondary"
									onclick="location.href=''" value="비밀번호변경" />&nbsp;&nbsp;&nbsp;
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>