<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Custom Login Page</h1>
	<h2><c:out value="${error }"></c:out></h2>
	<h2><c:out value="${logout }"></c:out></h2>
	
	<!-- 실제 로그인의 처리 작업은 /login을 통해 이루어지는데 반드시 POST방식으로 데이터를 전송해야 한다 또한 패스워드를 잘못 입력했을시 자동으로 다시 로그인 페이지로 이동하게 된다.-->
	<form action="/login" method="post">
		<!-- input태그의 name속성은 기본적으로 username과 password속성을 이용한다 -->
		<div>		
			<input type="text" name="username" value="admin">
		</div>
		<div>
			<input type="password" name="password" value="admin">
		</div>	
		<div>
			<input type="submit">
		</div>
		<!-- _csrf.parameterName은 브라우저에서는 _csrf라는 이름으로 처리되고 value의 값은 임의의 값이 지정된다. -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
</body>
</html>