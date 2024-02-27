<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
			crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
	</head>

	<body>
		<div class="container-fluid">
			<a href="/"><img src="https://static.coupangcdn.com/image/static/login/logo-coupang.x2.20201201.png"></a>

			<h2>회원 정보를 입력해주세요</h2>
			<form action="/register" method="post">
				<div class="mb-3 row">
					<label for="staticEmail" class="col-sm-2 col-form-label">
						<i class="fa-regular fa-envelope"></i></label>
					<div class="col-sm-10">
						<input type="text" class="form-control-plaintext" id="staticEmail" placeholder="아이디(이메일)"
							name="id" />
					</div>
				</div>
				<div class="mb-3 row">
					<label for="inputPassword" class="col-sm-2 col-form-label"><i class="fa-solid fa-lock"></i></label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword">
					</div>
				</div>

				<div class="mb-3 row">
					<label for="inputPassword" class="col-sm-2 col-form-label"><i class="fa-solid fa-lock"></i></label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword">
					</div>
				</div>

				<div class="mb-3 row">
					<label for="inputPassword" class="col-sm-2 col-form-label"><i
							class="fa-regular fa-user"></i></label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword">
					</div>
				</div>

				<div class="mb-3 row">
					<label for="inputPassword" class="col-sm-2 col-form-label"><i
							class="fa-solid fa-mobile-screen-button"></i></label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword">
					</div>
				</div>

				<button type="button" class="btn btn-primary">동의하고 가입하기</button>
			</form>
		</div>
	</body>

	</html>