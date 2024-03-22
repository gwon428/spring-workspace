<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="/resources/css/reset.css" />
		<link href="../../resources/css/header.css" rel="stylesheet" type="text/css">
		<link href="../../resources/css/account/changePassword.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
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
	<h1>비밀번호 재설정</h1>
		<form action="updatePwd" method="post" onsubmit="return validate()">
			<div id="changeId">
				<p>아이디</p>
				<input type="text" name="id" id="id" value="${id}">
			</div>
			<span> &nbsp; </span>
			<div id="changePwd">
				<p>비밀번호</p>
				<input type="password" name="password" id="userPwd" required>
			</div>
			<span id="pwdreg"> &nbsp; </span>
			<div id="changePwdCheck">
				<p>비밀번호 확인</p>
				<input type="password" id="passwordcheck" required>
			</div>
			<span id="pwdcheckreg"> &nbsp; </span>
			<input type="submit" value="비밀번호 재설정" id="change">
		</form>
		</div>
	</main>

<script>
let pwdCheck = false;
let pwdCheck2 = false;

//비밀번호 정규표현식
$('#userPwd').keyup((e) =>{
	 let pwd =$(e.target).val(); 

	const regExp = /^[!-~]{8,15}$/;
	
	if(regExp.test(pwd) || pwd === ""){
		$('#pwdreg').text("");
		pwdCheck = false;
	} else {
		$('#pwdreg').text("영문자, 숫자, 특수문자 포함하여 총 8~15자로 입력하세요.").css("color", "black");
		$('#pwdreg').css("font-weight", "bolder");
		pwdCheck = true;
	}
});


// 비밀번호 확인
$('#passwordcheck').keyup((e) =>{
	let pwd = $('#userPwd').val();
	let pwdCheck = $(e.target).val();
	
	if((pwd === pwdCheck) || pwdCheck === "") {
		$('#pwdcheckreg').text("");
		pwdCheck2 = false;
	} else {
		$('#pwdcheckreg').text("위의 비밀번호와 일치하게 입력하세요.").css("color", "black");
		$('#pwdcheckreg').css("font-weight", "bolder");
		pwdCheck2 = true;
	}
});

function validate(){
	if(pwdCheck){
		userPwd.focus();
		return false;
	} else if(pwdCheck2){
		passwordcheck.focus();
		return false;
	} return true;
}
</script>
</body>

</html>