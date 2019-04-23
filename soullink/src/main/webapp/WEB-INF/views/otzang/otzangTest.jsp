<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>


<div class="container">
	<h1>Otzang</h1>
	
	<figure>
		<img src="/resources/suit/img/otZangImg_1.jpg">
	</figure>
</div>

<input type="button" class="btn" id="popupBtn" value="POPUP">


<form action="/otzang/exUploadPost" method="post" enctype="multiPART/form-data">
	<div>
		<input type="file" name="files">
	</div>
	<div>
		<input type="file" name="files">
	</div>
	<div>
		<input type="file" name="files">
	</div>
	<div>
		<input type="submit">
	</div>
</form>



<script>
	
	function showbrowserInfo(){
		var info;
		info += "navigator.appName";
		document.write(info);
	}
	/* 오늘부터 파라미터로 전달받은 날짜에 대한 d'day를 계산하여 리턴한다. */ 
	function getDday(y, m, d) {
		// 오늘 날짜
		var today = new Date();
		// 파라미터로 받은 날짜
		// 정상적인 날짜값을 받은 경우, Javascript의 객체에 전달할 때는 "-1"처리해 주어야 한다.
		var dday = new Date(y, m-1, d);
		// 두 날짜간의 차이를 구한다.
		var cnt = dday.getTime() - today.getTime();
		// 남은 날짜는 1시간이라도 1일로 계산해야 하므로, 연산결과를 올림한다.
		var n = Math.ceil(cnt / (24 * 60 * 60 * 1000));
		return n; 
	}
	// 매년 12월 31일까지의 남은 날짜 계산하기
	var date = new Date();
	var y = date.getFullYear();
	// "-1"을 하지 않은 정상적인 날짜를 전달하도록 구현하자.
	var dday = getDday(y, 12, 31);
	document.write("<h1>올해는 앞으로 " + dday + "일 남았습니다.</h1>");
	
</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>