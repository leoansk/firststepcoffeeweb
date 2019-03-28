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
<!-- �ֽŹ��� ��������  -->
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
 						alert("��밡���մϴ�.");
 						document.join.Hid.value = "true";
 					} else {
 						alert("���Ұ����մϴ�.");
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
 				alert("�̸��� �Է��� �ּ���.");
 				return false;
 			}
 			if (document.join.usid.value.length == 0) {
 				alert("���̵��� �Է��� �ּ���.");
 				return false;
 			}
 			if (document.join.uspassword.value.length == 0) {
 				alert("��й�ȣ�� �Է��� �ּ���.");
 				return false;
 			}
 			if (document.join.usbirthday.value.length == 0) {
 				alert("��������� �Է��� �ּ���.");
 				return false;
 			}
 			if (document.join.hgender.value.length == 0) {
 				alert("������ ������ �ּ���.");
 				return false;
 			}
 			if (document.join.usaddress.value.length == 0) {
 				alert("�ּҸ� �Է��� �ּ���.");
 				return false;
 			}
 			if (document.join.usemail.value.length == 0) {
 				alert("�̸����� �Է��� �ּ���.");
 				return false;
 			}
 			if (document.join.usphone.value.length == 0) {
 				alert("����ó�� �Է��� �ּ���.");
 				return false;
 			}
 			if (document.join.ustreasure.value.length == 0) {
				alert("��й�ȣ ã�� ��Ʈ�� �Է��� �ּ���.");
 				return false;
 			}
 			if (document.join.uspassword.value != document.join.cpw.value) {
 				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
 				return false;
 			}if (document.join.Hid.value == "false") {
 				alert("���̵� �ߺ�üũ�� ���ּ���.");
 				return false;
 			}
 		} 
 	</script>

<form:form modelAttribute="UserInfo" action="../membership/insert.do" enctype="multipart/form-data"
	 method="post" name="join" onSubmit="return joinCheck()">
	 <table align="center" class="dystable">
			<tr>
				<td align="center" width="100">�̸�</td>
				<td width="150"><input type="text" name="usname" class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">ID</td>
				<td width="150"><input type="text" name="usid" id="insertId"
					class="textbox">&nbsp; <input type="button" name="check"
					value="�ߺ�üũ" onclick="idCheck()" class="myButton"> <input
					type="hidden" name="Hid" /></td>
			</tr>
			<tr>
				<td align="center" width="100">PW</td>
				<td width="150"><input type="password" name="uspassword" size="21"
					class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">PWȮ��</td>
				<td width="150"><input type="password" name="usage" size="21"
					class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">�������</td>
				<td width="150"><input type="text" name="usbirthday"
					class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">����</td>
				<td width="150"><input type="radio" name="usgender" id="mgender" value="man"
					onclick="cman()" />�� &nbsp; 
				<input type="radio" name="usgender" id="wgender"
					value="woman" onclick="cwoman()" />�� <input type="hidden"
					name="hgender" /></td>
			</tr>
			<tr>
				<td align="center" width="100">�ּ�</td>
				<td width="150"><input type="text" name="usaddress" size="30"
					class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">E-mail</td>
				<td width="150"><input type="text" name="usemail" class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">�ڵ�����ȣ</td>
				<td width="150"><input type="text" name="usphone" class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">�� ����1ȣ��?(ID,PW ã���)</td>
				<td width="150"><input type="text" name="ustreasure"
					class="textbox"></td>
			</tr>
			<tr>
				<td align="center" width="100">������ ����</td>
				<td width="150"><input type="file" name="usphoto" class="textbox" /></td>
			</tr>
			
			<tr align="center">
				<td><input type="submit" value="�����ϱ�" name="join"
					class="myButton" /></td>
				<td><input type="reset" value="����ϱ�" name="reset"
					class="myButton" /></td>
			</tr>
			</table>
	 </form:form>
</body>
</html>