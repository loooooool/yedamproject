<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.buttons{
	display:inline-block;
	width:88%;
	align:right;
}
</style>
<script>
window.onload = function() {
	loadCommentList();  // 목록조회 ajax 요청
}

var context='${pageContext.request.contextPath}';

//목록조회 요청
function loadCommentList() {
	var params ={parent_no : '${sugt.s_no}'}
	$.getJSON(context+"/getCommentsList",params,function(datas){
		for(i=0; i<datas.length;i++){
			$("#commentList").append(makeCommentView(datas[i]) );
		}
	})
}

//div 생성 
function makeCommentView(comment){
	var div = document.createElement("div"); 
	div.setAttribute("id", "c"+comment.co_no);
	div.className = 'comment';
	div.comment = comment;  //{id:1,.... }
	
	var str = "익명 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; " + "<span class=\"buttons\">" + comment.content +"</span>" 
	var str2 = ""
	if("${sessionScope.memberVO.member_id}"== comment.member_id){
	 str2 = "<input type=\"button\" class=\"btn btn-\" value=\"수정\" onclick=\"viewUpdateForm('"+comment.co_no+"')\"/>"+"&nbsp"
			  +"<input type=\"button\" class=\"btn btn-danger\" value=\"삭제\" onclick=\"confirmDeletion('"+comment.co_no+"')\"/><hr>"
			  }
	
	div.innerHTML = str+str2;
	return div;
}

 //댓글 등록
function addComment(){
	var param =$("[name='addForm']").serialize();
	$.getJSON(context+"/insertComments", param, function(datas){
		$("#commentList").append(makeCommentView(datas) );
		document.addForm.reset();
	})
}

//댓글삭제
function confirmDeletion(co_no){
	if(confirm("삭제하시겠습니까?")){
		var param={co_no : co_no}
		$.getJSON(context+"/deleteComments",param,function(){
			$("#c"+co_no).remove();		
		})
	}
}

function viewUpdateForm(commentId) {
	var commentDiv = document.getElementById('c'+commentId);
	var updateFormDiv = document.getElementById('commentUpdate');
	//현재 수정상태(수정폼이 보이고 있음)이면 수정폼이 보이게 할 필요 없음
	if (updateFormDiv.parentNode != commentDiv) {
		commentDiv.appendChild(updateFormDiv);  //수정폼을 수정할 댓글밑에 보이도록
	}
	//수정할 값을 텍스트필드에 보이게
	var comment = commentDiv.comment;   //댓글 객체 { id:'', content:'', name:'' }
	document.updateForm.co_no.value = comment.co_no;    
	document.updateForm.member_id.value = comment.member_id;
	document.updateForm.content.value = comment.content;
	updateFormDiv.style.display = '';   //수정폼 보이게
}

//댓글 수정
function updateComment(){
	var param=$("[name='updateForm']").serialize();
	$.getJSON(context+"/updateComments", param, function(datas){
		
		var newDiv = makeCommentView(datas);
		var oldDiv = $("#c"+datas.co_no);
		
		document.updateForm.reset();	//폼 필드 클리어
		$("#comments").append($("#commentUpdate")); //수정폼 div를 이동
		$("#commentUpdate").hide(); //수정 폼div 바디로 이동
		$(newDiv).replaceAll(oldDiv); //수정된 div 교체
	})
} 

</script>


</head>



<body>

<div class="card-body">
	<div class="form-group row">
  		<label class="col-md-3 col-form-label" for="input-normal">제목</label>
   		      <div class="col-md-9">
        	        <input type="text" disabled=disabled id="input-normal" name="input-normal" class="form-control" placeholder="Normal" value="${sugt.title}" style="background-color:white;">
              </div>
   </div>

	<div class="form-group row">
		<label class="col-md-3 col-form-label" for="textarea-input">내용</label>
		<div class="col-md-9">
			<textarea id="textarea-input" name="textarea-input" rows="9" disabled=disabled class="form-control" placeholder="Content.." style="background-color:white;">${sugt.content}</textarea>
		</div>
	</div>
	<div  align="right" >
		작성일: ${sugt.s_date} 조회수 : ${sugt.cnt} 
	</div>
	<div class="card-body" align="right" >
          <a href="getSugtList" class="btn btn-secondary"> 목록</a>
          
          <c:if test="${sessionScope.memberVO.member_id == sugt.member_id}">
          <a href="updateSugtForm?s_no=${sugt.s_no}" class="btn btn-warning">수정</a>
          <a href="deleteSugt?s_no=${sugt.s_no}" class="btn btn-danger">삭제</a>
          </c:if>
 	 </div>
 	
 	<hr>
 	
 	<div id="comments" >
 		<div id="commentList"></div>
 			<div id="commentAdd">
	 			<form action="" name="addForm"> 
	 			<!-- 댓글등록폼 -->
	 				<input type="hidden" name="parent_no" value="${sugt.s_no}"> 
					<input type="hidden" name="member_id" value="${sessionScope.memberVO.member_id}" /> 
	 				<div class="form-group row">
						<label class="col-md-3 col-form-label" for="textarea-input">댓글</label>
						<div class="col-md-9">
						<textarea id="textarea-input" name="content" rows="4" class="form-control" placeholder="Content.."></textarea>
						</div>	
					</div>
						<div class="card-body" align="right" >
							<input type="button" value="등록" class="btn btn-info" onclick="addComment()" />
						</div>
				</form>
			</div>
			
			<div id="commentUpdate" style="display: none">
	 			<form action="" name="updateForm">
	 				<input type="hidden" name="parent_no" value="${sugt.s_no}"> 
					<input type="hidden" name="co_no" value="" /> 
					<input type="hidden" name="member_id" value="" /> 
					
	 				<div class="form-group row">
						<label class="col-md-3 col-form-label" for="textarea-input">댓글</label>
						<div class="col-md-9">
						<textarea id="textarea-input" name="content" rows="4" class="form-control" placeholder="Content..">${sugt.content}</textarea>
						</div>	
					</div>
						<div class="card-body" align="right" >
							<input type="button" value="등록" class="btn btn-info" onclick="updateComment()" />
							<input type="button" value="취소" class="btn btn-danger"onclick="cancelUpdate()" />
						</div>
				</form>
			</div>
			
</div>
	</div>

 	
 	
 	 