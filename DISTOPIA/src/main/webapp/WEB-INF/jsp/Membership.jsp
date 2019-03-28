<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR" --%>
<%-- 	pageEncoding="EUC-KR"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%-- <%@ include file="/WEB-INF/KJMJSP/header.jsp" %> --%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/style.css"> -->
<!-- <script type="text/javascript" -->
<!-- 	src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<!-- <!-- 최신버전 제이쿼리 --> -->

<!-- <title>회원가입 page</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- 	<script language="javascript"> -->
// 		/* function idCheck() {
// 			var id = document.join.ID.value;
// 			if (id == "") {
// 				alert("ID를 입력해 주세요.");
// 				return;
// 			}
// 			url = "idCheck.jsp?id=" + id;
// 			window.open(url, "", "width=300, height=100");
// 		} */

// 		function idCheck() {
// 			$.ajax({
// 				type : "GET",
// 				url : "dystopiaDK_ver_2/membership/idDupCheck.do",
// 				data : {
// 					user_id : $("#insertId").val()
// 				},
// 				success : function(data) {
// 					if (data == "0") {
// 						alert("사용가능합니다.");
// 						document.join.Hid.value = "true";
// 					} else {
// 						alert("사용불가능합니다.");
// 						document.join.Hid.value = "false";
// 					}
// 				}
// 			});
// 			console.log("test");
// 		}

// 		function cwoman() {
// 			document.join.hgender.value = document.join.wgender.value;
// 		}
// 		function cman() {
// 			document.join.hgender.value = document.join.mgender.value;
// 		}

// 		function joinCheck() {
// 			if (document.join.name.value.length == 0) {
// 				alert("이름을 입력해 주세요.");
// 				return false;
// 			}
// 			if (document.join.id.value.length == 0) {
// 				alert("아이디을 입력해 주세요.");
// 				return false;
// 			}
// 			if (document.join.pw.value.length == 0) {
// 				alert("비밀번호를 입력해 주세요.");
// 				return false;
// 			}
// 			if (document.join.birthday.value.length == 0) {
// 				alert("생년월일을 입력해 주세요.");
// 				return false;
// 			}
// 			if (document.join.hgender.value.length == 0) {
// 				alert("성별을 선택해 주세요.");
// 				return false;
// 			}
// 			if (document.join.addr.value.length == 0) {
// 				alert("주소를 입력해 주세요.");
// 				return false;
// 			}
// 			if (document.join.email.value.length == 0) {
// 				alert("이메일을 입력해 주세요.");
// 				return false;
// 			}
// 			if (document.join.phone.value.length == 0) {
// 				alert("연락처를 입력해 주세요.");
// 				return false;
// 			}
// 			if (document.join.treasure.value.length == 0) {
// 				alert("비밀번호 찾기 힌트를 입력해 주세요.");
// 				return false;
// 			}
// 			if (document.join.pw.value != document.join.cpw.value) {
// 				alert("비밀번호가 일치하지 않습니다.");
// 				return false;
// 			}if (document.join.Hid.value == "false") {
// 				alert("아이디 중복체크를 해주세요.");
// 				return false;
// 			}
// 		}
<!-- 	</script> -->

<!-- 	<!--    <form name="chk"> -->
<!--    <input type="hidden" name="ID"/> -->
<!--    </form> --> -->

<!-- 	<!-- 이미지 추가해주기! --> -->
<!-- 	<h2 align="center">회원가입</h2> -->
<%-- 	<form:form modelAttribute="image" action="../membership/insert.do" enctype="multipart/form-data" --%>
<%-- 	 method="post"> --%>
<!-- <!-- 	<form name="join" onSubmit="return joinCheck()" method="post" --> -->
<!-- <!-- 		action="../membership/insert.do"> --> -->
<!-- 		<table align="center" class="dystable"> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">이름</td> -->
<!-- 				<td width="150"><input type="text" name="name" class="textbox"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">ID</td> -->
<!-- 				<td width="150"><input type="text" name="id" id="insertId" -->
<!-- 					class="textbox">&nbsp; <input type="button" name="check" -->
<!-- 					value="중복체크" onclick="idCheck()" class="myButton"> <input -->
<!-- 					type="hidden" name="Hid" /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">PW</td> -->
<!-- 				<td width="150"><input type="password" name="pw" size="21" -->
<!-- 					class="textbox"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">PW확인</td> -->
<!-- 				<td width="150"><input type="password" name="cpw" size="21" -->
<!-- 					class="textbox"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">생년월일</td> -->
<!-- 				<td width="150"><input type="text" name="birthday" -->
<!-- 					class="textbox"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">성별</td> -->
<!-- 				<td width="150"><input type="radio" name="gender" id="mgender" value="man" -->
<!-- 					onclick="cman()" />남 &nbsp;  -->
<!-- 				<input type="radio" name="gender" id="wgender" -->
<!-- 					value="woman" onclick="cwoman()" />여 <input type="hidden" -->
<!-- 					name="hgender" /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">주소</td> -->
<!-- 				<td width="150"><input type="text" name="addr" size="30" -->
<!-- 					class="textbox"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">E-mail</td> -->
<!-- 				<td width="150"><input type="text" name="email" class="textbox"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">핸드폰번호</td> -->
<!-- 				<td width="150"><input type="text" name="phone" class="textbox"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">내 보물1호는?(ID,PW 찾기용)</td> -->
<!-- 				<td width="150"><input type="text" name="treasure" -->
<!-- 					class="textbox"></td> -->
<!-- 			</tr> -->
<!-- <!-- 			<tr> --> -->
<!-- <!-- 				<td align="center" width="100">프로필 사진</td> --> -->
<!-- <!-- 				<td width="150"><input type="file" name="photo" class="textbox" /></td> --> -->
<!-- <!-- 			</tr> --> -->
<!-- 			<tr align="center"> -->
<!-- 				<td><input type="submit" value="가입하기" name="join" -->
<!-- 					class="myButton" /></td> -->
<!-- 				<td><input type="reset" value="취소하기" name="reset" -->
<!-- 					class="myButton" /></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<%-- </form:form> --%>
<!-- <!-- 	</form> --> -->
		
<!-- <!-- 	<form:form modelAttribute="image" action="../image/imageInput.do" enctype="multipart/form-data" --> -->
<!-- <!-- 	 method="post">업로드는 enctype이 있어야한다 --> -->
<!-- <!--    <div align="center" class="body"> --> -->
<!-- <!--       <table> --> -->
<!-- <!--          <tr> --> -->
<!-- <!--             <td align="center" width="100">사진저장</td> --> -->
<!-- <!--             <td><input type="file" name="usPhoto"/></td> --> -->
<!-- <!--          </tr> --> -->
<!-- <!--       </table> --> -->
<!-- <!--       <input type="submit" value="등록"/> --> -->
<!-- <!--       <input type="reset" value="취소"/><br/><br/> --> -->
<!-- <!--       <a href="index.html">돌아가기</a> --> -->
<!-- <!--    </div> --> -->

<!-- </body> -->
<!-- </html> -->