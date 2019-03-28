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
<link rel="stylesheet" type="text/css" href="../css/DKstyle.css">
<title>Insert title here</title>
</head>
<body>

<h2 align="center">제품비교</h2>
<form:form action="../compare/updateMemo.do" method="post" align="center">
<c:if test="${CHECK_LIST.listSize > 0 }"><!-- 반복 -->
<table align="center" class="pp">
	<tr>
	<c:forEach var="cnt" begin="0" end="${CHECK_LIST.listSize -1 }"><!-- 반복횟수 결정 -->
		<td  width="500">
			<table class="PP">
				<tr>
					<td align="center">
					<table class="imgtable"><tr><td>
						<img alt="제품사진" src="../proimage/${CHECK_LIST.proPhotoList[cnt]}"  width="150">
					</td></tr></table>
			
					</td>	
			
					<td>
						제품명 : ${CHECK_LIST.proNameList[cnt] }<br/>
						모델명 : ${CHECK_LIST.proModelnameList[cnt] }<br/>
						제조사 : ${CHECK_LIST.proMakerList[cnt] }<br/>
						출고가 : ${CHECK_LIST.proPriceList[cnt] }<br/>
						제품 상세 스펙<br/>${CHECK_LIST.proExplainList[cnt] }<br/>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<textarea rows="5" cols="60" class="textbox"  name="CONTENT">${CHECK_LIST.likeMemoList[cnt] }</textarea>
					</td>		<!-- likeMemo	  => getLikeMemo을 찾음 -->
					<input type="hidden"  value="${CHECK_LIST.proNameList[cnt] }" name="proName"/>
				</tr>
			</table>
		</td>
	</c:forEach>
	</tr>
</table>
</c:if>
<br/><br/><br/>
<table align="center">
	<tr><td><input type="submit" class="myButton" value="메모저장"/></td></tr>
</table>
</form:form>

</body>
</html>