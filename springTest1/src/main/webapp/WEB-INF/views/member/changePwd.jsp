<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<title>changePwd 폼</title>

	<script>
	function check_func() {
		var member_id = document.getElementById("member_id").value;
	    var pwd = document.getElementById("pwd").value;
	    var pwd2 = document.getElementById("pwd2").value;
	    var checkPwd2 = document.getElementById("checkPwd2").value;
	    
	    if(pwd != ""){
	    	alert("현재 비밀번호를 다시 입력하세요.");
	    	return false;
	    }
	    
	    if(pwd2 != checkPwd2 ) {
	        alert("새로운 비밀번호가 일치하지 않습니다.");
	        return false;
	    } else {
	    	alert("비밀번호가 변경되었습니다.");
	       return true;
	    }
	}    
	</script>
</head>
<body>
	<h1>비밀번호 변경</h1>
	<br />
	<form action="changePwd" method="post" id="frm" name="frm"
		onsubmit="return check_func()">
		<input type="hidden" id="member_id" name="member_id" value="${sessionScope.memberVO.member_id}">
		<br />
		<br /> 현재 비밀번호 : <input id="pwd" name="pwd"> <br />
		<br /> 변경할 비밀번호 : <input id="pwd2" name="pwd2"><br />
		<br /> 변경할 비밀번호 확인 : <input id="checkPwd2" name="checkPwd2"><br />
		<br />
		<input type="submit" value="변경" />
		<br />
	</form>


</body>
</html>