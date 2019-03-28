<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/button1.css">
<link rel="stylesheet" type="text/css" href="../css/DKstyle.css">
<script type="text/javascript" src="../js/jquery.raty.js"></script>
</head>
<body>
<h2 align="center">${title } <span>${sessionScope.loginId}</span></h2>
<center>
<table width="100%" CELLPADDING="20%"  class="dystable"><!-- 1�� ���̺� ���� -->
<tr><td>
<table width="90%" CELLPADDING="20%"><!-- 2�� ���̺� ���� -->
<tr><td colspan="4" align="right">��ǰ ����� : ${Product_LIST.pro_date}<!-- �� -->
</td></tr>
<tr><td rowspan="4">
<table class="imgtable" align="center" width="100%" ><tr><td><!-- 3�� ���̺� ���� -->
<img alt="��ǰ����" src="../proimage/${Product_LIST.pro_photo}" width="300"></td></tr>
</table></td><!-- 3�� ���̺� �� -->
<td align="center" >
<c:choose> 
         <c:when test="${score <= 0}">
         <font color="red" size="3">ù ���並 �޾��ּ���.</font></c:when>
         <c:when test="${score <= 1}">
         <img alt="score1" src="../img/poison1.png" width="130"></c:when>
         <c:when test="${score <= 2}">
         <img alt="score2" src="../img/poison2.png" width="130"></c:when>
         <c:when test="${score <= 3}">
         <img alt="score3" src="../img/poison3.png" width="130"></c:when>
         <c:when test="${score <= 4}">
         <img alt="score4" src="../img/poison4.png" width="130"></c:when>
         <c:when test="${score <= 5}">
         <img alt="score5" src="../img/poison5.png" width="130"></c:when>
         </c:choose>
</td>
<td>
<c:if test="${score >=0 }">
<img alt="moon" src="../img/moon_on.png">
</c:if>
<c:if test="${score >=0 }">
<h1>${score}</h1>
</c:if>
</td></tr>
<tr><td>
<table width="100%" height="100%" class="pp">
<tr >
<td>��ǰ�� : ${Product_LIST.pro_name}</td>
<td>�𵨸� : ${Product_LIST.pro_modelname}</td>
</tr>
<tr>
<td width="25%">������ : ${Product_LIST.pro_maker}</td>
<td width="30%">��� ���� : ${Product_LIST.pro_price}</td>
</tr>
</table>

</td></tr>
<tr><td width="100%">

</td></tr>
<tr>
<td align="left" width="50%">
<c:choose>

<c:when test="${sessionScope.loginId =='guest' || sessionScope.loginId ==null}">
<font size="2" color="navy">�α��� �� <font color="red">���ϱ�</font> ����� �����մϴ�.</font>
</c:when>
 <c:when test="${ProResultNum == 1}"> 
 <font color="red" style="font-weight:bold;">�̹� ���ϱⰡ �Ǿ��ִ� ��ǰ�Դϴ�.</font>
</c:when> 
<c:when test="${ProResultNum == 0}">
<%-- <c:otherwise> --%>
<form action="../product/insertLike.do" method="post">
<input type="hidden" value="${Product_LIST.pro_number}" name="proNum">
<input type="submit" class="button1"  value="���ϱ�">
</form>
<%-- </c:otherwise> --%>

</c:when>
</c:choose>

</td>
<td align="right" width="50%">
<span>
<c:if test="${keyword.revck_costeff>=3}">
������ 
</c:if>
</span>
<span>
<c:if test="${keyword.revch_design>=3}">
������ 
</c:if>
</span>
<span>
<c:if test="${keyword.revch_performance>=3}">
���� 
</c:if>
</span>
<span>
<c:if test="${keyword.revch_as>=3}">
A/S 
</c:if>
</span>
<span>
<c:if test="${keyword.revch_durability>=3}">
������
</c:if>
</span>
<font color="red">����</font>
</td>
</tr>
<tr><td colspan="4">
<input type="hidden" id="before" value="${Product_LIST.pro_explain}">
��ǰ ���� : 
<span id="explain"></span>
</td></tr>
</table>

</td>
</tr>

