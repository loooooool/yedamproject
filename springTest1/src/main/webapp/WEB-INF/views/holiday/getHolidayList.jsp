<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<script>
	function go_list(page) {
		document.getElementsByName("page")[0].value = page;
		document.holidayForm.submit();
	}
</script>
<style>
.search{
    width: 100px;
    font-size: 16px;
    color: gray;
    border: 1px solid gray;
    padding-top: 3px;
    padding-bottom: 3px;
} 

#pp{
 color: red;
}
</style>
</head>
<body>
	<div class="card" style="border:50px solid white;">
		<div class="card-header">
			<h2>공휴일 목록</h2>
				<div  class="card-body" align="right">
					<form action="getHolidayList" name="holidayForm" style="height:15.96px;">
							<input type="hidden" name="page" value="${paging.page}" />
							<select name="searchCondition" class="search">
								<option value="">-선택-</option> 
								<c:forEach items="${conditionMap}" var="option">
									<option value="${option.value}">${option.key}</option>		
								</c:forEach>
							</select>
							<input type="text" name="searchKeyword" style="width:160px;"></input>
							<input type="submit" value="Search" class="btn btn-secondary" />
					</form>
				</div>
		</div>
		<div> <!-- class="card" class="table table-responsive-sm table-striped" -->
			<table class="table table-responsive-sm table-striped">
					<tr>
						<th>순번</th>
						<th>휴일일자</th>
						<th>휴일명</th>
						<th>휴일구분</th>
					</tr>
					<c:set var="vno" value="${paging.totalRecord-(paging.page-1)*10}"></c:set>
					<c:forEach items="${holidayList}" var="holiday" varStatus="s">
						<tr>
							<td>${vno-s.index}</td>				
							<td><a href="getholiday?h_no=${holiday.h_no}" style="color:;">
							${holiday.year}-${holiday.month}-${holiday.day}</a></td>
							<td>${holiday.name}</td>
							<td>${holiday.type}</td>
						</tr>
					</c:forEach>
			</table>
			<div class="card-body" align="right">
				<a href="insertHoliday">
					<button type="button" class="btn btn-info">
					등록
					</button>
				</a>
				<div align="left">
			 		<my:paging paging="${paging}" jsfunc="go_list"/>
				</div>
			</div>
		</div>
	</div>
</body>