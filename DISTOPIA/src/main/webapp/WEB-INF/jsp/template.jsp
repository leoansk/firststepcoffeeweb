<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>DYSTOPIA</title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"   rel="stylesheet" />
<link href="../css/default.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/myfont.css">
<link rel="apple-touch-icon" sizes="57x57" href="../icon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="../icon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="../icon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="../icon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="../icon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="../icon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="../icon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="../icon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="../icon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="../icon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="../icon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="../icon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="../icon/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
</head>
<body>
<script type="text/javascript">

function button1_click() {
	alert("로그아웃 하시겠습니까?");
	document.logout.submit();
	
}
</script>
<center>
<table width="100%" height="500" class="main" cellpadding="0" rules="none">
<tr><td height="10%" width="60%" align="right">
<!-- 버튼 테이블 -->
<table  width="20%" >
<tr>
<c:choose>
<c:when test="${sessionScope.loginId == null || sessionScope.loginId =='guest'}">
<td align="center"><font color="white">
<input type="button" class="myButton" value="login" onclick="location.href='../login/loginShow.do'"/></font></td>
</c:when>
<c:when test="${sessionScope.loginId != null }">
<td id="font">${sessionScope.loginId } 님</td>
<td><a href="../like/readLike.do"><img src="../img/cart.png" alt="cart"></a></td>
<td><a href="../users/read.do"><img src="../img/user.png" alt="cart"></a></td>
<td>
<form action="../logout/logout.do" method="POST" name="logout">
<input class="myButton" type="button" onclick="button1_click();" value="logout"/>
</form>
</td>
</c:when>

<c:when test="${sessionScope.loginId == 'Master' }">
<td  ><font color="white"> ${sessionScope.loginId } 님</font></td>
<td><a href="#"><img src="../img/cart.png" alt="cart"></a></td>
<td><a href="../users/read.do"><img src="../img/user.png" alt="cart"></a></td>
<td>
<form action="../logout/logout.do" method="POST">
<input class="myButton" type="submit" value="로그아웃"/>
</form>
</td>
</c:when>

</c:choose>



<td width="15%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

</tr>
</table>
</td></tr>

<!-- 몸통 -->
<tr><td>
<table border="0" width="100%" height="100%" cellpadding="0" class="maina">
<tr><td height="30"></td></tr><!-- 1 -->
<!-- 2 -->
<tr><td height="30%" align="center">
<table border="0" class="maina">
<tr><td align="center"><a href="../product/beatproduct.do"><img alt="메인글씨" src="../img/mainText2.png"></a></td></tr></table>
</td></tr>
<tr><td align="center">
</td></tr><!-- 3 -->
<tr><td align="center">
<table class="maina" cellpadding="0" border="0"><tr><td align="center">
<!--  검색메뉴 -->
<form  id="search" action="../search/searchPro.do" method="POST">
         <input type="text" class="search" placeholder="search" name="search">
         <button type="submit">Submit</button>
      </form>
</td></tr></table>
</td></tr><!-- 4 -->
<tr><td align="center"></td></tr><!-- 5 -->
</table>
</td></tr>
<!-- 메뉴 -->
<tr><td align="center" valign="bottom">
<center>
      <div id="menu" class="container">
            <tr>
               <td valign="bottom">
                  <div class='menu' align="center">
                     <ul>
                        <li class='active sub'><a href='#'>HOME APPLIANCES</a>
                           <ul>
                              <li><a href='../product/read.do?SCnum=1'>주방가전</a></li>
                              <li><a href='../product/read.do?SCnum=2'>생활가전</a></li>
                              <li><a href='../product/read.do?SCnum=3'>티비가전</a></li>
                              <li><a href='../product/read.do?SCnum=4'>디지털카메라</a></li>
                           </ul></li>

                        <li class='active sub'><a href='#'>COMPUTER</a>
                           <ul>
                              <li><a href='../product/read.do?SCnum=5'>데스크탑</a></li>
                              <li><a href='../product/read.do?SCnum=6'>노트북</a></li>
                              <li><a href='../product/read.do?SCnum=7'>2in1</a></li>
                              <li><a href='../product/read.do?SCnum=8'>주변기기</a></li>
                           </ul></li>

                        <li class='active sub'><a href='#'>SMART DEVICE</a>
                           <ul>
                              <li><a href='../product/read.do?SCnum=9'>스마트폰</a></li>
                              <li><a href='../product/read.do?SCnum=10'>테블릿</a></li>
                              <li><a href='../product/read.do?SCnum=11'>스마트워치</a></li>
                              <li><a href='../product/read.do?SCnum=12'>주변기기</a></li>
                           </ul></li>

                        <li class='active sub'><a href='#'>ETC</a>
                           <ul>
                              <li><a href='../product/read.do?SCnum=13'>가구</a></li>
                              <li><a href='../product/read.do?SCnum=14'>의류</a></li>
                              <li><a href='../product/read.do?SCnum=15'>스포츠</a></li>
                              <li><a href='../product/read.do?SCnum=16'>문구</a></li>
                           </ul>
                        </li>

                        <li class='list'><a href='../page/page.do'>UTOPIA</a></li>
                        <c:choose>
                     	 <c:when test="${sessionScope.loginId == 'Master' }">
                        <li class='list'><a href='../login/Master.do'>UserPage</a></li>
                         <li class='list'><a href='../product/proinsertview.do'>상품등록</a></li>
                        </c:when>
                        </c:choose>
                     </ul>
                  </div>
               </td>
            </tr>
         </div>
</center>
</td></tr>
</table>

</center>
<!--------------------------------- body ------------------------------->

<div id="main_body" >
      <table align="center" width="80%" >
         <tr>
            <td  valign="top">
               <c:if test="${! empty BODY }">
               
                  <jsp:include page="${BODY }"/>
               
               </c:if>
            </td>
         </tr>
      </table>
   </div>
   
<%--    ${sessionScope.loginId } --%>
   <br>
   
   <center>
   <div id="footer">
      <p>
         &copy; Dystopia Design by DystopiaTeam 
         <a href="../users/ourinfo.do">DystopiaInfo</a>. Photos by ask &nbsp;
      </p>
   </div>
   </center>
</body>
</html>