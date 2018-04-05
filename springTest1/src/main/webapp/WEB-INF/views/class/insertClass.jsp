<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과정 등록</title>
<style>
.btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}
</style>

 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	 $("input[type='file']").on('change', function() {
	  var input = $(this);
	  var label = input.val().replace(/\\/g, '/').replace(/.*\//, '');  
	  $("#" + input.data("display-target")).val(label);
	 });
	});
</script>


</head>
<body>
<h2>과정 등록</h2>
<br>
<form action="insertClass" method="post" enctype="multipart/form-data">

  <div class="form-group">
    <label for="exampleInputEmail1">과정명</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
    placeholder="과정명을 입력하세요">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">강의실</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
    placeholder="강의실을 입력하세요">
  </div>
	<div class="form-group">
 	<label for="inputContent">시간표 등록</label>
 <div class="col-sm-10">
  <div class="input-group">
   <input type="text" class="form-control" readonly="" id="attachFile" 
   placeholder="지원되는 파일 양식: jpg, png, gif, pdf, doc, docx, xls, xlsx, ppt, pptx">
   <label class="input-group-btn">
    <span class="btn btn-default btn-file">
     첨부 <input type="file" name="attach_file" data-display-target="attachFile">
    </span>
   </label>
  </div>
 </div>
</div>
<div class="form-group">
    <label for="exampleInputEmail1">총수업시간</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
    placeholder="총 수업시간을 입력하세요">
  </div>
 <div class="form-group">
   <label for="exampleInputEmail1">과정명</label>구분<br>
        <input type="radio" name="myradio">과정평가형 &nbsp; <input type="radio" name="myradio">단위기간형
    </div>
  <input type="submit" class="btn btn-default" value="등록"/>
</form>




</body>
</html>