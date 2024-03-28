
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<link rel="stylesheet" href="/resources/css/reset.css" />
				<link href="../../resources/css/header.css" rel="stylesheet" type="text/css">
				<link href="../../resources/css/user/updateCheck.css" rel="stylesheet" type="text/css">
				<meta charset="UTF-8">
				<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
				<title>Insert title here</title>
				<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
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
				<sec:authentication property="principal" var="user" />
				<main>

		<div id="sideMenu">
			<a href="showReview" id="showReview">My Review</a> <a href="showQna">내 Q&A</a> <a
				href="showCollect">진행 상황</a> <a href="userUpdate" id="update">회원
				정보 수정</a> <a href="deleteUser">회원 탈퇴</a> <a href="logout">로그아웃</a>
		</div>

		<div id="mainMenu">
						<h1>비밀번호 인증</h1>
						<hr>
						<h2>정보를 안전하게 보호하기 위해 </h2>
						<h2><span>비밀번호를 다시 한 번 확인</span>합니다.</h2>
						<p id="desc">비밀번호가 타인에게 노출되지 않도록 항상 주의해주세요.</p>
						<form action="updateCheck" method="post">
							<div class="idpwd">
								<p>아이디 : ${user.id}</p>
								<input type="password" name="password" placeholder="기존 비밀번호">
							</div>
							<input type="submit" value="비밀번호 확인" id="checkbutton">
						</form>
					</div>
				</main>
			</body>

			</html>
