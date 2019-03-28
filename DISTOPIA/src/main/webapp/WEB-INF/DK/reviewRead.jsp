<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>Insert title here</title>
</head>
<body>
<center>
<c:forEach var="cnt" begin="0" end="${(review_list.listSize -1)}">
<table border="0" width="100%" CELLPADDING="30%">
<tr><td align="center">
<table border="1" width="60%" CELLPADDING="10%" rules="none"> <!-- 전체 테이블 시작-->
<tr>
<td align="center">
<table border="0" width="90%"> <!-- 위 전체 테이블 시작-->
<tr><td>

<table><tr><td><img alt="moon" src="../img/moon_on.png" width="30"></td>
<td><h2>${review_list.rev_userproductscore[cnt] }</h2></td></tr></table>
</td><td></td></tr>
<tr><td colspan="2">
<table border="0" width="100%"> <!-- 타이틀 테이블 시작-->
<tr><td>
<h3>${review_list.rev_title[cnt] }</h3>
</td></tr>
</table> <!-- 타이틀 테이블 끝-->
</td></tr>
<tr><td colspan="2">
<table border="1" width="100%"> <!-- 타이틀 테이블 시작-->
<tr><td>
${review_list.rev_content[cnt] }
</td></tr>
</table> <!-- 타이틀 테이블 끝-->
</td></tr>
<tr><td colspan="2" align="right">단점</td></tr>
</table> <!-- 위 전체 테이블 끝-->
</td>
</tr>
<tr>
<td align="center">
<table border="0" width="90%"> <!-- 아래 전체 테이블 시작-->
<tr>
<td rowspan="3" width="40%"></td>
<td rowspan="3" align="center">
<table border="0" width="100%">
<tr>
<td align="right"><font color="green">
GOOD</font>
<!-- <img alt="down" src="../img/up.png" width="30"> --></td>
<td align="right"><font color="green">BAD</font>
<!-- <img alt="up" src="../img/down.png" width="30"> --></td>
</tr>
</table>
</td>
<td rowspan="3" align="center">
<c:choose> 
<c:when test="${review_list.rev_point[cnt] } < 0}">
</c:when>
<c:when test="${review_list.rev_point[cnt]  == 1}">
<img alt="score1" src="../img/score1.png" width="70"></c:when>
<c:when test="${review_list.rev_point[cnt]  == 2}">
<img alt="score2" src="../img/score2.png" width="70"></c:when>
<c:when test="${review_list.rev_point[cnt]  == 3}">
<img alt="score3" src="../img/score3.png" width="70"></c:when>
<c:when test="${review_list.rev_point[cnt]  == 4}">
<img alt="score4" src="../img/score4.png" width="70"></c:when>
<c:when test="${review_list.rev_point[cnt]  == 5}">
<img alt="score5" src="../img/score5.png" width="70"></c:when>
</c:choose>

</td>
<td colspan="2" align="center">id</td>
<td rowspan="3" align="center">
<table border="1" width="100%"><tr><td>사진</td></tr></table>

</td>
</tr>
<tr>
<td colspan="2" height="33%" align="center">${review_list.rev_date[cnt] }</td>
</tr>
<tr>
<td align="center" height="33%">수정</td>
<td align="center">삭제</td>
</tr>
</table> <!-- 아래 전체 테이블 끝-->
</td>
</tr>
</table> <!-- 전체 테이블 끝-->
</td></tr>
</c:forEach>
</center>


</body>
</html>
