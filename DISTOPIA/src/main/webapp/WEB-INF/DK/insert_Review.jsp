<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<h1>${title }</h1>
<form action="../review/insert.do" method="post">
<table border="1" width="60%"><!-- �ܰ� ���� -->
<tr><td>
<table width="100%" CELLPADDING="10%"><!-- ��ü ���̺� ����-->
	<tr><td>
	
		<table border="0" rules="none" width="100%"><!-- 1�� ���̺� ���� -->
		<tr><td>
		 <input type="text" class="textbox"  value="Title"  name="TITLE" size="111" 
		 onfocus="if(this.value=='Title'){this.value=''}" 
		 onblur="if(this.value =='') this.value='Title';">
		</td></tr></table><!-- 1�� ���̺� �� -->
	</td></tr>
	
	<tr><td>
		<table border="0" rules="none" width="100%"><!-- 2�� ���̺� ���� -->
		<tr><td>
		<textarea rows="5" cols="113" name="CONTENT" 
		onclick="if(this.value=='���並 �Է��ϼ���'){this.value=''}">���並 �Է��ϼ���</textarea>
		</td></tr></table><!-- 2�� ���̺� �� -->
	</td></tr>
	
	<tr><td>
		<table border="0" rules="none" width="100%" CELLPADDING="10%"><!-- 3�� ���̺� ���� -->
		<tr><td rowspan="2">
		<img alt="����÷��" src="../img/pic.jpg" width="70">
		</td>
		<td align="center">������&nbsp;&nbsp;&nbsp; ������&nbsp;&nbsp;&nbsp; 
		����&nbsp;&nbsp;&nbsp; A/S&nbsp;&nbsp;&nbsp; ������</td></tr>
		<tr><td align="center">
		
		<div id="star"></div><span id="hint"></span>
        
            
       
       
		
		</td></tr>
		</table><!-- 3�� ���̺� �� -->
	</td></tr>
	
</table><!-- ��ü ���̺� ��-->
<table width="100%" border="0">
<tr><td width="25%"></td>
<td width="25%"></td>
<td width="25%"></td>
<td width="25%" align="left">
<input type="submit"class="myButton" value="���">
<input type="reset"class="myButton" value="���">
</td></tr>
</table>
</td></tr>
</table><!-- �ܰ� �� -->
</form>
</center>
 <script type="text/javascript">
        $(function() {
            $('div#star').raty({
                score: 3
                ,path : "../img"
                ,width : 200
                ,starOff : 'moon_off.png'
                ,starOn  : 'moon_on.png'
                ,target : '#hint'
                ,hints : ['���� ���ƿ�!', '�׳� �׷���', '����', '���ξ�', '�־�!']
                ,click: function(score, evt) {
                    $("#starRating").val(score);
                    
                    //$("#displayStarRating").html(score);
                }
            });
        });
    </script>
</body>
</html>