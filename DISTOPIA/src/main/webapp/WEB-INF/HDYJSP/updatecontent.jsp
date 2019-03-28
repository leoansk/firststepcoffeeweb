<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>글 수정하기</title>
</head>
<script type="text/javascript">
function button_event(){
	if (document.getElementById("title").value == "") {
        alert("글제목을 입력하세요.");
        return false;
     }
     if (document.getElementById("content").value == "") {
         alert("글 내용을 입력하세요.");
         return false;
      }

	  var ans = confirm("글을 수정하시겠습니까?");
	  if (ans == true){    //확인
  	  alert("등록완료");

	      document.form.submit();
	  }else{   //취소
		  alert("취소");
	  
		  return false;
	  }
}
	  function cancelButton(){
      	if(confirm("글 목록으로 돌아가시겠습니까?") == true){
      		document.move.submit();
      	}else{
      		return;
      	}
      }
</script>
<body>
<br/><br/><br/>
<center>
<h2>글 수정하기</h2>
<form action="../utopia/updateContent.do" method="post"  name="form">
<input  type="hidden" name="boa_number" value="${list.boa_number }">
 글 제목<input id="title" type="text" class="textbox"  name="boa_title" size="50" value="${list.boa_title}"/><br/><br/>
 글 내용<br/><br/>
<textarea id="content" class="textbox" name="boa_content"  cols="100" rows="20"  >
 ${list.boa_content}
</textarea>
<br/><br/>

<input type="button"class="myButton" onclick="button_event();" value="수정하기">
<input type="button" class="myButton" onclick="cancelButton()" value="취소하기" ><br/><br/><br/>
<h3><a href="../page/page.do">처음으로</a></h3>
</form>
<form action="../page/page.do" name="move">
</form>
</center>
</body>
</html>