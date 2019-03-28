<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/jquery.raty.js"></script>
<title>Insert title here</title>
</head>
<body>
<center>
<img alt="사진첨부" src="../img/MA2.png" >
</center>
<br/><br/>
<center>
<form action="../review/insert.do" method="post" 
id="form" name="form" enctype="multipart/form-data">
<input type="hidden" value="${Product_LIST.pro_number[0]}" name="pro_number">
<table  width="80%"  class="dystable"><!-- 외각 시작 -->
<tr><td rowspan="3" width="28%" align="center">
<img alt="제품사진" src="../proimage/${Product_LIST.pro_photo[0]}"  width="150">
${Product_LIST.pro_name[0]}
</td><td>
<table width="100%" CELLPADDING="10%"  class="dystable"><!-- 전체 테이블 시작-->
   <tr><td>
      
      <table  rules="none" width="100%" ><!-- 1번 테이블 시작 -->
      <tr><td>
       <input type="text"  class="textbox"  value="Title" id="Title" name="title" size="85" 
       onfocus="if(this.value=='Title'){this.value=''}" 
       onblur="if(this.value =='') this.value='Title';">
      </td></tr></table><!-- 1번 테이블 끝 -->
   </td></tr>
   
   <tr><td>
      <table border="0" rules="none" width="100%"><!-- 2번 테이블 시작 -->
      <tr><td>
      <textarea rows="5"  class="textbox"  id="content" cols="86" name="content" 
      onclick="if(this.value=='리뷰를 입력하세요'){this.value=''}">리뷰를 입력하세요</textarea>
      </td></tr></table><!-- 2번 테이블 끝 -->
   </td></tr>
   
   <tr><td>
      <table border="0" width="100%" CELLPADDING="10%"><!-- 3번 테이블 시작 -->
      <tr><td rowspan="2" width="30%">
      <!-- <img alt="사진첨부" src="../img/pic.jpg" width="70"> -->
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
   
</table><!-- 전체 테이블 끝-->
<table  width="100%" border="0">
<tr><td width="25%"></td>
<td width="25%"></td>
<td width="25%"></td>
<td width="25%" align="left">
<c:choose>
<c:when test="${sessionScope.loginId =='guest' || sessionScope.loginId ==null}">
<font color="white">
<input type="button" class="myButton" value="로그인 후 이용해주세요"onclick="location.href='../login/loginShow.do'"/></font>
</c:when>
<c:otherwise>
<input type="button" class="myButton" value="등록" onClick="insertReview()">
<input type="reset" class="myButton" value="취소">
</c:otherwise>
</c:choose>

</td></tr>
</table>
</td></tr>
</table><!-- 외각 끝 -->
</form>
</center>


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