<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>UTOPIA</title>

</head>
<body>
<center>
<br/><br/><br/>
	<h2 align="center">UTOPIA</h2>
	<div align="center">
		<form action="../utopia/Search.do" method="POST">
		<table border="1" class="dystable">
		
			<tr align="center">
				<td>
					<table class="dystable">
						<!-- 		<table border="1" class=table14_3> -->
						<tr class="header">
							<th class="text-left" align="center" width="80">글 번호</th>
							<th class="text-left" align="center" width="200">글 제목</th>
							<th class="text-left" align="center" width="70">작성자</th>
							<th class="text-left" align="center" width="150">작성일</th>
						</tr>
						<tbody class="table-hover">
							<c:if test="${list.listSize > 0 }">
								<c:forEach var="num" begin="0" end="${list.listSize -1}">
									<tr class="record">
										<td align="center">${list.boa_number[num]}</td>
										<td align="center"><a
											href="../utopia/boardReplyread.do?boa_number=${list.boa_number[num]}">${list.boa_title[num]}</a></td>
										<td align="center">${list.us_id[num]}</td>
										<td align="center">${list.boa_date[num]}</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<table  align="right" class="dystable">
						<tr>
						<c:choose>
							<c:when test="${sessionScope.loginId == null }">
							<td><input align="right" class="myButton" type="button"
								value="글쓰기" onclick="location.href='../login/loginShow.do'">
							</td>
							</c:when>
						<c:when test="${sessionScope.loginId!= null }">
							<td><input align="right" class="myButton" type="button"
								value="글쓰기" onclick="location.href='../utopia/utopia1.do'">
							</td>
							</c:when>
							</c:choose>
						</tr>
					</table> 
					<br/><br/>
					<c:if test="${!list.firstPage }">
						<a href="../page/page.do?f_seq=${list.boa_number[0] }">◁</a>
					</c:if> <c:forEach var="page" begin="1" end="${list.pageNum }">
						<a href="../page/page.do?page_no=${page }">${page }</a>
					</c:forEach> <c:if test="${ !list.lastPage }">
						<a
							href="../page/page.do?l_seq=${list.boa_number[list.listSize -1 ] }">▷</a>
					</c:if>
					
				</td>
				</tr>
					<tr align="center">
					<td>글 검색<input type="text" class="textbox"  name="search" size="20">
                        <input type="submit"  class="myButton" size="20" value="검색">
                       &nbsp;&nbsp;&nbsp;&nbsp;  <a href="../page/page.do">목록으로</a></td>
                        
						</tr>
						 
		</table>
			</form>
	</div>
	</center>
</body>
</html>