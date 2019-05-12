<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
		<div class="login-container">
			<div id="output"></div>
			<div class="avatar"></div>
			<div class="form-box" >
				<form action="/loginPost" method="post" >
					<input type="text" name="id" class="form-control" placeholder="id" > 
					
					<input type="password" name="password" class="from-control" placeholder="password" >
				 	
					<button class="btn btn-info btn-block login" type="submit" >로그인</button>
					<button class="btn btn-info btn-block login" type="button" onclick="location.href='index'">회원가입</button>
				</form>
			</div>
		</div>
	</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>