</table>
</center>
<!------------------------ ����Ʈ ���� ���̺� -------------------------------------->
<br/>
<br/>
<br/>
<center>
<%-- <c:if test="${Bestreview_list.listSize==0 }">��ϵ� ���䰡 �����ϴ�.</c:if> --%>
<c:if test="${Bestreview_list.listSize>0 }">
<table width="80%"  class="pp" bordercolor="#EAEAEA">
<tr><td colspan="6" align="left"><font size="4">����Ʈ ����</font></td></tr>
<c:forEach var="n" begin="0" end="2">
<tr>
<td width="3%">
<c:choose> 
<c:when test="${Bestreview_list.rev_point[n]  >=8 }">
<img alt="score1" src="../img/score1.png" width="50"></c:when>
<c:when test="${Bestreview_list.rev_point[n]  >=3 && Bestreview_list.rev_point[n]  <=7}">
<img alt="score2" src="../img/score2.png" width="50"></c:when>
<c:when test="${Bestreview_list.rev_point[n]  >=-2 && Bestreview_list.rev_point[n]  <=2}">
<img alt="score3" src="../img/score3.png" width="50"></c:when>
<c:when test="${Bestreview_list.rev_point[n]  >=-7 && Bestreview_list.rev_point[n]  <=-3}">
<img alt="score4" src="../img/score4.png" width="50"></c:when>
<c:when test="${Bestreview_list.rev_point[n]  <=-8}">
`<img alt="score5" src="../img/score5.png" width="50"></c:when>
</c:choose>
</td><td><font color="green" size="2">${Bestreview_list.rev_point[n]}</font></td>
<td>${Bestuser_list.us_id[n]}</td>
<td>
<c:choose> 
         <c:when test="${Bestreview_list.rev_userproductscore[n] <= 0}">
         <font color="red" size="3">ù ���並 �޾��ּ���.</font></c:when>
         <c:when test="${Bestreview_list.rev_userproductscore[n] <= 1}">
         <img alt="score1" src="../img/poison1.png" width="50"></c:when>
         <c:when test="${Bestreview_list.rev_userproductscore[n] <= 2}">
         <img alt="score2" src="../img/poison2.png" width="50"></c:when>
         <c:when test="${Bestreview_list.rev_userproductscore[n] <= 3}">
         <img alt="score3" src="../img/poison3.png" width="50"></c:when>
         <c:when test="${Bestreview_list.rev_userproductscore[n] <= 4}">
         <img alt="score4" src="../img/poison4.png" width="50"></c:when>
         <c:when test="${Bestreview_list.rev_userproductscore[n] <= 5}">
         <img alt="score5" src="../img/poison5.png" width="50"></c:when>
         </c:choose>
</td>
<td>${Bestreview_list.rev_title[n]}</td>
<td align="right">${Bestreview_list.rev_date[n]}</td>
</tr>
</c:forEach>

</table>
</c:if>
</center>

<!------------------------ ���� �ۼ� ���̺� -------------------------------------->
<br/>
<br/>
<br/>
<center>
<form action="../review/insert.do" method="post" 
name="insertReview" id="form" name="form" enctype="multipart/form-data">
<input type="hidden" value="${Product_LIST.pro_number}" name="pro_number">
<table   class="pp" width="60%"><!-- �ܰ� ���� -->
<tr><td>
<table  class="pp" width="80%" CELLPADDING="10%"><!-- ��ü ���̺� ����-->
   <tr><td>
      
      <table rules="none" width="80%"><!-- 1�� ���̺� ���� -->
      <tr><td>
       <input type="text" class="textbox" value="Title"  name="title" size="100" 
       onfocus="if(this.value=='Title'){this.value=''}" 
       onblur="if(this.value =='') this.value='Title';">
      </td></tr></table><!-- 1�� ���̺� �� -->
   </td></tr>
   <tr><td>
      <table rules="none" width="80%"><!-- 2�� ���̺� ���� -->
      <tr><td>
      <textarea rows="5" class="textbox" cols="100" name="content" 
      onclick="if(this.value=='���並 �Է��ϼ���'){this.value=''}">���並 �Է��ϼ���</textarea>
      </td></tr></table><!-- 2�� ���̺� �� -->
   </td></tr>
   
   <tr align="center"><td>
      <table  class="pp" align="center" width="80%" CELLPADDING="10%" rules="none"><!-- 3�� ���̺� ���� -->
      <tr><td rowspan="2" width="50%">
      <img alt="����÷��" src="../img/pic.png" width="70">
      <input type="file" name="photo1">
      <input type="file" name="photo2">
      <input type="file" name="photo3">
      </td>
      <td align="left" colspan="2">
      <font color="red" size="3">����</font>
      <span><input type="checkbox" id="test1" name="revck_costeff">������</span>
      <span><input type="checkbox" id="test1" name="revch_design">������</span>
      <span><input type="checkbox" id="test1" name="revch_performance">����</span>
      <span><input type="checkbox" id="test1" name="revch_as">A/S</span>
      <span><input type="checkbox" id="test1" name="revch_durability">������</span>
      <abbr title="������ üũ�� �ּ���!!">
      <img alt="��ǳ��" src="../img/qq.jpg" width="25">
      </abbr>
      </td></tr>
      
      <tr><td align="center" width="25%">
      
      <div id="star"></div>
       <input type="hidden" id="rev_point" name ="rev_point" value="3"/>
      </td><td width="25%"><span id="hint"></span></td></tr>
      </table><!-- 3�� ���̺� �� -->
   </td></tr>
<tr><td width="25%" align="right">
<c:choose>
<c:when test="${sessionScope.loginId =='guest' || sessionScope.loginId ==null}">
<font color="white">
<input type="button" class="myButton" value="�α��� �� �̿����ּ���"onclick="location.href='../login/loginShow.do'"/></font>
</c:when>
<c:otherwise>
<input type="submit" class="myButton" value="���">
<input type="reset" class="myButton" value="���">
</c:otherwise>
</c:choose>
</td></tr>   
</table><!-- ��ü ���̺� ��-->
<!-- �۾��� -->
<!-- <table align="center" width="90%" rules="none"> -->
<!-- <tr><td width="25%"></td> -->
<!-- <td width="25%"></td> -->
<!-- <td width="25%"></td> -->
<!-- <td width="25%" align="left"> -->
<%-- <c:choose> --%>
<%-- <c:when test="${sessionScope.loginId =='guest' || sessionScope.loginId ==null}"> --%>
<!-- <font color="white"> -->
<!-- <input type="button" class="myButton" value="�α��� �� �̿����ּ���"onclick="location.href='../login/loginShow.do'"/></font> -->
<%-- </c:when> --%>
<%-- <c:otherwise> --%>
<!-- <input type="submit" class="myButton" value="���"> -->
<!-- <input type="reset" class="myButton" value="���"> -->
<%-- </c:otherwise> --%>
<%-- </c:choose> --%>
<!-- </td></tr> -->
<!-- </table> -->
</td></tr>
</table><!-- �ܰ� �� -->
</form>
</center>


<!---------------------���� ����Ʈ  ----------------------------->
<br/>
<br/>
<c:if test="${review_list.listSize <=0}"></c:if>
<c:if test="${review_list.listSize >0}">
<center>
<c:forEach var="cnt" begin="0" end="${(review_list.listSize -1)}">
<table width="70%" align="center" class="dystable"> <!-- �� ��ü ���̺� ����-->
<tr align="left"><td width="100%" colspan="6">
<img alt="moon" src="../img/moon_on.png" width="30">
<font size="6" style="bold:3px;">${review_list.rev_userproductscore[cnt] }</font>
</td></tr>
<tr  align="center" ><td width="100%" colspan="6">
<font size="6" style="bold:3px;">${review_list.rev_title[cnt] }</font>
</td></tr>
<tr align="center"><td  align="center"colspan="6" >
<table  bgcolor="#EAEAEA"  width="100%">
<tr><td  >
${review_list.rev_content[cnt] }
</td></tr>
</table>

</td></tr>
<tr><td colspan="6" align="right">

<c:if test="${check_list.revck_costeff[cnt]==1 }">
<span>
������ 
</span>
</c:if>
<c:if test="${check_list.revch_design[cnt]==1 }">
<span>
������ 
</span>
</c:if>
<c:if test="${check_list.revch_performance[cnt]==1 }">
<span>
���� 
</span>
</c:if>
<c:if test="${check_list.revch_as[cnt]==1 }">
<span>
A/S
</span>
</c:if>
<c:if test="${check_list.revch_durability[cnt]==1 }">
<span>
������
</span>
</c:if>

<font color="red">����</font>
 <!-- �� ��ü ���̺� ��-->
</td>
</tr>
<tr>
<td align="center">

<!-- �̹��� -->
<c:if test="${review_list.rev_photo1[cnt] !=null}">
<img alt="photo1" src="../reviewimg/small${review_list.rev_photo1[cnt]}">
</c:if>
<c:if test="${review_list.rev_photo2[cnt] !=null}">
<img alt="photo2" src="../reviewimg/small${review_list.rev_photo2[cnt]}">
</c:if>
<c:if test="${review_list.rev_photo3[cnt] !=null}">
<img alt="photo3" src="../reviewimg/small${review_list.rev_photo3[cnt]}">
</c:if>

<!-- �̹��� -->
</td>
<td rowspan="3" align="center">
<table width="100%"  >
<tr>


<c:choose>
<c:when test="${sessionScope.loginId=='guest' || sessionScope.loginId == null}">
<td colspan="2"></td></c:when>
<c:when test="${reviewPointCheck_list.listSize !=0}">
<c:forEach var="num" begin="0" end="${(reviewPointCheck_list.listSize -1)}">
	<c:if test="${reviewPointCheck_list.rev_number[num]==review_list.rev_number[cnt]}">
   <td colspan="2" width="110"><font color="red" size="2">�̹� ���� �����Դϴ�.</font></td>
	 </c:if> 
    <c:if test="${reviewPointCheck_list.rev_number[num]!=review_list.rev_number[cnt]}">
	</c:if>
	</c:forEach>
		<td align="right"> 
<a href="../review/updateReviewScore.do?sc=1&reviewNum=
${review_list.rev_number[cnt]}&proNum=${Product_LIST.pro_number}">
GOOD</a>
<td align="right"><font color="green">
<a href="../review/updateReviewScore.do?sc=-1&reviewNum=
${review_list.rev_number[cnt]}&proNum=${Product_LIST.pro_number}">
BAD</a></font>
</td>
		   
   
	</c:when>
<c:when test="${sessionScope.loginId != user_list.us_id[cnt]}">
<td align="right">
<a href="../review/updateReviewScore.do?sc=1&reviewNum=
${review_list.rev_number[cnt]}&proNum=${Product_LIST.pro_number}">
GOOD</a>
<td align="right"><font color="green">
<a href="../review/updateReviewScore.do?sc=-1&reviewNum=
${review_list.rev_number[cnt]}&proNum=${Product_LIST.pro_number}">
BAD</a></font>
</td>
</c:when>

<%-- <c:otherwise>
<td align="right">
<a href="../review/updateReviewScore.do?sc=1&reviewNum=
${review_list.rev_number[cnt]}&proNum=${Product_LIST.pro_number}">
GOOD</a>
<td align="right"><font color="green">
<a href="../review/updateReviewScore.do?sc=-1&reviewNum=
${review_list.rev_number[cnt]}&proNum=${Product_LIST.pro_number}">
BAD</a></font>
</td>
</c:otherwise> --%>
</c:choose>


</tr>
</table>
</td>
<td rowspan="3" align="center">
<c:choose> 
<c:when test="${review_list.rev_point[cnt]  >=8 }">
<img alt="score1" src="../img/score1.png" width="70"></c:when>
<c:when test="${review_list.rev_point[cnt]  >=3 && review_list.rev_point[cnt]  <=7}">
<img alt="score2" src="../img/score2.png" width="70"></c:when>
<c:when test="${review_list.rev_point[cnt]  >=-2 && review_list.rev_point[cnt]  <=2}">
<img alt="score3" src="../img/score3.png" width="70"></c:when>
<c:when test="${review_list.rev_point[cnt]  >=-7 && review_list.rev_point[cnt]  <=-3}">
<img alt="score4" src="../img/score4.png" width="70"></c:when>
<c:when test="${review_list.rev_point[cnt]  <=-8}">
<img alt="score5" src="../img/score5.png" width="70"></c:when>
</c:choose>

</td>
<td colspan="2" align="center"><h3>${user_list.us_id[cnt] }</h3></td>
<td rowspan="3" align="center">
<table width="100%"  ><tr><td>
<img alt="userphoto" src="../userimage/${user_list.us_photoname[cnt]}" width="80">
</td></tr></table>


<tr>
<td colspan="2" height="33%" align="center">${review_list.rev_date[cnt] }</td>
</tr>
<tr>
<c:choose>
<c:when test="${sessionScope.loginId == user_list.us_id[cnt]}">
<td align="center" height="33%">
<a href="../review/selectreview.do?reviewNum=
${review_list.rev_number[cnt]}">
����</a></td>
<td align="center">
<a href="../review/deletereview.do?reviewNum=
${review_list.rev_number[cnt]}&pro_number=${Product_LIST.pro_number}">
����</a></td>
</c:when>
<c:when test="${sessionScope.id != user_list.us_id[cnt]||sessionScope.id==null}">
</c:when>
</c:choose>
</tr>
</table> <!-- �Ʒ� ��ü ���̺� ��-->

</c:forEach>
</center>
</c:if>
<!-- <h3><a href="../index/index.do">ó������</a></h3> -->
 <script type="text/javascript">
      function insertReview(){
         var tit= document.getElementById('Title').value;
         var con= document.getElementById('content').value;
         if(tit==''||tit=='Title'){
            alert("������ �Է��ϼ���");
         }else if(con==''||con=='���並 �Է��ϼ���'){
            alert("������ �Է��ϼ���");
         }else{
            document.form.submit();
         }
      }
 $(document).ready(function(){
       replace();
      });
       function replace(){
      var str= document.getElementById('before').value; 
      var re = replaceAll(str, 'n', '<br/>'); 
      document.getElementById('explain').innerHTML = re;
      }
      
       function replaceAll(str, target, replacement) {
          return str.split(target).join(replacement);
      };       
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
                    $("#rev_point").val(score);
                }
            });
            $("input:checkbox").on('click', function() {
               
            });
        });
</script>
</body>
</html>