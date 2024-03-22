<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css" />
<link href="../../resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/account/changePwd.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<title>Primavera</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<header>
			<nav>
				<a href="/">Primavera</a>
			</nav>
			<nav>
				<a href="mainMap">Store</a> <a href="#">Guide</a> <a href="collectPage">PickUp</a> <a
					href="/notice/list">Board</a> <span>
					<a href="/review/list">Review</a> <a href="listQna">Q & A</a> <a href="/notice/list">Notice</a>
				</span> <a href="myPage"><i class="fa-regular fa-user"></i></a>
			</nav>
			</header>
<body>
	<main>
	<div class="center-wrap">
		<h1>이메일 인증</h1>
		<form action="/checkEmail" method="post" id="frm">
			<div id="input">
				<div id="idEmail">
					<div>
						<p>아이디</p>
						<input size="15" type="text" id="id" name="id" value="${id}" >
					</div>
						
					<div>
						<p>이메일</p>
						<input type="text" name="email" id="email" disabled="disabled" placeholder="이메일을 입력해주세요.">
					</div>
				</div>
				
				<div>
					<input type="button" value="인증하기" disabled="disabled"
						class="button" id="emailAuth">
				</div>
					<input class="form-control" placeholder="인증 코드 6자리를 입력해주세요" maxlength="6" disabled="disabled" name="authCode" id="authCode" type="text" autofocus/>
					<span id="emailAuthWarn">&nbsp;</span>
				<button type="submit" id="check" class="button" disabled="disabled" >비밀번호 재설정</button>
			</div>
		</form>
		<div id="sidemenu">
			<a href="findId">아이디 찾기</a>
			<span>&nbsp;|&nbsp;</span>
			<a href="myPage">로그인</a>
			<span>&nbsp;|&nbsp;</span>
			<a href="register">회원가입</a>
		</div>
		</div>
	</main>
	
	<script type="text/javascript">
	const url = window.location.search;
	
	const urlParams = new URLSearchParams(url);
	const idc = urlParams.has('id');

	window.onload = function(){
		if(idc === true){
			document.querySelector('#email').disabled=false;
			document.querySelector('#email').focus();
		} else {
			document.querySelector('#id').focus();
		}
		
	}
	
	idDupCheck = false;
	
	<!-- 아이디 존재 여부 확인 -->
		$('#id').keyup(() => {
			const id = $('#id').val();

			$.ajax({
				type: "post",
				url: "/check",
				data: "id=" + id,
	
				success: function (result) {
					if (result) {
						// 아이디가 존재할 경우 이메일 인증 버튼 활성화
						$('#email').attr('disabled', false);
						idDupCheck = true;
					} else {
						// 아이디가 존재하지 않을 경우 이메일 인증 버튼 비활성화
						$('#email').attr('disabled', true);
						idDupCheck = false;
					}
				}
			})
		})
		
	<!-- 아이디와 이메일이 일치하는 회원이 있는지 확인하여 인증하기 버튼 활성화 -->
		$('#email').keyup(()=>{
			const id=$('#id').val();
			const email=$('#email').val();
			
			$.ajax({
				type:"post",
				url:"/checkUser",
				data: $('#frm').serialize(),
				
				success: function (result){
					if(result){
						$('#emailAuth').attr('disabled', false);
					} else {
						$('#emailAuth').attr('disabled', true);
					}
						
				}
			})
			
		})	
	
		$("#emailAuth").click(function(){
			const email = $("#email").val();
			
			$.ajax({
				url: './EmailAuth',
				data : {
				email : email
			},
			type : 'POST',
			dataType: 'json',
			success: function(result){
				$("#authCode").attr("disabled", false);
				code=result;
				alert("인증 코드가 입력한 이메일로 전송 되었습니다.");
			}
			});
		});
		
		$('#authCode').keyup(function(){
			const inputCode = $('#authCode').val();
			
			if(Number(inputCode) === code){
				$('#emailAuthWarn').html('인증번호가 일치합니다.');
				$("#emailAuthWarn").css('color', 'white');
				$('#emailAuthWarn').css('font-weight', 'bolder');
	    		$('#emailAuth').attr('disabled', true);
	    		$('#email').attr('readonly', true);
	    		$("#check").attr('disabled', false);
			} else if (Number(inputCode) == ""){
					$('#emailAuthWarn').html('');
			}	else{
			
				$("#emailAuthWarn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
	        	$("#emailAuthWarn").css('color', 'black');
	        	$('#emailAuthWarn').css('font-weight', 'bolder');
	        	$("#check").attr('disabled', true);
			}
		});
		
		
	</script>
</body>
</html>