<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>ID,PW ã�� ��_����1ȣ �Է�â</title>
</head>
<body>
	<h2 align="center">${what} ã��</h2>
	<br>
	<form action="../idpwfind/view.do" method="post" >
		<input type="hidden" value="${what}" name="idOrPw">
		<table align="center" class="dystable">
			<tr>
				<td>�� ���� 1ȣ��?(���Խ� �Է��� ��)</td>
			</tr>
			<tr>
				<td height="30" align="center"><input type="text" name="treasure" class="textbox" ></td>
			</tr>
			<tr>
				<td height="30" align="center"><input type="submit" value="ã��" class="myButton"></td>
			</tr>
		</table>
	</form>
</body>
</html>