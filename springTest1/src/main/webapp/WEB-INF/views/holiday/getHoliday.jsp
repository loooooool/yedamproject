<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>

<body>
	<div class="card" style="border: 50px solid white;">
		<h2>공휴일 상세</h2>
		<br>
		<table class="table table-responsive-sm table-striped">
			<colgroup>
				<col width="33%">
			</colgroup>
			<tbody style="border: 1px solid #A4A4A4;">
				<!-- 작성자 고정 -->
				<tr>
					<td>
						<div class="form-group row">
							<label class="col-md-3 col-form-label" style="padding-top: 2px">휴일일자</label>
							<div class="col-md-9">
								<p class="form-control-static" style="margin-top: 1px">${holiday.year}-${holiday.month}-${holiday.day}</p>
							</div>
						</div>
					<td />
				</tr>
				<tr>
					<td>
						<div class="form-group row">
							<label class="col-md-3 col-form-label" for="writer"
								style="padding-top: 2px">휴일명</label>
							<div class="col-md-9">
								<p class="form-control-static" style="margin-top: 1px">${holiday.name}</p>
							</div>
						</div>
					<td />
				</tr>
				<!-- 제목 -->
				<tr>
					<td>
						<div class="form-group row">
							<label class="col-md-3 col-form-label" for="title"
								style="padding-top: 2px">휴일설명</label>
							<div class="col-md-9">
								<p class="form-control-static" style="margin-top: 1px">${holiday.holiday_content}</p>
							</div>
						</div>
					<td />
				</tr>

				<!-- 내용 -->
				<tr>
					<td colspan="2">
						<div class="form-group row">
							<div class="col-md-9"
								style="border: 1px solid white; height: 600px;">
								<select>
									<option value="${holiday.type}">${holiday.type}</option>
								</select>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div align="right">
			<input type="button" class="btn btn-warning" value="수정"
				onclick="location.href='./updateHolidayForm?h_no=${holiday.h_no}'"/>
			<input type="button" class="btn btn-danger" value="삭제"
				onclick="location.href='./deleteHoliday?h_no=${holiday.h_no}'"/> <input
				type="button" class="btn btn-secondary" value="목록"
				onclick="location.href='./getHolidayList'" />
		</div>
	</div>
</body>
</html>