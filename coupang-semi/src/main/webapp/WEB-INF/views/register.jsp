<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>회원가입</title>
<link rel="shortcut icon"
	href="https://image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico" />
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
	
	<script
      src="https://kit.fontawesome.com/4602e82315.js"
      crossorigin="anonymous"
    ></script>
<style>
.register-logo {
	display: block;
	text-align: center;
	margin-top: 50px;
}

.register-logo img {
	width: 200px;
}
.register-form {
	width: 500px;
	margin: auto;
	margin-top: 30px;
	box-sizing: border-box;
}
.register-form .mb-3 {
	width: 100%;
	margin-left: 0;
}
.register-form i {
	font-size: 1.2rem;
	color: gray;
}
form h2 {
	font-size: 1rem;
	font-weight: bold;
	margin-bottom: 20px;
}
form .mb-3 {
	border: 1px solid gray;
}
.register-btn {
	width: 100%;
	border-radius: 0;
	font-weight: bold;
	padding: 15px;
}
.register-form label {
	width: 40px;
	background-color: #eee;
	border-right: 1px solid gray;
}
.register-form .col-sm-10 {
	padding: 0;
	width: calc(100% - 40px);
}
.register-form .col-sm-10 input {
	border-radius: 0;
	outline: none;
}
.register-form .form-control-plaintext {
	padding-left: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<a href="/" class="register-logo"> <img
			src="https://static.coupangcdn.com/image/static/login/logo-coupang.x2.20201201.png" />
		</a>
		<form class="register-form" action="/register" method="post">
			<h2>회원정보를 입력해주세요</h2>
			<div class="mb-3 row">
				<label for="staticEmail" class="col-sm-2 col-form-label"><i class="fa-regular fa-envelope"></i></label>
				<div class="col-sm-10">
					<input type="text" class="form-control-plaintext"
						id="staticEmail" placeholder="아이디(이메일)" name="id"/>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="password" class="col-sm-2 col-form-label"><i class="fa-solid fa-lock"></i></label>
				<div class="col-sm-10">
					<input type="password" class="form-control-plaintext" id="password" name="password" placeholder="비밀번호"/>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="password-check" class="col-sm-2 col-form-label"><i class="fa-solid fa-lock"></i></label>
				<div class="col-sm-10">
					<input type="password" class="form-control-plaintext" id="password-check" placeholder="비밀번호 확인"/>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="name" class="col-sm-2 col-form-label"><i class="fa-regular fa-user"></i></label>
				<div class="col-sm-10">
					<input type="text" class="form-control-plaintext" id="name" name="name" placeholder="이름" />
				</div>
			</div>
			<div class="mb-3 row">
				<label for="phone" class="col-sm-2 col-form-label"><i class="fa-solid fa-mobile-screen"></i></label>
				<div class="col-sm-10">
					<input type="text" class="form-control-plaintext" id="phone" name="phone" placeholder="휴대폰 번호"/>
				</div>
			</div>
			<button type="submit" class="btn btn-primary register-btn">동의하고 가입하기</button>
		</form>
	</div>
</body>
</html>