<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>��ǰ���</title>
</head>
<center><h1>${title }</h1></center>
<body>
<center><h1>Product insert!!!!</h1></center>
<center>
<form action="../product/insert.do" method="post" enctype="multipart/form-data">
<table>
<tr><th>��ǰ��</th><td><input type="text" class="textbox"  name="pro_name" size="15"/></td></tr>
<tr><th>��� ����</th><td><input type="text" class="textbox"  name="pro_price" size="15"/></td></tr>
<tr><th>��ǰ ����</th>
<td>
<textarea rows="5" class="textbox" cols="50" name="pro_explain"></textarea></td></tr>
<tr><th>�Һз� �ѹ�</th><td>
<select name="sc_number">
<option value="1">1 �ֹ氡��</option>
<option value="2">2 ��Ȱ����</option>
<option value="3">3 Ƽ��</option>
<option value="4">4 ��ī</option>
<option value="5">5 ����ũž</option>
<option value="6">6 ��Ʈ��</option>
<option value="7">7 2in1</option>
<option value="8">8 �ֺ����</option>
<option value="9">9 ����Ʈ��</option>
<option value="10">10 �º�</option>
<option value="11">11 ����Ʈ��ġ</option>
<option value="12">12 �ֺ����</option>
<option value="13">13 ����</option>
<option value="14">14 �Ƿ�</option>
<option value="15">15	������</option>
<option value="16">16	����</option>
</select>
</td></tr>
<tr><th>�𵨸�</th><td><input type="text" class="textbox"  name="pro_modelname" size="15"/></td></tr>
<tr><th>������</th><td><input type="text" class="textbox"  name="pro_maker" size="15"/></td></tr>
<tr><th>��ǰ�̹���</th><td><input type="file" class="textbox"  name="pro_photo" size="15"/></td></tr>
</table>
<input type="submit" class="myButton" value="Insert"><br/>
<h3><a href="../index/main.do">ó������</a></h3>
</form>
</center>
</body>
</html>