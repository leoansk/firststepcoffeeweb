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
      alert("비교할 제품이 없습니다.");
      document.readLike.action="../like/readLike.do";//readLike는 폼이름이여야한다
      document.readLike.submit();
   }else if(size > 4){
      alert("비교할 제품이 너무 많습니다.");
      document.readLike.action="../like/readLike.do";
      document.readLike.submit();
   }else{
      alert("선택한 상품 갯수:"+size);
      document.compare.submit();
   }
   
}
</script>

<form name="readLike">

</form>

<c:choose>
<c:when test="${LIKE_LIST.listSize ==0}">
<center><h3> 카트에 담긴 물건이 없습니다.</h3></center>
</c:when>
<c:otherwise>
<form:form action="../compare/compare.do" method="post" name="compare">
<div>
   <h2 align="center">관심목록</h2>
   <table align="center"class="pp">
      <tr>
         <td align="center" width="80">비교하기</td>
         <td align="center" width="300">상품</td>
         <td align="center" width="150">상품명</td>
         <td align="center" width="150">모델명</td>
         <td align="center" width="120">출고가</td>
         <td align="center" width="80">삭제하기</td>
      </tr>
   
      <c:if test="${LIKE_LIST.listSize > 0 }"><!-- 반복 -->
         <c:forEach var="cnt" begin="0" end="${LIKE_LIST.listSize -1 }"><!-- 반복횟수 결정 -->
            <tr>
               <td align="center"><input type="checkbox"  class="textbox" id="check" name="check" value="${LIKE_LIST.proNameList[cnt] }" /></td><!-- 비교하기 위한 체크박스 -->
<%--                <td align="center">${LIKE_LIST.proPhotoList[cnt] }</td>      <!-- proPhoto     => getproPhoto을 찾음 --> --%>
               <td>
               <table class="imgtable"><tr><td>
               <img alt="제품사진" src="../proimage/${LIKE_LIST.proPhotoList[cnt]}"  width="150">
               </td></tr></table>
               </td>
               <td align="center">${LIKE_LIST.proNameList[cnt] }</td>      <!-- proName     => getproName을 찾음 -->
               <td align="center">${LIKE_LIST.proModelnameList[cnt] }</td>   <!-- proModelname => getproModelname을 찾음 -->
               <td align="center">${LIKE_LIST.proPriceList[cnt] }</td>      <!-- proPrice     => getproPrice을 찾음 -->
               <td align="center"><a href="../like/delete.do?NAME=${LIKE_LIST.proModelnameList[cnt] }" method="post">삭제</a></td><!-- 삭제하기 위한 버튼 -->
            </tr>
         </c:forEach>
      </c:if>
   </table>
   <br/><br/>
   <table align="center" >
      <tr>
         <!-- <td><input type="submit"  class="myButton"  value="비교하기" onclick="compareCheck();"/></td> -->
         <td><input type="button"  class="myButton"  value="비교하기" onclick="compareCheck();"/></td>
      </tr>
   </table>
   </div>
</form:form>
</c:otherwise>
</c:choose>
</body>
</html>