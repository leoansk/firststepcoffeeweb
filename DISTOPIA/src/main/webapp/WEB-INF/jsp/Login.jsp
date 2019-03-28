<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>Login page</title>
</head>
<body>
	<form action="../login/loginButtonClick.do" method="post" onsubmit="return checking(this)" name="loginForm">
	<h2 align="center" >WELCOME TO DYSTOPIA!</h2><br><br>
		<table align="center" class="dystable">
			<tr>
				<td width="60" height="30">ID</td>
				<td><input type="text" name="id" size="20" onfocus="get_focus(this)" class="textbox" ></td>
			</tr>
			<tr>
				<td width="60" height="30">PW</td>
				<td><input type="password" name="pw" size="21" onblur="lost_focus(this)" class="textbox" ></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					${errorMessage}
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="100">
               <input type="submit" value="LOGIN" name="login" class="myButton">&nbsp;
               <input type="button" value="JOIN" name="join" onclick="location.href='joinShow.do'" class="myButton">
            </td>
			</tr>
			</form>
			<tr>
				<td colspan="2" align="center">
					<a href="../idpwfind/confirm.do?page=idPwFind.jsp&what=ID">ID찾기</a> &nbsp; 
					<a href="../idpwfind/confirm.do?page=idPwFind.jsp&what=PW">PW찾기</a>
				</td>
			</tr>
		</table>
</body>
</html>