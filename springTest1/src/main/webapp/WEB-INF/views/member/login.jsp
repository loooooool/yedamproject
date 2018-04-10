<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<title>로그인 페이지</title>
<!--  로그인 성공,실패 알림 -->

<script>
$(document).ready(function(){
    $("#btnLogin").click(function(){
        // 태크.val() : 태그에 입력된 값
        // 태크.val("값") : 태그의 값을 변경 
        var member_id = $("#member_id").val();
        var pwd = $("#pwd").val();
        
        if(member_id == ""){
            alert("아이디를 입력하세요.");
            $("#member_id").focus(); // 입력포커스 이동
            return; // 함수 종료
        }
        if(pwd == ""){
            alert("비밀번호를 입력하세요.");
            $("#pwd").focus();
            return;
        }
        // 폼 내부의 데이터를 전송할 주소
        document.form1.action="${path}/member/loginCheck.do"
        // 제출
        document.form1.submit();
    });
});
</script>

</head>
<body>
	
	   <form action="login" name="form1" method="post">
        <table border="1" width="400px">
            <tr>
                <td>아이디</td>
                <td><input name="member_id" id="member_id"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pwd" id="pwd"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" id="btnLogin">로그인</button>
                <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
                <c:if test="${msg == 'logout'}">
                    <div style="color: red">
                        로그아웃되었습니다.
                    </div>
                </c:if>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>