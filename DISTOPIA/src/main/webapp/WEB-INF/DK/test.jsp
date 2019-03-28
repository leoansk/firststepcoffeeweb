<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="../test/abTest.do" method="post">
<input type="text" value="a" id="a" name="aa">
<input type="text" value="b" id="b" name="bb">
<input type="submit" value="확인">
<input type="button" value="sendB" onClick="send()"/>
</form>
<form action="../test/bTest.do" id="move" name="move" method="post">
<input type="text" id="bbb" name="bbb">
</form>


<script type="text/javascript">

function send(){
   document.getElementById("bbb").value = document.getElementById("b").value;
   /* for(a = 1; a <= 10; a++){
		  document.write("a"+a);
		} */
   document.move.submit();
}

</script>
</body>
</html>