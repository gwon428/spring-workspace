<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css" />
<link href="../../resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/account/findId.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
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
		<h1>아이디 찾기</h1>
		<form action="/findId" method="post">
			<div id="input">
				<div>
					<p>이름 </p> <input size="15" type="text" name="name"
						placeholder="이름을 입력해주세요.">
				</div>
				<div>
					<p>이메일 </p>
					<input type="text" name="email"
						placeholder="이메일을 입력해주세요.">
				</div>
			</div>
			<input type="submit" value="아이디 찾기" class="button">
		</form>
		<div id="sidemenu">
			<a href="changePwd">비밀번호 찾기</a>
			<span>&nbsp;|&nbsp;</span>
			<a href="myPage">로그인</a>
			<span>&nbsp;|&nbsp;</span>
			<a href="register">회원가입</a>
		</div>
		</div>
	</main>
</body>
</html>