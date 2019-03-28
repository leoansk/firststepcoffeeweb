<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>마이 페이지</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<script type="text/javascript">
      function picmove(){
    	  document.aa.submit();
      }
      function button_event(){
    	  if (confirm("정보를 수정 하시겠습니까?") == true){    //확인
    		  alert("수정완료");
    	      document.form.submit();
    	  }else{   //취소
    		  alert("취소");
				return false;
    	  }
    }
      
   
</script>
	<div>
		<center>
			<table class="dystable">
				<tr>
					<td valign="top">
						<h2 align="center">MyPage</h2>
							<form action="../users/updateButtonClick.do" method="post" name="form">
								<table border="1" class="dystable" align="left">
									<tr>
										<th>구분</th>
										<th>정보</th>
									</tr>
									<tr>
										<th>사진</th>
										<td>
								            <img src="<c:url value="../image/imagePrint.do">
								            <%-- <c:param name="네임 정해주세요" value="${이엘로 전달해 주세요(컨트롤러로감) }"></c:param> --%>
								            	<c:param name="id" value="${Users_LIST.us_id[0] }"></c:param>
								            </c:url>" width="200" height="200">
								         </td>
									</tr>
									<tr>
										<th>아이디</th>
										<td onclick="alert('아이디는 수정하실수 없습니다.고객센터로 문의 바랍니다.')">
											${Users_LIST.us_id[0]}
										</td>
									</tr>
									<tr>
										<th>패스워드</th>
										<td>
											<input type="text" class="textbox" name="us_password" size="20" value="${Users_LIST.us_password[0]}">
										</td>
									</tr>
										<tr>
										<th>이름</th>
										<td>
											<input type="text" class="textbox" name="us_name" size="20" value="${Users_LIST.us_name[0]}">
										</td>
									</tr>
									
									<tr>
										<th>나이</th>
										<td>
											<input type="text" class="textbox" name="us_age" size="20" value="${Users_LIST.us_age[0]}">
										</td>
									</tr>
									<tr>
										<th>성별</th>
										<td>
											<input type="text" class="textbox" name="us_gender" size="20" value="${Users_LIST.us_gender[0]}">
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											<input type="text" class="textbox" name="us_address" size="20" value="${Users_LIST.us_address[0]}">
										</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>
											<input type="text" class="textbox" name="us_email" size="20" value="${Users_LIST.us_email[0]}">
										</td>
									</tr>
									<tr>
										<th>폰번호</th>
										<td>
											<input type="text" class="textbox" name="us_phone" size="20" value="${Users_LIST.us_phone[0]}">
										</td>
									</tr>
									<tr>
										<th>생년월일</th>
										<td>
											<input type="text" class="textbox" name="us_birthday" size="20" value="${Users_LIST.us_birthday[0]}">
										</td>
									</tr>
									<tr>
										<td>
											<input type="button" value="정보수정" class="myButton" onclick="button_event();">
											<input class="myButton" type="button" onclick="picmove();" value="사진수정">
											<!-- <button class="myButton" onclick="picmove();"></button> -->
											
<!-- 							<input type="button" value="사진수정" href="../image/imageBLOB.do"> -->
										</td>
									</tr>
								</table>
							</form>
		<form action="../image/imageBLOB.do" name="aa" method="get" id="aa">
