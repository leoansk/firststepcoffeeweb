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
<!-- <!-- �ֽŹ��� �������� --> -->

<!-- <title>ȸ������ page</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- 	<script language="javascript"> -->
// 		/* function idCheck() {
// 			var id = document.join.ID.value;
// 			if (id == "") {
// 				alert("ID�� �Է��� �ּ���.");
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
// 						alert("��밡���մϴ�.");
// 						document.join.Hid.value = "true";
// 					} else {
// 						alert("���Ұ����մϴ�.");
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
// 				alert("�̸��� �Է��� �ּ���.");
// 				return false;
// 			}
// 			if (document.join.id.value.length == 0) {
// 				alert("���̵��� �Է��� �ּ���.");
// 				return false;
// 			}
// 			if (document.join.pw.value.length == 0) {
// 				alert("��й�ȣ�� �Է��� �ּ���.");
// 				return false;
// 			}
// 			if (document.join.birthday.value.length == 0) {
// 				alert("��������� �Է��� �ּ���.");
// 				return false;
// 			}
// 			if (document.join.hgender.value.length == 0) {
// 				alert("������ ������ �ּ���.");
// 				return false;
// 			}
// 			if (document.join.addr.value.length == 0) {
// 				alert("�ּҸ� �Է��� �ּ���.");
// 				return false;
// 			}
// 			if (document.join.email.value.length == 0) {
// 				alert("�̸����� �Է��� �ּ���.");
// 				return false;
// 			}
// 			if (document.join.phone.value.length == 0) {
// 				alert("����ó�� �Է��� �ּ���.");
// 				return false;
// 			}
// 			if (document.join.treasure.value.length == 0) {
// 				alert("��й�ȣ ã�� ��Ʈ�� �Է��� �ּ���.");
// 				return false;
// 			}
// 			if (document.join.pw.value != document.join.cpw.value) {
// 				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
// 				return false;
// 			}if (document.join.Hid.value == "false") {
// 				alert("���̵� �ߺ�üũ�� ���ּ���.");
// 				return false;
// 			}
// 		}
<!-- 	</script> -->

<!-- 	<!--    <form name="chk"> -->
<!--    <input type="hidden" name="ID"/> -->
<!--    </form> --> -->

<!-- 	<!-- �̹��� �߰����ֱ�! --> -->
<!-- 	<h2 align="center">ȸ������</h2> -->
<%-- 	<form:form modelAttribute="image" action="../membership/insert.do" enctype="multipart/form-data" --%>
<%-- 	 method="post"> --%>
<!-- <!-- 	<form name="join" onSubmit="return joinCheck()" method="post" --> -->
<!-- <!-- 		action="../membership/insert.do"> --> -->
<!-- 		<table align="center" class="dystable"> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">�̸�</td> -->
<!-- 				<td width="150"><input type="text" name="name" class="textbox"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">ID</td> -->
<!-- 				<td width="150"><input type="text" name="id" id="insertId" -->
<!-- 					class="textbox">&nbsp; <input type="button" name="check" -->
<!-- 					value="�ߺ�üũ" onclick="idCheck()" class="myButton"> <input -->
<!-- 					type="hidden" name="Hid" /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">PW</td> -->
<!-- 				<td width="150"><input type="password" name="pw" size="21" -->
<!-- 					class="textbox"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">PWȮ��</td> -->
<!-- 				<td width="150"><input type="password" name="cpw" size="21" -->
<!-- 					class="textbox"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">�������</td> -->
<!-- 				<td width="150"><input type="text" name="birthday" -->
<!-- 					class="textbox"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">����</td> -->
<!-- 				<td width="150"><input type="radio" name="gender" id="mgender" value="man" -->
<!-- 					onclick="cman()" />�� &nbsp;  -->
<!-- 				<input type="radio" name="gender" id="wgender" -->
<!-- 					value="woman" onclick="cwoman()" />�� <input type="hidden" -->
<!-- 					name="hgender" /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">�ּ�</td> -->
<!-- 				<td width="150"><input type="text" name="addr" size="30" -->
<!-- 					class="textbox"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">E-mail</td> -->
<!-- 				<td width="150"><input type="text" name="email" class="textbox"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">�ڵ�����ȣ</td> -->
<!-- 				<td width="150"><input type="text" name="phone" class="textbox"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td align="center" width="100">�� ����1ȣ��?(ID,PW ã���)</td> -->
<!-- 				<td width="150"><input type="text" name="treasure" -->
<!-- 					class="textbox"></td> -->
<!-- 			</tr> -->
<!-- <!-- 			<tr> --> -->
<!-- <!-- 				<td align="center" width="100">������ ����</td> --> -->
<!-- <!-- 				<td width="150"><input type="file" name="photo" class="textbox" /></td> --> -->
<!-- <!-- 			</tr> --> -->
<!-- 			<tr align="center"> -->
<!-- 				<td><input type="submit" value="�����ϱ�" name="join" -->
<!-- 					class="myButton" /></td> -->
<!-- 				<td><input type="reset" value="����ϱ�" name="reset" -->
<!-- 					class="myButton" /></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<%-- </form:form> --%>
<!-- <!-- 	</form> --> -->
		
<!-- <!-- 	<form:form modelAttribute="image" action="../image/imageInput.do" enctype="multipart/form-data" --> -->
<!-- <!-- 	 method="post">���ε�� enctype�� �־���Ѵ� --> -->
<!-- <!--    <div align="center" class="body"> --> -->
<!-- <!--       <table> --> -->
<!-- <!--          <tr> --> -->
<!-- <!--             <td align="center" width="100">��������</td> --> -->
<!-- <!--             <td><input type="file" name="usPhoto"/></td> --> -->
<!-- <!--          </tr> --> -->
<!-- <!--       </table> --> -->
<!-- <!--       <input type="submit" value="���"/> --> -->
<!-- <!--       <input type="reset" value="���"/><br/><br/> --> -->
<!-- <!--       <a href="index.html">���ư���</a> --> -->
<!-- <!--    </div> --> -->

<!-- </body> -->
<!-- </html> -->