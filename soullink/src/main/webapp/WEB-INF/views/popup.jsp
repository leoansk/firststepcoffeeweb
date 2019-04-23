<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<!-- Jquery-3.3.1 -->
	<script src="../resources/jquery/jquery-3.3.1.js"></script>
	
</head>
<body>
	<table width="" border="0" cellpadding="0" cellspacing="0">
		<tbody>
			<tr>
				<td>
					<img src="/resources/suit/img/popup_1.png" width="100%"	height="100%" border="0">
				</td>
			</tr>
			<tr>
				<td height="30" align="right" bgcolor="#000000">
					<table border="0" cellpadding="0" cellspacing="2">
						<tbody>
							<tr>
								<td>
									<input class="PopupCheck" type="checkbox" name="pop" onclick="closePop()">
								</td>
								<td style="font-size: 11px; color: #FFFFFF;">
									1일동안 이 창을 열지않음
								</td>
								<td style="font-size: 11px; ">
									<a href="javascript:self.close();" onfocus="this.blur()">[닫기]</a>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</body>

<script>
	function setCookie(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}

	function closePop() {
		console.log("closePop()을 실행시키는가?");
		/* if(document.frm.pop.checked) {
			console.log("documnet.frm.pop.checked_1");
			//하루동안 쿠키 셋팅
			setCookie("popname", "done", 1);
			console.log("쿠키 셋티 끝 1");
		} */
		
		/* 
		if(document.pop.checked){
			console.log("documnet.pop.checked_2");
			setCookie("popname","done", 1);
		}
		 */
		/* 만약 하루동안 다시보지 않기를 클릭하면 쿠키 생성 */
		if($("input:checkbox[name='pop']").is(":checked") == true){
			console.log("과연 될까요?");
			setCookie("popname","done", 1);
			console.log("쿠키 셋팅 끝 2");
		}
		self.close();
	}
</script>
</html>