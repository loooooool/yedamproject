<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<script type="text/javascript">
	$(function() {
		  $("#sdatepicker0").datepicker();
		  $("#edatepicker0").datepicker();
		 });

	var i = 0; //id 인덱스
	var x=0;
	
	function addCard(){
		var unitcard = $("#unitcard"+i);		//복사할 div 고르기
		var unitcard2 = unitcard.clone(); 		//div 복사 
	 
		x= i+1;
		unitcard2.attr('id',"unitcard"+x);
		
		unitcard2.appendTo("#unitcardparent"); //div 추가		
		
		unitcard2.find("#unit"+i).attr('id','unit'+x);
		unitcard2.find("#unit"+x).val(x+1);
		unitcard2.find("#sdatepicker"+i).attr('id',"sdatepicker"+x);
		unitcard2.find("#edatepicker"+i).attr('id',"edatepicker"+x); 
		unitcard2.find("#unitdays"+i).attr('id',"unitdays"+x); 
		
	
		 $("#sdatepicker"+x).removeClass('hasDatepicker').datepicker();
		$("#edatepicker"+x).removeClass('hasDatepicker').datepicker();
		
	
		
		i++;
	}
	
	function removeCard(){
		var last = $("#unitcard"+x);
			
		last.remove();		

		
	};
	
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>

</head>
<body>
	<div class="card">
		<div class="card-header">
			<h2>출석부생성</h2>
		</div>
		<div class="card-body" style="border-bottom: :0px">
			<form action="insertUnit" method="post">
			<div class="form-group row">
				<label class="col-md-3 col-form-label" for="select1">과정</label>
				<div class="col-md-9">
					<select id="selectStudent" name="class_no"  class="form-control">
						<option value="0">과정선택</option>
						<c:forEach items="${classList}" var="cl">
						<option value="${cl.cl_no}">${cl.class_name}</option>
						</c:forEach>					
					</select>
				</div>
			</div>
			
		<hr>
		
			<div class="card" id="unitcardparent">
				<div class="card-body" align="right" >
       		   		<input type="button" class="btn btn-info" onclick="addCard()" value="추가"/>
        		 	<input type="button" class="btn btn-danger" onclick="removeCard()" value="삭제"/>
 				</div>
			
				<!-- -------------------------------------------추가부분------------------------------------------------- -->
				<div class="card-body" id="unitcard0" style="border: 1px solid lightgray:border-bottom:0px">
					
					<div class="form-group row">
						<label class="col-md-3 col-form-label" for="select1">단위번호</label>
						<div class="col-4">
							<input type="text" class="form-control" name="unit" value="1" id="unit0" >
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-md-3 col-form-label" for="select1">단위시작일</label>
						<div class='col-sm-3'>
								<div class='input-group date' >
									<input type='text' class="form-control" name="sdate"  id="sdatepicker0" /> 
									<span class="input-group-addon"> 
									<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
						</div>
					
						<label class="col-md-3 col-form-label" for="select1">단위마지막일</label>
						<div class='col-sm-3'>
								<div class='input-group date' id='datetimepicker1'>
									<input type='text' class="form-control" name="edate" id="edatepicker0" /> 
									<span class="input-group-addon"> 
									<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-md-3 col-form-label" for="select1">수업일수</label>
						<div class="col-4">
							<input type="text" class="form-control" id="unitdays0" name="unitdays" placeholder="수업일수..">
						</div>
					</div>
				
				</div>
				<!-- -------------------------------------------------------------------------------------------- -->
				
			</div>
			
			<div class="card-body" align="right" >
			<input type="submit" class="btn btn-info" value="등록"/>
          	<input type="reset" class="btn btn-danger" value="취소"/>
 	 		</div>






		</form>
		</div>
</div>
			
</body>
</html>