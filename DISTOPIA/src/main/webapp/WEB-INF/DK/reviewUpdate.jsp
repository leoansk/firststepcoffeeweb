<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/jquery.raty.js"></script>
</head>
<body>
<center>
<form action="../review/update.do" method="post">
<input type="hidden" value="${review_List.pro_number}" name="pro_number">
<input type="hidden" value="${review_List.us_number}"  name="us_number">
<input type="hidden" value="${review_List.rev_number}" name="rev_number">
<input type="hidden" value="${review_List.rev_point}" name="rev_point">
<table border="1" width="60%"><!-- 외각 시작 -->
<tr><td>
<table width="100%" CELLPADDING="10%"><!-- 전체 테이블 시작-->
	<tr><td>
		
		<table border="0" rules="none" width="100%"><!-- 1번 테이블 시작 -->
		<tr><td>
		 <input type="text"  class="textbox"  value="${review_List.rev_title}"  name="title" size="111">
		</td></tr></table><!-- 1번 테이블 끝 -->
	</td></tr>
	
	<tr><td>
		<table border="0"  rules="none" width="100%"><!-- 2번 테이블 시작 -->
		<tr><td>
		<textarea rows="5"  class="textbox"  cols="113" name="content">${review_List.rev_content}</textarea>
		</td></tr></table><!-- 2번 테이블 끝 -->
	</td></tr>
	
	<tr><td>
		<table border="0" width="100%" CELLPADDING="10%"><!-- 3번 테이블 시작 -->
		<tr><td rowspan="2" width="50%">
		<img alt="사진첨부" src="../img/pic.jpg" width="70">
		</td>
		<td align="left" colspan="2">
		<span>
		<c:if test="${review_List.revck_costeff==1}">
		<input type="checkbox" id="test1" name="revck_costeff" checked>
		</c:if>
		<c:if test="${review_List.revck_costeff==0}">
		<input type="checkbox" id="test1" name="revck_costeff" >
		</c:if>
		가성비</span>
		<c:if test="${review_List.revch_design==1}">
		<input type="checkbox" id="test1" name="revch_design" checked>
		</c:if>
		<c:if test="${review_List.revch_design==0}">
		<input type="checkbox" id="test1" name="revch_design" >
		</c:if>
		디자인</span>
		<c:if test="${review_List.revch_performance==1}">
		<input type="checkbox" id="test1" name="revch_performance" checked>
		</c:if>
		<c:if test="${review_List.revch_performance==0}">
		<input type="checkbox" id="test1" name="revch_performance" >
		</c:if>
		성능</span>
		<c:if test="${review_List.revch_as==1}">
		<input type="checkbox" id="test1" name="revch_as" checked>
		</c:if>
		<c:if test="${review_List.revch_as==0}">
		<input type="checkbox" id="test1" name="revch_as" >
		</c:if>
		A/S</span>
		<c:if test="${review_List.revch_durability==1}">
		<input type="checkbox" id="test1" name="revch_durability" checked>
		</c:if>
		<c:if test="${review_List.revch_durability==0}">
		<input type="checkbox" id="test1" name="revch_durability" >
		</c:if>
		내구성</span>
		<abbr title="단점을 체크해 주세요!!">
		<img alt="말풍선" src="../img/qq.jpg" width="25">
		</abbr>
		</td></tr>
		<!-- 가성비, 디자인, 성능, A/S, 내구성 -->
		<tr><td align="center" width="25%">
		
		<div id="star"></div>
      <input type="hidden" id="rev_point" name ="setRev_userproductscore" value="3"/>
		</td><td width="25%"><span id="hint"></span></td></tr>
		</table><!-- 3번 테이블 끝 -->
	</td></tr>
	
</table><!-- 전체 테이블 끝-->
<table width="100%" border="0">
<tr><td width="25%"></td>
<td width="25%"></td>
<td width="25%"></td>
<td width="25%" align="left">
<input type="submit" class="myButton" value="등록">
<input type="button"  class="myButton" value="취소" onclick="cancelButton()">
</td></tr>
</table>
</td></tr>
</table><!-- 외각 끝 -->
</form>
</center>
<form action="../product/viewContent.do" name="move">
<input type="hidden" value="${review_List.pro_number}" name="proNum">
</form>
<script type="text/javascript">
        function cancelButton(){
        	if(confirm("리뷰 보기로 돌아가시겠습니까?") == true){
        		document.move.submit();
        	}else{
        		return;
        	}
        }
        var point = ${review_List.rev_userproductscore};
        $(function() {
            $('div#star').raty({
                score: point
                ,path : "../img"
                ,width : 200
                ,starOff : 'moon_off.png'
                ,starOn  : 'moon_on.png'
                ,target : '#hint'
                ,hints : ['정말 좋아요!', '그냥 그래요', '보통', '별로야', '최악!']
                ,click: function(score, evt) {
                    $("#rev_point").val(score);
                }
            });
            $("input:checkbox").on('click', function() {
            	
            });
        });
    </script>
</body>
</html>