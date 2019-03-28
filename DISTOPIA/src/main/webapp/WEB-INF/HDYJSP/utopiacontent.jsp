<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- <link rel="stylesheet" type="text/css" href="../css/style.css"> -->
<title>글 내용</title>
</head>
<body>
<br/><br/><br/>
<script type="text/javascript">
      function checking(fm) {
         if (document.getElementById("content1").value == "") {
            alert("댓글 내용을 입력하세요.");
            return false;
         }
      }
      function button_event(){
    	  if (confirm("댓글을 등록하시겠습니까?") == true){    //확인
    	      document.form.submit();
    	  }else{   //취소
    	      return;
    	  }
    	  }
      function DivView(divID) {
          var divObject;
          divObject = document.getElementById(divID);            
          
          if(divObject.style.display == "none") {
              document.getElementById(divID).style.display = "";
          }
          else {
              document.getElementById(divID).style.display = "none";
          }            
      }
     
</script>

<center>
<table align="center"  width="100%" class="dystable">
<tr>
	<th>작성자&nbsp;/ &nbsp;작성일</th>
</tr>
<tr>
	<td align="center">${list.us_id}&nbsp;/&nbsp;${list.boa_date}
<table align="center" width="100%"   class="dystable">
<tr  align="center">
	<td width="30%" height="70">글제목</td>
	<td width="70%">${list.boa_title}</td>
</tr>
<tr  align="center">
	<td width="30%" height="200">내용</td>
	<td width="70%" >${list.boa_content}</td>
</tr>
	</table>
<form action="../utopia/boardReply.do" method="post" onSubmit="return checking(this)">
<input type="hidden" name="boa_number" value="${list.boa_number }">
<input type="hidden" name="us_id" value="${list.us_id }">
<input type="hidden" name="rep_number" value="${replylist.rep_number }">
	<table align="center" width="100%" class="dystable">
       <tr align="center">
           <c:choose>
				<c:when test="${sessionScope.loginId == null }">
                <td>
                <input type="text" class="textbox" id="content1"class="inputs" placeholder="댓글을 입력하시려면 로그인하세요."  name="rep_content" size="100">
                </td>
                </c:when>
             	<c:when test="${sessionScope.loginId != null }">
                <td>댓글 내용: <input type="text" class="textbox" id="content1" name="rep_content" size="100">
                <input type="submit" onclick="button_event();" class="myButton" size="20" value="입력">
                </td>
                </c:when>
           </c:choose>
       </tr>
	</table>
</form>
<form action="../utopia/boardReply2.do" method="post" onSubmit="return checking(this)">
<input type="hidden" name="rep_number" value="${replylist.rep_number[num] }"> 
<input type="hidden" name="rep_parentsum" value="${replylist.rep_parentsnum[num]}"> 
<input type="hidden" name="rep_order" value="${replylist.rep_order[num]}">
<input type="hidden" name="boa_number" value="${replylist.boa_number[num]}">
<table  width="100%" class="dystable" >
<c:if test="${empty replylist.rep_number }">
		<tr>
		<td width="70%">댓글이 없습니다. 댓글을 작성해주세요.</td>
		</tr>
</c:if>
<c:if test="${not empty replylist.rep_number }">
          <tr>
            <th width="20%">작성자</th>
            <th width="60%">내용</th>
            <th width="10%">작성일</th>
            <th width="10%">&nbsp;&nbsp;&nbsp;</th>
          </tr>
   		  <c:forEach var="num" begin="0" end="${replylist.listSize -1}">
          <tr align="center">
            <td>${replylist.us_id[num]}</td>
            <td> ${replylist.rep_content[num]}  
			<br/><br/>
			<div id="BoardContent" style="display:none">
            <input type="text" size="20" class="textbox" name="update" value="${replylist.rep_content[num]} ">
            <input type="button" class="myButton" name="수정하기" value="수정하기">
			</div>
            </td>
            <td>${replylist.rep_date[num]}</td>
            <c:choose>
			<c:when test="${sessionScope.loginId == null  ||  list.us_id != loginId}">
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </c:when>
            <c:when test="${list.us_id == loginId }">
            <td width="30%"><a href="../utopia/replyDelete.do?boa_number=${list.boa_number}&rep_number=${replylist.rep_number[num] }">삭제</a>
            <br/>
<!--           	<a onclick="DivView('BoardContent')">수정</a></td> -->
          	<a href="../utopia/updatereplyshow.do?rep_number=${replylist.rep_number[num]}">수정</a></td>
            </c:when>
            </c:choose>
            </tr>
    </c:forEach>
</c:if>
            <tr align="left">
             <td width="" >
             <font size="4"  style="font-weight:bold;" >   
             <a href="../page/page.do">뒤로가기</a> 
             </font>
             </td>
             <td></td>
<c:choose>
	<c:when test="${sessionScope.loginId == null  ||  list.us_id != loginId}">
			<td width="20%"></td>
    </c:when>
	<c:when test="${list.us_id == loginId }">
 			<td  align="center" colspan="2"><a href="../utopia/deleteBoardContent.do?boa_number=${list.boa_number}">글삭제</a>
                        / <a href="../utopia/edit.do?boa_number=${list.boa_number}">글수정</a></td>
     </c:when>
</c:choose>

     </tr>
</table>
</form>
</td>
</tr>
</table>
</center>
</body>
</html>