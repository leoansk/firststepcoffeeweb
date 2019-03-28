<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.min.js"></script> 
<!-- 최신버전 제이쿼리  -->
<title>Insert title here</title>
</head>
<body>
	<script language="javascript">
 		function idCheck() {
 			$.ajax({
 				type : "GET",
 				url : "/dystopia/membership/idDupCheck.do",
 				data : {
 					user_id : $("#insertId").val()
 				},
 				success : function(data) {
 					if (data == "0") {
 						alert("사용가능합니다.");
 						document.join.Hid.value = "true";
 					} else {
 						alert("사용불가능합니다.");
 						document.join.Hid.value = "false";
 					}
 				}
 			});
 			console.log("test");
 		}

 		function cwoman() {
 			document.join.hgender.value = document.join.wgender.value;
	}
 		function cman() {
 			document.join.hgender.value = document.join.mgender.value;
 		}

 		function joinCheck() {
 			if (document.join.usname.value.length == 0) {
 				alert("이름을 입력해 주세요.");
 				return false;
 			}
 			if (document.join.usid.value.length == 0) {
 				alert("아이디을 입력해 주세요.");
 				return false;
 			}
 			if (document.join.uspassword.value.length == 0) {
 				alert("비밀번호를 입력해 주세요.");
 				return false;
 			}
 			if (document.join.usbirthday.value.length == 0) {
 				alert("생년월일을 입력해 주세요.");
 				return false;
 			}
 			if (document.join.hgender.value.length == 0) {
 				alert("성별을 선택해 주세요.");
 				return false;
 			}
 			if (document.join.usaddress.value.length == 0) {
 				alert("주소를 입력해 주세요.");
 				return false;
 			}
 			if (document.join.usemail.value.length == 0) {
 				alert("이메일을 입력해 주세요.");
 				return false;
 			}
 			if (document.join.usphone.value.length == 0) {
 				alert("연락처를 입력해 주세요.");
 				return false;
 			}
 			if (document.join.ustreasure.value.length == 0) {
				alert("비밀번호 찾기 힌트를 입력해 주세요.");
 				return false;
 			}
 			if (document.join.uspassword.value != document.join.cpw.value) {
 				alert("비밀번호가 일치하지 않습니다.");
 				return false;
 			}if (document.join.Hid.value == "false") {
 				alert("아이디 중복체크를 해주세요.");
 				return false;
 			}
 		} 
 	</script>

<form:form modelAttribute="UserInfo" action="../membership/insert.do" enctype="multipart/form-data"
	 method="post" name="join" onSubmit="return joinCheck()">
	 <table align="center" class="dystable">
			<tr>
				<td align="center" width="100">이름</td>
				<td width="150"><input type="text" name="usname" class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">ID</td>
				<td width="150"><input type="text" name="usid" id="insertId"
					class="textbox">&nbsp; <input type="button" name="check"
					value="중복체크" onclick="idCheck()" class="myButton"> <input
					type="hidden" name="Hid" /></td>
			</tr>
			<tr>
				<td align="center" width="100">PW</td>
				<td width="150"><input type="password" name="uspassword" size="21"
					class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">PW확인</td>
				<td width="150"><input type="password" name="usage" size="21"
					class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">생년월일</td>
				<td width="150"><input type="text" name="usbirthday"
					class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">성별</td>
				<td width="150"><input type="radio" name="usgender" id="mgender" value="man"
					onclick="cman()" />남 &nbsp; 
				<input type="radio" name="usgender" id="wgender"
					value="woman" onclick="cwoman()" />여 <input type="hidden"
					name="hgender" /></td>
			</tr>
			<tr>
				<td align="center" width="100">주소</td>
				<td width="150"><input type="text" name="usaddress" size="30"
					class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">E-mail</td>
				<td width="150"><input type="text" name="usemail" class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">핸드폰번호</td>
				<td width="150"><input type="text" name="usphone" class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">내 보물1호는?(ID,PW 찾기용)</td>
				<td width="150"><input type="text" name="ustreasure"
					class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">프로필 사진</td>
				<td width="150"><input type="file" name="usphoto" class="textbox" /></td>
			</tr>
			
			<tr align="center">
				<td><input type="submit" value="가입하기" name="join"
					class="myButton" /></td>
				<td><input type="reset" value="취소하기" name="reset"
					class="myButton" /></td>
			</tr>
			</table>
	 </form:form>
</body>
</html>