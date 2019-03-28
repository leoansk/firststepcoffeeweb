<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/DKstyle.css">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">

function compareCheck(){
   var chk = document.getElementsByName("check");
   
   var size = 0;
   for(var i = 0; i < chk.length; i++){
      if(chk[i].checked == true){
         size = size + 1;
      }
   }
   /* alert("size:"+size); */
   if(size < 1){
      alert("���� ��ǰ�� �����ϴ�.");
      document.readLike.action="../like/readLike.do";//readLike�� ���̸��̿����Ѵ�
      document.readLike.submit();
   }else if(size > 4){
      alert("���� ��ǰ�� �ʹ� �����ϴ�.");
      document.readLike.action="../like/readLike.do";
      document.readLike.submit();
   }else{
      alert("������ ��ǰ ����:"+size);
      document.compare.submit();
   }
   
}
</script>

<form name="readLike">

</form>

<c:choose>
<c:when test="${LIKE_LIST.listSize ==0}">
<center><h3> īƮ�� ��� ������ �����ϴ�.</h3></center>
</c:when>
<c:otherwise>
<form:form action="../compare/compare.do" method="post" name="compare">
<div>
   <h2 align="center">���ɸ��</h2>
   <table align="center"class="pp">
      <tr>
         <td align="center" width="80">���ϱ�</td>
         <td align="center" width="300">��ǰ</td>
         <td align="center" width="150">��ǰ��</td>
         <td align="center" width="150">�𵨸�</td>
         <td align="center" width="120">���</td>
         <td align="center" width="80">�����ϱ�</td>
      </tr>
   
      <c:if test="${LIKE_LIST.listSize > 0 }"><!-- �ݺ� -->
         <c:forEach var="cnt" begin="0" end="${LIKE_LIST.listSize -1 }"><!-- �ݺ�Ƚ�� ���� -->
            <tr>
               <td align="center"><input type="checkbox"  class="textbox" id="check" name="check" value="${LIKE_LIST.proNameList[cnt] }" /></td><!-- ���ϱ� ���� üũ�ڽ� -->
<%--                <td align="center">${LIKE_LIST.proPhotoList[cnt] }</td>      <!-- proPhoto     => getproPhoto�� ã�� --> --%>
               <td>
               <table class="imgtable"><tr><td>
               <img alt="��ǰ����" src="../proimage/${LIKE_LIST.proPhotoList[cnt]}"  width="150">
               </td></tr></table>
               </td>
               <td align="center">${LIKE_LIST.proNameList[cnt] }</td>      <!-- proName     => getproName�� ã�� -->
               <td align="center">${LIKE_LIST.proModelnameList[cnt] }</td>   <!-- proModelname => getproModelname�� ã�� -->
               <td align="center">${LIKE_LIST.proPriceList[cnt] }</td>      <!-- proPrice     => getproPrice�� ã�� -->
               <td align="center"><a href="../like/delete.do?NAME=${LIKE_LIST.proModelnameList[cnt] }" method="post">����</a></td><!-- �����ϱ� ���� ��ư -->
            </tr>
         </c:forEach>
      </c:if>
   </table>
   <br/><br/>
   <table align="center" >
      <tr>
         <!-- <td><input type="submit"  class="myButton"  value="���ϱ�" onclick="compareCheck();"/></td> -->
         <td><input type="button"  class="myButton"  value="���ϱ�" onclick="compareCheck();"/></td>
      </tr>
   </table>
   </div>
</form:form>
</c:otherwise>
</c:choose>
</body>
</html>