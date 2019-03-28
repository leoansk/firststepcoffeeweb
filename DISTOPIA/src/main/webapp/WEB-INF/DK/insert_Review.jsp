<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>Insert title here</title>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="../js/jquery.raty.js"></script>
</head>
<body>
<center>
<h1>${title }</h1>
<form action="../review/insert.do" method="post">
<table border="1" width="60%"><!-- 외각 시작 -->
<tr><td>
<table width="100%" CELLPADDING="10%"><!-- 전체 테이블 시작-->
	<tr><td>
	
		<table border="0" rules="none" width="100%"><!-- 1번 테이블 시작 -->
		<tr><td>
		 <input type="text" class="textbox"  value="Title"  name="TITLE" size="111" 
		 onfocus="if(this.value=='Title'){this.value=''}" 
		 onblur="if(this.value =='') this.value='Title';">
		</td></tr></table><!-- 1번 테이블 끝 -->
	</td></tr>
	
	<tr><td>
		<table border="0" rules="none" width="100%"><!-- 2번 테이블 시작 -->
		<tr><td>
		<textarea rows="5" cols="113" name="CONTENT" 
		onclick="if(this.value=='리뷰를 입력하세요'){this.value=''}">리뷰를 입력하세요</textarea>
		</td></tr></table><!-- 2번 테이블 끝 -->
	</td></tr>
	
	<tr><td>
		<table border="0" rules="none" width="100%" CELLPADDING="10%"><!-- 3번 테이블 시작 -->
		<tr><td rowspan="2">
		<img alt="사진첨부" src="../img/pic.jpg" width="70">
		</td>
		<td align="center">가성비&nbsp;&nbsp;&nbsp; 디자인&nbsp;&nbsp;&nbsp; 
		성능&nbsp;&nbsp;&nbsp; A/S&nbsp;&nbsp;&nbsp; 내구성</td></tr>
		<tr><td align="center">
		
		<div id="star"></div><span id="hint"></span>
        
            
       
       
		
		</td></tr>
		</table><!-- 3번 테이블 끝 -->
	</td></tr>
	
</table><!-- 전체 테이블 끝-->
<table width="100%" border="0">
<tr><td width="25%"></td>
<td width="25%"></td>
<td width="25%"></td>
<td width="25%" align="left">
<input type="submit"class="myButton" value="등록">
<input type="reset"class="myButton" value="취소">
</td></tr>
</table>
</td></tr>
</table><!-- 외각 끝 -->
</form>
</center>
 <script type="text/javascript">
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
                    $("#starRating").val(score);
                    
                    //$("#displayStarRating").html(score);
                }
            });
        });
    </script>
</body>
</html>