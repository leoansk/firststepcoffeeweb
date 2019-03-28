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
<table width="100%" CELLPADDING="20%"  class="dystable"><!-- 1번 테이블 시작 -->
<tr><td>
<table width="90%" CELLPADDING="20%"><!-- 2번 테이블 시작 -->
<tr><td colspan="4" align="right">상품 등록일 : ${Product_LIST.pro_date}<!-- 끝 -->
</td></tr>
<tr><td rowspan="4">
<table class="imgtable" align="center" width="100%" ><tr><td><!-- 3번 테이블 시작 -->
<img alt="제품사진" src="../proimage/${Product_LIST.pro_photo}" width="300"></td></tr>
</table></td><!-- 3번 테이블 끝 -->
<td align="center" >
<c:choose> 
         <c:when test="${score <= 0}">
         <font color="red" size="3">첫 리뷰를 달아주세요.</font></c:when>
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
<td>상품명 : ${Product_LIST.pro_name}</td>
<td>모델명 : ${Product_LIST.pro_modelname}</td>
</tr>
<tr>
<td width="25%">제조사 : ${Product_LIST.pro_maker}</td>
<td width="30%">출고 가격 : ${Product_LIST.pro_price}</td>
</tr>
</table>

</td></tr>
<tr><td width="100%">

</td></tr>
<tr>
<td align="left" width="50%">
<c:choose>

<c:when test="${sessionScope.loginId =='guest' || sessionScope.loginId ==null}">
<font size="2" color="navy">로그인 후 <font color="red">찜하기</font> 사용이 가능합니다.</font>
</c:when>
 <c:when test="${ProResultNum == 1}"> 
 <font color="red" style="font-weight:bold;">이미 찜하기가 되어있는 상품입니다.</font>
</c:when> 
<c:when test="${ProResultNum == 0}">
<%-- <c:otherwise> --%>
<form action="../product/insertLike.do" method="post">
<input type="hidden" value="${Product_LIST.pro_number}" name="proNum">
<input type="submit" class="button1"  value="찜하기">
</form>
<%-- </c:otherwise> --%>

</c:when>
</c:choose>

</td>
<td align="right" width="50%">
<span>
<c:if test="${keyword.revck_costeff>=3}">
가성비 
</c:if>
</span>
<span>
<c:if test="${keyword.revch_design>=3}">
디자인 
</c:if>
</span>
<span>
<c:if test="${keyword.revch_performance>=3}">
성능 
</c:if>
</span>
<span>
<c:if test="${keyword.revch_as>=3}">
A/S 
</c:if>
</span>
<span>
<c:if test="${keyword.revch_durability>=3}">
내구성
</c:if>
</span>
<font color="red">단점</font>
</td>
</tr>
<tr><td colspan="4">
<input type="hidden" id="before" value="${Product_LIST.pro_explain}">
상품 설명 : 
<span id="explain"></span>
</td></tr>
</table>

</td>
</tr>

</table>
</center>
<!------------------------ 베스트 리뷰 테이블 -------------------------------------->
<br/>
<br/>
<br/>
<center>
<%-- <c:if test="${Bestreview_list.listSize==0 }">등록된 리뷰가 없습니다.</c:if> --%>
<c:if test="${Bestreview_list.listSize>0 }">
<table width="80%"  class="pp" bordercolor="#EAEAEA">
<tr><td colspan="6" align="left"><font size="4">베스트 리뷰</font></td></tr>
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
         <font color="red" size="3">첫 리뷰를 달아주세요.</font></c:when>
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

<!------------------------ 리뷰 작성 테이블 -------------------------------------->
<br/>
<br/>
<br/>
<center>
<form action="../review/insert.do" method="post" 
name="insertReview" id="form" name="form" enctype="multipart/form-data">
<input type="hidden" value="${Product_LIST.pro_number}" name="pro_number">
<table   class="pp" width="60%"><!-- 외각 시작 -->
<tr><td>
<table  class="pp" width="80%" CELLPADDING="10%"><!-- 전체 테이블 시작-->
   <tr><td>
      
      <table rules="none" width="80%"><!-- 1번 테이블 시작 -->
      <tr><td>
       <input type="text" class="textbox" value="Title"  name="title" size="100" 
       onfocus="if(this.value=='Title'){this.value=''}" 
       onblur="if(this.value =='') this.value='Title';">
      </td></tr></table><!-- 1번 테이블 끝 -->
   </td></tr>
   <tr><td>
      <table rules="none" width="80%"><!-- 2번 테이블 시작 -->
      <tr><td>
      <textarea rows="5" class="textbox" cols="100" name="content" 
      onclick="if(this.value=='리뷰를 입력하세요'){this.value=''}">리뷰를 입력하세요</textarea>
      </td></tr></table><!-- 2번 테이블 끝 -->
   </td></tr>
   
   <tr align="center"><td>
      <table  class="pp" align="center" width="80%" CELLPADDING="10%" rules="none"><!-- 3번 테이블 시작 -->
      <tr><td rowspan="2" width="50%">
      <img alt="사진첨부" src="../img/pic.png" width="70">
      <input type="file" name="photo1">
      <input type="file" name="photo2">
      <input type="file" name="photo3">
      </td>
      <td align="left" colspan="2">
      <font color="red" size="3">단점</font>
      <span><input type="checkbox" id="test1" name="revck_costeff">가성비</span>
      <span><input type="checkbox" id="test1" name="revch_design">디자인</span>
      <span><input type="checkbox" id="test1" name="revch_performance">성능</span>
      <span><input type="checkbox" id="test1" name="revch_as">A/S</span>
      <span><input type="checkbox" id="test1" name="revch_durability">내구성</span>
      <abbr title="단점을 체크해 주세요!!">
      <img alt="말풍선" src="../img/qq.jpg" width="25">
      </abbr>
      </td></tr>
      
      <tr><td align="center" width="25%">
      
      <div id="star"></div>
       <input type="hidden" id="rev_point" name ="rev_point" value="3"/>
      </td><td width="25%"><span id="hint"></span></td></tr>
      </table><!-- 3번 테이블 끝 -->
   </td></tr>
