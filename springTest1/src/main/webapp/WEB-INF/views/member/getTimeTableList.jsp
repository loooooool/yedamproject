<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 시간표</title>
<script src="../scripts/jquery-3.3.1.min.js"></script>
<script>
$(window).load(function () {
    $("#example").each(function () {
        var rows = $(".gubun:contains('" + $(this).text() + "')");
        if (rows.length > 1) {
          rows.eq(0).attr("rowspan", rows.length);
          rows.not(":eq(0)").remove();
        }
    });
});
</script>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h2>나의 시간표</h2>
				</div>
				<div class="card-body">
					<form action="getClassList">
					
						<table id="example" class="table table-responsive-sm table-striped" style="width: 100%">
							<thead>
								<tr>
									<th>날짜</th>
									<th>과목</th>
									<th>훈련시간</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${timeTable }" var="tt">
									<tr>
										<td>${tt.s_date}</td>
										<td>${tt.subject}</td>
										<td>${tt.classtime_cd}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>