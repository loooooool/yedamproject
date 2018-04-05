<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
</script>
</head>
<body>
	<div class="form-group row">
  		<label class="col-md-3 col-form-label" for="input-normal">제목</label>
   		      <div class="col-md-9">
        	        <input type="text" id="input-normal" name="input-normal" class="form-control" placeholder="Normal" value="${sugt.title}">
              </div>
   </div>

	<div class="form-group row">
		<label class="col-md-3 col-form-label" for="textarea-input">내용</label>
		<div class="col-md-9">
			<textarea id="textarea-input" name="textarea-input" rows="9" class="form-control" placeholder="Content..">${sugt.content}</textarea>
		</div>
	</div>
	<div  align="right" >
		작성일:${sugt.s_date} 조회수 : ${sugt.cnt} 
	</div>
	<div class="card-body" align="right" >
          <a href="getSugtList"> <button type="button" class="btn btn-secondary">목록</button></a>
          <a href="insertSugt"><button type="button" class="btn btn-info">글쓰기</button></a>
          <a href="updateSugtForm?s_no=${sugt.s_no}"><button type="button" class="btn btn-warning" >수정</button></a>
          <a href="deleteSugt?s_no=${sugt.s_no}"><button type="button" class="btn btn-danger" >삭제</button></a>
 	 </div>