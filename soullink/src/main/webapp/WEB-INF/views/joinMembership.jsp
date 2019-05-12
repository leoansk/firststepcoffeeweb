<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
	$('checkId').click(function(){
		console.log("checkId()들어왔나?");
		var checkNum = $('.check').prop("checked");
		console.log("들어왔나??"+checkNum);
		
		var checkId = $("#id").val();
		console.log(checkId);
		/* json데이터 타입으로 파라미터를 서버로 전달하기 위해서 userData변수는 json타입으로 만들어줬다 */
		var userData = {"id": checkId};
		
		if(checkId == false){
			alert("아이디를 입력해주세요.");
		}else{
			$.ajax({
				type: "POST",
				url: "checkId",
				data: userData,
				dataType: "json",
				error: function(error){
					alert("서버가 응답하지 않습니다. 다시 시도해주시기 바랍니다.");
				},
				success: function(result){
					if(result == 0){
						/* 
						$("#id").attr("disabled", true);
						 */
						alert("사용이 가능한 아이디입니다.");
						
					}else if(result == 1){
						alert("이미 존재하는 아이디입니다. 다른 아이디를 사용해주세요");
					}else{
						alert("에러가 발생하였습니다.");
					}
				}
			});
		}		
	});


</script>
	
	<div class="container">
		<form role="form" id="signupForm" action="/joinMembership" method="post" >
			<p>
				<label for="id" style="color: white">아이디*</label> 
				<input id="id" name="id" type="text"/>
				<!-- 아작스를 사용 비동기통신으로~ -->
				<input class="check" type="button" value="중복체크" name="idCheck" onclick="idCheck()" />
				 
				<button class="checkId" name="checkId" >체크</button>
			 
			</p>
			<p>
				<label for="password"style="color: white">비밀번호*</label> 
				<input id="password" name="password" type="password" />
			</p>
			<p>
				<label for="password_re"style="color: white">비번확인*</label> 
				<input id="password_re" name="password_re" type="password" />
			</p>
			<p>
				<label for="email"style="color: white">이메일  *</label> 
				<input id="email" name="email" type="email" />
			</p>
			<p>
				<label for="newsletter"style="color: white">약관동의 *</label> 
				<label style="color: white"> 
					동의합니다. 
					<input type="checkbox" id="agree" name="agree" />
				</label>
			</p>
			<p>
				<input class="submit" type="submit" value="Submit"/>
			</p>
		</form>
	</div>
	
	<!-- 사용자 스크립트 블록 -->
	<script type="text/javascript">
		$(function() {
			$("#signupForm").validate({
				rules: {
					id: {
						required: true,
						minlength: 4
					},
					password: {
						required: true,
						minlength: 4,
						maxlength: 8
					},
					password_re: {
						required: true,
						equalTo: "#password"
					},
					email: {
						required: true,
						email: true
					},
					agree: "required"
				},
				messages: {
					id: {
						required: "아이디를 입력해 주세요.",
						minlength: "아이디는 최소 {0}글자 입니다."
					},
					password: {
						required: "비밀번호를 입력해 주세요.",
						minlength: "비밀번호는 최소 {0}글자 입니다.",
						maxlength: "비밀번호는 최대 {0}글자 입니다.",
					},
					password_re: {
						required: "비밀번호 확인값을 입력해 주세요.",
						equalTo: "비밀번호 확인이 잘못되었습니다."
					},
					email: {
						required: "이메일을 입력해 주세요.",
						email: "이메일이 형식에 맞지 않습니다."
					},
					agree: "약관 동의에 체크해 주세요."
				}
			});
		});
		
		function idCheck(){
			console.log("idCheck()들어왔나?");
			var checkNum = $('.check').prop("checked");
			console.log("들어왔나??"+checkNum);
			
			var checkId = $("#id").val();
			console.log(checkId);
			/* json데이터 타입으로 파라미터를 서버로 전달하기 위해서 userData변수는 json타입으로 만들어줬다 */
			var userData = {"id": checkId};
			
			if(checkId == false){
				alert("아이디를 입력해주세요.");
			}else{
				$.ajax({
					type: "POST",
					url: "checkId",
					data: userData,
					dataType: "json",
					error: function(error){
						alert("서버가 응답하지 않습니다. 다시 시도해주시기 바랍니다.");
					},
					success: function(result){
						if(result == 0){
							/* 
							$("#id").attr("disabled", true);
							 */
							alert("사용이 가능한 아이디입니다.");
							
						}else if(result == 1){
							alert("이미 존재하는 아이디입니다. 다른 아이디를 사용해주세요");
						}else{
							alert("에러가 발생하였습니다.");
						}
					}
				});
			}
		};
		
		
	</script>
	
	
<%@include file="/WEB-INF/views/include/footer.jsp"%>