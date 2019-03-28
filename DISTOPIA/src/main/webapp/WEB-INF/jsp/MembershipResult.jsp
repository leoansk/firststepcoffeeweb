<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>회원가입 결과 페이지</title>
</head>
<body>

<c:set var="id" value="${ID}"/>
	<c:choose>
		<c:when test="${id ne '' || !empty id}">"회원님 환영합니다. *^o^//♥ "</c:when>
		<c:otherwise>"회원가입 실패 ㅠ_ㅜ"</c:otherwise>
	</c:choose>

</body>
</html>