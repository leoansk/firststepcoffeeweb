<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� ����</title>
</head>
<body>
<script type="text/javascript">
function button_event(){
	if (document.getElementById("title").value == "") {
        alert("������ �Է��ϼ���.");
        return false;
     }
	  var ans = confirm("����� �����Ͻðڽ��ϱ�?");
	  if (ans == true){    //Ȯ��
  	  alert("��ϿϷ�");
	      document.form.submit();
	  }else{   //���
		  alert("���");
		  return false;
	  }
}
</script>

<br/><br/><br/>
<center>
<h2>��� �����ϱ�</h2>
<form action="../utopia/updateReply.do" method="POST"  name="form">
<input type="hidden" name="rep_number" value="${replylist.rep_number}">
<input type="hidden" name="boa_number" value="${replylist.boa_number}">
<br/><br/>
 ��۳���:
<input id="title" type="text" class="textbox"  name="rep_content" size="50" value="${replylist.rep_content}"/><br/><br/>
<input type="button"class="myButton" onclick="button_event();" value="�����ϱ�">
<input type="reset" class="myButton" value="����ϱ�" onclick="button_event();return false"><br/><br/><br/>
<h3><a href="../page/page.do">ó������</a></h3>
</form>
</center>
</body>
</html>