</form>
						</td>

					<td valign="top">
						<h2 align="center">MyDysPoint</h2>
						<table border="1" class="dystable" align="right">
							<tr>
								<th>구분</th>
								<th>등급</th>
								<th>포인트</th>
							</tr>
							<tr>
								<th>주방가전</th>
								<td>
									<c:choose>
										<c:when test="${10 < Rank_LIST.rank_kitchen[0] && Rank_LIST.rank_kitchen[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_kitchen[0] && Rank_LIST.rank_kitchen[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_kitchen[0] && Rank_LIST.rank_kitchen[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
									
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_kitchen[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_kitchen[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>생활가전</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_life[0] && Rank_LIST.rank_life[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_life[0] && Rank_LIST.rank_life[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_life[0] && Rank_LIST.rank_life[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_life[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_life[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>티비</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_tv[0] && Rank_LIST.rank_tv[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_tv[0] && Rank_LIST.rank_tv[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_tv[0] && Rank_LIST.rank_tv[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_tv[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_tv[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>디카</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_digitalcamera[0] && Rank_LIST.rank_digitalcamera[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_digitalcamera[0] && Rank_LIST.rank_digitalcamera[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_digitalcamera[0] && Rank_LIST.rank_digitalcamera[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_digitalcamera[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_digitalcamera[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>데스크탑</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_desktop[0] && Rank_LIST.rank_desktop[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_desktop[0] && Rank_LIST.rank_desktop[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_desktop[0] && Rank_LIST.rank_desktop[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_desktop[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_desktop[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>노트북</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_notebook[0] && Rank_LIST.rank_notebook[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_notebook[0] && Rank_LIST.rank_notebook[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_notebook[0] && Rank_LIST.rank_notebook[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_notebook[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_notebook[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>2inOne</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_2in1[0] && Rank_LIST.rank_2in1[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_2in1[0] && Rank_LIST.rank_2in1[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_2in1[0] && Rank_LIST.rank_2in1[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_2in1[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_2in1[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>주변기기</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_peripheral_com[0] && Rank_LIST.rank_peripheral_com[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_peripheral_com[0] && Rank_LIST.rank_peripheral_com[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_peripheral_com[0] && Rank_LIST.rank_peripheral_com[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_peripheral_com[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_peripheral_com[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>스마트폰</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_smartphone[0] && Rank_LIST.rank_smartphone[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_smartphone[0] && Rank_LIST.rank_smartphone[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_smartphone[0] && Rank_LIST.rank_smartphone[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_smartphone[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_smartphone[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>태블릿</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_tablet[0] && Rank_LIST.rank_tablet[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_tablet[0] && Rank_LIST.rank_tablet[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_tablet[0] && Rank_LIST.rank_tablet[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_tablet[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_tablet[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>스마트워치</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_smartwatch[0] && Rank_LIST.rank_smartwatch[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_smartwatch[0] && Rank_LIST.rank_smartwatch[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_smartwatch[0] && Rank_LIST.rank_smartwatch[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_smartwatch[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_smartwatch[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>주변기기</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_peripheral_smart[0] && Rank_LIST.rank_peripheral_smart[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_peripheral_smart[0] && Rank_LIST.rank_peripheral_smart[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_peripheral_smart[0] && Rank_LIST.rank_peripheral_smart[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_peripheral_smart[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_peripheral_smart[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>가구</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_furniture[0] && Rank_LIST.rank_furniture[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_furniture[0] && Rank_LIST.rank_furniture[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_furniture[0] && Rank_LIST.rank_furniture[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_furniture[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_furniture[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>의류</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_clothing[0] && Rank_LIST.rank_clothing[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_clothing[0] && Rank_LIST.rank_clothing[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_clothing[0] && Rank_LIST.rank_clothing[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_clothing[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_clothing[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>스포츠</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_sport[0] && Rank_LIST.rank_sport[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_sport[0] && Rank_LIST.rank_sport[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_sport[0] && Rank_LIST.rank_sport[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_sport[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_sport[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>문구</th>
								<td>
									<c:choose>
										<c:when test="${0 < Rank_LIST.rank_stationery[0] && Rank_LIST.rank_stationery[0] < 50}">Deser</c:when>
										<c:when test="${50 < Rank_LIST.rank_stationery[0] && Rank_LIST.rank_stationery[0] < 100}">ProDiser</c:when>
										<c:when test="${100 < Rank_LIST.rank_stationery[0] && Rank_LIST.rank_stationery[0] < 1000}">SuperDiser</c:when>
										<c:otherwise>Normal</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${Rank_LIST.rank_stationery[0] == null}">0</c:when>
										<c:otherwise>${Rank_LIST.rank_stationery[0]}</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

		</center>
	</div>
	<br />
<!-- 	<h3> -->
<!-- 		<a href="../page/page.do">처음으로</a> -->
<!-- 	</h3> -->


</body>
</html>