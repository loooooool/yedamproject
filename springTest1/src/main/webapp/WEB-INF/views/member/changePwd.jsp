<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<title>changePwd 폼</title>

	<script>
	function input_check_func() {
		var member_id = document.getElementById("member_id").value;
	    var pwd = document.getElementById("pwd").value;
	    var pwd2 = document.getElementById("pwd2").value;
	    var checkPwd2 = document.getElementById("checkPwd2").value;
	    
	    if(pwd == null || pwd2 == null || checkPwd2 == null ||
	       pwd == ""   || pwd2 == ""   || checkPwd2 == "") {
	        alert("공백은 허용치 않는다");
	        return;
	    } 
	    //지금 비밀번호를 잘못 입력한 경우
	    else if ( pwd != pwd ) {
	    	alert("현재 비밀번호를 잘못 입력하셨습니다.")
	    	return false;
	    } 
	    // 새로운 비밀번호와 새로운 비밀번호 확인 input에 적은 값이 다르다면 경고창을 띄우고 false를 반환해서 action을 막는다
	    else if ( pwd2 != checkPwd2 ) {
	        alert("새로운 비밀번호가 일치하지 않습니다.");
	        return false;
	    } else {
	        return true;
	        document.frm.submit();
	        console.log("fffffffffffffffffffffff"); 
	    }
	}    
	</script>
</head>
<body>
	<h1>비밀번호 변경</h1>
	<br />
	<form action="changePwd" method="post" id="frm" name="frm">
		<!-- onsubmit="return input_check_func()" -->
		<input type="hidden" name="member_id" value="${sessionScope.memberVO.member_id}">
		<br />
		<br /> 현재 비밀번호 : <input id="pwd" name="pwd"> <br />
		<br /> 변경할 비밀번호 : <input id="pwd2" name="pwd2"><br />
		<br /> 변경할 비밀번호 확인 : <input id="checkPwd2" name="checkPwd2"><br />
		<br />
		<input type="submit" value="변경" onclick="input_check_func();"/>
		<br />
	</form>


</body>
</html>