<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<script>

var context='${pageContext.request.contextPath}';

function getStudent(){
	var params = {cl_no : $("#selectStudent").val() }
	$.getJSON(context+"/getStudentList",params, function(datas){
		$("#studentName option:gt(0)").remove();
		for(i=0; i<datas.length;i++){
			$("#studentName").append("<option value='"+datas[i].member_id+"'>"+datas[i].name+"</option>");
		}
	})
}

</script>
</head>
<body>
	<div class="card">
		<div class="card-header">
			<h2>출석부현황</h2>
		</div>
		<div class="card-body" style="border-bottom: :0px">
			
			<div class="form-group row">
				<label class="col-md-2 col-form-label" for="select1">과정</label>
				<div class="col-md-6">
					<select id="selectStudent" name="class_no"  class="form-control">
						<option value="0">과정선택</option>
						<c:forEach items="${classList}" var="cl">
						<option value="${cl.cl_no}">${cl.class_name}</option>
						</c:forEach>					
					</select>
				</div>
				<form action="insertExcel" method="post" enctype="multipart/form-data">
				<div class="col-md-3" align="center">
					<input type="file" class="btn btn-info" name="attach_file" />
				</div>
				<div class="col-md-1" align="center">
					<input type="submit" class="btn btn-warning" value="등록"/>
				</div>
				</form>
		
			</div>
			<hr>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					<th>성명</th>
					<th>현재수업일수</th>
					<th>현재출석일수</th>
					<th>남은출석일수</th>
					<th>남은결석일수</th>
					<th>현재출석율</th>
					<c:forEach items="${unitList}" var="unit">
					<th>${unit.sdate}</th>
					</c:forEach> 
					</tr>
					
			</thead>
			<tbody>
				<c:forEach items="${unitList}" var="unit">
					<tr>
					<td>${unit.student_name}</td>
					<td>${unit.class_no}</td>
					<td>현재출석일수</td>
					<td>남은출석일수</td>
					<td>남은결석일수</td>
					<td>현재출석율</td>
					</tr>
				</c:forEach>
			
			</tbody>		
					
			
			</table>
		</div>
	</div>
</body>
</html>