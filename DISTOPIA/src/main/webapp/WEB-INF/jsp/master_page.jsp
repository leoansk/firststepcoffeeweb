<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/style.css">


</head>
<body>
<script type="text/javascript">
				
      function button_event(){
    	  if (confirm("������ ���� �Ͻðڽ��ϱ�?") == true){    //Ȯ��
    	      document.form.submit();
    	  }else{   //���
    	      return;
    	  }
    }
    
	function popupWindow() {
		var settings = 'toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=200,width=200,left=0,top=0';
		winObject = window.open("test2.htm", "test2", settings);
	}
	function submitToWindow() {
		winObject.document.all.text2.value = document.all.text1.value;
	}
</script>
	<center>
		<h2>Master_Page ȸ������ ����</h2>
<!-- 	<form action="" method="post" onsubmit="return checking(this)"> -->
		
		<table class="dystable" class="master_page" align="center">
			<tr>
			
				<th>���̵�</th>
				<th>�н�����</th>
				<th>�̸�</th>
				<th>����</th>
				<th>����</th>
				<th>�ּ�</th>
				<th>�̸���</th>
				<th>����ȣ</th>
				<th>�������</th>
			</tr>
			<c:forEach var="num" begin="0" end="${Users_LIST_SIZE -1}">
				<tr>
					
					<td onclick="popupWindow()">${Users_LIST.us_id[num]}</td>
					<td >${Users_LIST.us_password[num]}</td>
					<td>${Users_LIST.us_name[num]}</td>
					<td>${Users_LIST.us_age[num]}</td>
					<td>${Users_LIST.us_gender[num]}</td>
					<td>${Users_LIST.us_address[num]}</td>
					<td>${Users_LIST.us_email[num]}</td>
					<td>${Users_LIST.us_phone[num]}</td>
					<td>${Users_LIST.us_birthday[num]}</td>
				</tr>
			</c:forEach>
			
		</table>
<!-- 	</form> -->
	</center>
</body>
</html>