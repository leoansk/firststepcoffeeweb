<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ include file="/WEB-INF/KJMJSP/header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/>
<form:form modelAttribute="image" action="../image/imageInput.do" enctype="multipart/form-data" method="post"><!-- ���ε�� enctype�� �־���Ѵ� -->
	<div align="center" class="body">
		<table class="dystable">
			<tr>
				<td align="center" width="100">��������</td>
				<td><input class="textbox"type="file" name="usPhoto"/></td>
			</tr>
		</table>
		<br/><br/><br/>
		<input type="submit" class="myButton"  value="���"/>&nbsp;&nbsp;
		<input type="reset" class="myButton"  value="���"/><br/><br/>
		<a href="../users/read.do">���ư���</a>
	</div>
</form:form>

<%-- 
<form:form id="testForm" commandName="testFileUpload" method="post" enctype="multipart/form-data" cssClass="cleanform">
<form:input path="uploadFile" type="file" />
<button type="submit">Submit</button>
</form:form>
--%>

</body>
</html>