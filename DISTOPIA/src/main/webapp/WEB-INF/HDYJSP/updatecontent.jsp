<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>�� �����ϱ�</title>
</head>
<script type="text/javascript">
function button_event(){
	if (document.getElementById("title").value == "") {
        alert("�������� �Է��ϼ���.");
        return false;
     }
     if (document.getElementById("content").value == "") {
         alert("�� ������ �Է��ϼ���.");
         return false;
      }

	  var ans = confirm("���� �����Ͻðڽ��ϱ�?");
	  if (ans == true){    //Ȯ��
  	  alert("��ϿϷ�");

	      document.form.submit();
	  }else{   //���
		  alert("���");
	  
		  return false;
	  }
}
	  function cancelButton(){
      	if(confirm("�� ������� ���ư��ðڽ��ϱ�?") == true){
      		document.move.submit();
      	}else{
      		return;
      	}
      }
</script>
<body>
<br/><br/><br/>
<center>
<h2>�� �����ϱ�</h2>
<form action="../utopia/updateContent.do" method="post"  name="form">
<input  type="hidden" name="boa_number" value="${list.boa_number }">
 �� ����<input id="title" type="text" class="textbox"  name="boa_title" size="50" value="${list.boa_title}"/><br/><br/>
 �� ����<br/><br/>
<textarea id="content" class="textbox" name="boa_content"  cols="100" rows="20"  >
 ${list.boa_content}
</textarea>
<br/><br/>

<input type="button"class="myButton" onclick="button_event();" value="�����ϱ�">
<input type="button" class="myButton" onclick="cancelButton()" value="����ϱ�" ><br/><br/><br/>
<h3><a href="../page/page.do">ó������</a></h3>
</form>
<form action="../page/page.do" name="move">
</form>
</center>
</body>
</html>