<tr><td width="25%" align="right">
<c:choose>
<c:when test="${sessionScope.loginId =='guest' || sessionScope.loginId ==null}">
<font color="white">
<input type="button" class="myButton" value="로그인 후 이용해주세요"onclick="location.href='../login/loginShow.do'"/></font>
</c:when>
<c:otherwise>
<input type="submit" class="myButton" value="등록">
<input type="reset" class="myButton" value="취소">
</c:otherwise>
</c:choose>
</td></tr>   
</table><!-- 전체 테이블 끝-->
<!-- 작업중 -->
<!-- <table align="center" width="90%" rules="none"> -->
<!-- <tr><td width="25%"></td> -->
<!-- <td width="25%"></td> -->
<!-- <td width="25%"></td> -->
<!-- <td width="25%" align="left"> -->
<%-- <c:choose> --%>
<%-- <c:when test="${sessionScope.loginId =='guest' || sessionScope.loginId ==null}"> --%>
<!-- <font color="white"> -->
<!-- <input type="button" class="myButton" value="로그인 후 이용해주세요"onclick="location.href='../login/loginShow.do'"/></font> -->
<%-- </c:when> --%>
<%-- <c:otherwise> --%>
<!-- <input type="submit" class="myButton" value="등록"> -->
<!-- <input type="reset" class="myButton" value="취소"> -->
<%-- </c:otherwise> --%>
<%-- </c:choose> --%>
<!-- </td></tr> -->
<!-- </table> -->
</td></tr>
</table><!-- 외각 끝 -->
</form>
</center>


<!---------------------리뷰 리스트  ----------------------------->
<br/>
<br/>
<c:if test="${review_list.listSize <=0}"></c:if>
<c:if test="${review_list.listSize >0}">
<center>
<c:forEach var="cnt" begin="0" end="${(review_list.listSize -1)}">
<table width="70%" align="center" class="dystable"> <!-- 위 전체 테이블 시작-->
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
가성비 
</span>
</c:if>
<c:if test="${check_list.revch_design[cnt]==1 }">
<span>
디자인 
</span>
</c:if>
<c:if test="${check_list.revch_performance[cnt]==1 }">
<span>
성능 
</span>
</c:if>
<c:if test="${check_list.revch_as[cnt]==1 }">
<span>
A/S
</span>
</c:if>
<c:if test="${check_list.revch_durability[cnt]==1 }">
<span>
내구성
</span>
</c:if>

<font color="red">단점</font>
 <!-- 위 전체 테이블 끝-->
</td>
</tr>
<tr>
<td align="center">

<!-- 이미지 -->
<c:if test="${review_list.rev_photo1[cnt] !=null}">
<img alt="photo1" src="../reviewimg/small${review_list.rev_photo1[cnt]}">
</c:if>
<c:if test="${review_list.rev_photo2[cnt] !=null}">
<img alt="photo2" src="../reviewimg/small${review_list.rev_photo2[cnt]}">
</c:if>
<c:if test="${review_list.rev_photo3[cnt] !=null}">
<img alt="photo3" src="../reviewimg/small${review_list.rev_photo3[cnt]}">
</c:if>

<!-- 이미지 -->
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
   <td colspan="2" width="110"><font color="red" size="2">이미 평가한 리뷰입니다.</font></td>
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
수정</a></td>
<td align="center">
<a href="../review/deletereview.do?reviewNum=
${review_list.rev_number[cnt]}&pro_number=${Product_LIST.pro_number}">
삭제</a></td>
</c:when>
<c:when test="${sessionScope.id != user_list.us_id[cnt]||sessionScope.id==null}">
</c:when>
</c:choose>
</tr>
</table> <!-- 아래 전체 테이블 끝-->

</c:forEach>
</center>
</c:if>
<!-- <h3><a href="../index/index.do">처음으로</a></h3> -->
 <script type="text/javascript">
      function insertReview(){
         var tit= document.getElementById('Title').value;
         var con= document.getElementById('content').value;
         if(tit==''||tit=='Title'){
            alert("제목을 입력하세요");
         }else if(con==''||con=='리뷰를 입력하세요'){
            alert("내용을 입력하세요");
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
                ,hints : ['정말 좋아요!', '그냥 그래요', '보통', '별로야', '최악!']
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