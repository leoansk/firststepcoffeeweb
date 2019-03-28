<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>댓글 수정</title>
</head>
<body>
<script type="text/javascript">
function button_event(){
	if (document.getElementById("title").value == "") {
        alert("내용을 입력하세요.");
        return false;
     }
	  var ans = confirm("댓글을 수정하시겠습니까?");
	  if (ans == true){    //확인
  	  alert("등록완료");
	      document.form.submit();
	  }else{   //취소
		  alert("취소");
		  return false;
	  }
}
</script>

<br/><br/><br/>
<center>
<h2>댓글 수정하기</h2>
<form action="../utopia/updateReply.do" method="POST"  name="form">
<input type="hidden" name="rep_number" value="${replylist.rep_number}">
<input type="hidden" name="boa_number" value="${replylist.boa_number}">
<br/><br/>
 댓글내용:
<input id="title" type="text" class="textbox"  name="rep_content" size="50" value="${replylist.rep_content}"/><br/><br/>
<input type="button"class="myButton" onclick="button_event();" value="수정하기">
<input type="reset" class="myButton" value="취소하기" onclick="button_event();return false"><br/><br/><br/>
<h3><a href="../page/page.do">처음으로</a></h3>
</form>
</center>
</body>
</html>