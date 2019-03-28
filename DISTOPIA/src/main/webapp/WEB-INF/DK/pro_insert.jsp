<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>상품등록</title>
</head>
<center><h1>${title }</h1></center>
<body>
<center><h1>Product insert!!!!</h1></center>
<center>
<form action="../product/insert.do" method="post" enctype="multipart/form-data">
<table>
<tr><th>상품명</th><td><input type="text" class="textbox"  name="pro_name" size="15"/></td></tr>
<tr><th>출고 가격</th><td><input type="text" class="textbox"  name="pro_price" size="15"/></td></tr>
<tr><th>상품 설명</th>
<td>
<textarea rows="5" class="textbox" cols="50" name="pro_explain"></textarea></td></tr>
<tr><th>소분류 넘버</th><td>
<select name="sc_number">
<option value="1">1 주방가전</option>
<option value="2">2 생활가전</option>
<option value="3">3 티비</option>
<option value="4">4 디카</option>
<option value="5">5 데스크탑</option>
<option value="6">6 노트북</option>
<option value="7">7 2in1</option>
<option value="8">8 주변기기</option>
<option value="9">9 스마트폰</option>
<option value="10">10 태블릿</option>
<option value="11">11 스마트워치</option>
<option value="12">12 주변기기</option>
<option value="13">13 가구</option>
<option value="14">14 의류</option>
<option value="15">15	스포츠</option>
<option value="16">16	문구</option>
</select>
</td></tr>
<tr><th>모델명</th><td><input type="text" class="textbox"  name="pro_modelname" size="15"/></td></tr>
<tr><th>제조사</th><td><input type="text" class="textbox"  name="pro_maker" size="15"/></td></tr>
<tr><th>상품이미지</th><td><input type="file" class="textbox"  name="pro_photo" size="15"/></td></tr>
</table>
<input type="submit" class="myButton" value="Insert"><br/>
<h3><a href="../index/main.do">처음으로</a></h3>
</form>
</center>
</body>
</html>