<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!-- Main content -->
<!-- general form elements -->
<div class="container">

	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">LIST ALL PAGE</h3>
		</div>
		<div class="box-body">
			<table class="table table-bordered">
				<tr>
					<th style="width: 10px">BNO</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>REGDATE</th>
					<th style="width: 20px">VIEWCNT</th>
				</tr>
	
				<c:forEach items="${list}" var="boardVO">
					<tr>
						<td>${boardVO.bno}</td>
						<td><a href='/boards/read?bno=${boardVO.bno}'>${boardVO.title}</a></td>
						<td>${boardVO.writer}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td>
						<td><span class="badge bg-red">${boardVO.viewcnt }</span></td>
					</tr>
				</c:forEach>
				
			</table>
			<div align="right">
				<button type="submit" class="writing">글쓰기</button>
				
			</div>
			<script type="text/javascript">
				$(document).ready(function(){
					$(".writing").on("click", function(){
						alert("글을 작성하시겠습니까?")
						
						self.location="/boards/registerPage";
					});
				});
			</script>
		</div>
</div>
</div>

<script>
	
	var result = '${msg}';
	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>