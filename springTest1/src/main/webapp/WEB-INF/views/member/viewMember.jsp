<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
    
    
<!DOCTYPE html>
<html>
<head><title>Insert title here</title>

<style>

	#sbtn{
		margin-left:-70px;
	}
	
	

</style>

<script>

window.onload = function() {
}

	var context='${pageContext.request.contextPath}';


function getMemberAddList(){
	var params = {m_detail : $("#className").val() }
	$.getJSON(context+"/getMemberAjax",params, function(datas){
		$("#table").empty();
		for(i=0; i<datas.length;i++){
			$("#table").append("<tr><td>"+ datas[i].name + "</td>"
								+"<td>"+datas[i].class_name+"</td>"
								+"<td>" +datas[i].address+"</td>"
								+"<td>" +datas[i].status_cd+"</td>"
								+"<td><button type='button' class='btn btn-sm btn-primary' value=''"+datas[i].member_id+"'><i class='fa fa-dot-circle-o'></i>정보수정</button></td>"
								+"<td><button type='button' class='btn btn-sm btn-primary' value=''"+datas[i].member_id+"' id='sbtn'><i class='fa fa-dot-circle-o'></i>상담내용</button></td>");
		}
		
	})
}

</script>

</head>
<body>


<div class="card">
		<div class="card-header">
			<h2>학생조회</h2>
		</div>
		<div class="card-body" style="border-bottom: :0px">
			<%-- <div class="form-group row">
				<label class="col-md-3 col-form-label" for="select1">과정</label>
				<div class="col-md-9">
					<select id="selectClass" name="select1"  onchange="getStudent()" class="form-control">
						<option value="0">과정선택</option>
						<c:forEach items="${classList}" var="cl">
						<option value="${cl.cl_no}">${cl.class_name}</option>
						</c:forEach>					
					</select>
				</div>
			</div> --%>


			<div class="form-group row">
				<label class="col-md-3 col-form-label" for="select1">과정명</label>
				<div class="col-md-9">
					<select id="className" name="select1"  onchange="getMemberAddList()" class="form-control">
						<option value="">과정선택</option>
						<option value="">모든과정</option>
						<c:forEach items="${classList}" var="cl">
						<option value="${cl.class_name}">${cl.class_name}</option>
						</c:forEach>	
						
					</select>
				</div>
			</div>
		
		
	
		
			<table class="table table-responsive-sm table-striped">
				<thead>
					<tr >
						<th>이름</th>
						<th>과정명</th>
						<th>강의장</th>
						<th>수료여부</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody id="table">
					<c:forEach items="${memberAddList}" var="mem">
						<tr name="consultTable">
							<td>${mem.name}</td>
							<td>${mem.class_name}</td>
							<td>${mem.address}</td>
							<td>${mem.status_cd}</td>
							<td><button type="button" class="btn btn-sm btn-primary" value="${mem.member_id}"><i class="fa fa-dot-circle-o"></i>정보수정</button></td>
							<td><button type="button" class="btn btn-sm btn-primary" value="${mem.member_id}" id="sbtn"><i class="fa fa-dot-circle-o"></i>상담내용</button></td>
							
						</tr>
					</c:forEach>

				</tbody>
			</table>
					  	<my:paging paging="${paging}" jsfunc="go_list" />
		</div>
	</div>





</body>
</html>