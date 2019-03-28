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
<table border="1" width="60%"><!-- �ܰ� ���� -->
<tr><td>
<table width="100%" CELLPADDING="10%"><!-- ��ü ���̺� ����-->
	<tr><td>
		
		<table border="0" rules="none" width="100%"><!-- 1�� ���̺� ���� -->
		<tr><td>
		 <input type="text"  class="textbox"  value="${review_List.rev_title}"  name="title" size="111">
		</td></tr></table><!-- 1�� ���̺� �� -->
	</td></tr>
	
	<tr><td>
		<table border="0"  rules="none" width="100%"><!-- 2�� ���̺� ���� -->
		<tr><td>
		<textarea rows="5"  class="textbox"  cols="113" name="content">${review_List.rev_content}</textarea>
		</td></tr></table><!-- 2�� ���̺� �� -->
	</td></tr>
	
	<tr><td>
		<table border="0" width="100%" CELLPADDING="10%"><!-- 3�� ���̺� ���� -->
		<tr><td rowspan="2" width="50%">
		<img alt="����÷��" src="../img/pic.jpg" width="70">
		</td>
		<td align="left" colspan="2">
		<span>
		<c:if test="${review_List.revck_costeff==1}">
		<input type="checkbox" id="test1" name="revck_costeff" checked>
		</c:if>
		<c:if test="${review_List.revck_costeff==0}">
		<input type="checkbox" id="test1" name="revck_costeff" >
		</c:if>
		������</span>
		<c:if test="${review_List.revch_design==1}">
		<input type="checkbox" id="test1" name="revch_design" checked>
		</c:if>
		<c:if test="${review_List.revch_design==0}">
		<input type="checkbox" id="test1" name="revch_design" >
		</c:if>
		������</span>
		<c:if test="${review_List.revch_performance==1}">
		<input type="checkbox" id="test1" name="revch_performance" checked>
		</c:if>
		<c:if test="${review_List.revch_performance==0}">
		<input type="checkbox" id="test1" name="revch_performance" >
		</c:if>
		����</span>
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
		������</span>
		<abbr title="������ üũ�� �ּ���!!">
		<img alt="��ǳ��" src="../img/qq.jpg" width="25">
		</abbr>
		</td></tr>
		<!-- ������, ������, ����, A/S, ������ -->
		<tr><td align="center" width="25%">
		
		<div id="star"></div>
      <input type="hidden" id="rev_point" name ="setRev_userproductscore" value="3"/>
		</td><td width="25%"><span id="hint"></span></td></tr>
		</table><!-- 3�� ���̺� �� -->
	</td></tr>
	
</table><!-- ��ü ���̺� ��-->
<table width="100%" border="0">
<tr><td width="25%"></td>
<td width="25%"></td>
<td width="25%"></td>
<td width="25%" align="left">
<input type="submit" class="myButton" value="���">
<input type="button"  class="myButton" value="���" onclick="cancelButton()">
</td></tr>
</table>
</td></tr>
</table><!-- �ܰ� �� -->
</form>
</center>
<form action="../product/viewContent.do" name="move">
<input type="hidden" value="${review_List.pro_number}" name="proNum">
</form>
<script type="text/javascript">
        function cancelButton(){
        	if(confirm("���� ����� ���ư��ðڽ��ϱ�?") == true){
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
                ,hints : ['���� ���ƿ�!', '�׳� �׷���', '����', '���ξ�', '�־�!']
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