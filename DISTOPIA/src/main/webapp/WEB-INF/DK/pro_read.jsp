<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/DKstyle.css">
<title>상품 조회</title>
</head>
<body>
<center><h1>${title } 조회</h1></center>
<c:if test="${Product_LIST.listSize==0 }">
<center><h2>아직 등록된 상품이 없습니다.</h2></center>
</c:if>
<c:if test="${Product_LIST.listSize>0 }">
<center>
<table class="pp" width="100%" CELLPADDING="10%">
	<c:set var="doing" value="true"/>
	<c:forEach var="cnt" begin="0" end="${(Product_LIST.listSize -1)/5+1}">
		<tr>
		<c:forEach var="n" begin="0" end="4">
			<c:if test="${doing}">
<!--------------------  ---------------------------------------->			
<!-- 뷰 설정 -->			
			<td valign="bottom">
			<table  align="center"class="pricing" width="30%" height="50">
			<tr><td>
			<table class="imgtable">
			<tr><td>
			<a href="../product/viewContent.do?proNum=
			${Product_LIST.pro_number[cnt*5+n]}">
			<img alt="제품사진" src="../proimage/${Product_LIST.pro_photo[cnt*5+n]}"  width="150"></a>
			</td></tr>
			</table>
			</td></tr>
			<tr><td>
			<table   rules="none" >			
			<tr><td align="center" rowspan="2" width="70" height="70">
			<c:choose> 
			<c:when test="${Product_LIST.pro_avgscore[cnt*5+n] < 0}">
			<img alt="score1" src="../img/sco.png" width="70">
			</c:when>
			<c:when test="${Product_LIST.pro_avgscore[cnt*5+n] == 1}">
			<img alt="score1" src="../img/poison1.png" width="70"></c:when>
			<c:when test="${Product_LIST.pro_avgscore[cnt*5+n] == 2}">
			<img alt="score2" src="../img/poison2.png" width="70"></c:when>
			<c:when test="${Product_LIST.pro_avgscore[cnt*5+n] == 3}">
			<img alt="score3" src="../img/poison3.png" width="70"></c:when>
			<c:when test="${Product_LIST.pro_avgscore[cnt*5+n] == 4}">
			<img alt="score4" src="../img/poison4.png" width="70"></c:when>
			<c:otherwise><img alt="score5" src="../img/poison5.png"  width="70"></c:otherwise>
			</c:choose></td>
			<td width="50%" valign="bottom">${Product_LIST.pro_name[cnt*5+n]}</td> 
			<tr><td>${Product_LIST.pro_modelname[cnt*5+n]}</td></tr>
			</table>
			</td></tr>
			</table>
			</td>
			
<!--------------------  ---------------------------------------->			
<!-- 범위지정 -->
			<c:if test="${cnt*5+n==(Product_LIST.listSize-1)}">
			<c:set var="doing" value="false"/></c:if>
<!--------------------  ---------------------------------------->
			</c:if>
		</c:forEach>
		</tr>
	</c:forEach>
</table>
</c:if>
<h3><a href="../index/main.do">처음으로</a></h3>
</center>
</body>
</html>