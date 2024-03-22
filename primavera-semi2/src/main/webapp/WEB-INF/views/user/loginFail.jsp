<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<style>
				#warning {
					font-size: 2.5rem;
					display: flex;
					justify-content: center;
					align-items: center;
				}

				#button {
					margin: 50px;
					display: flex;
					align-items: center;
					justify-content: center;
				}

				#href {
					width: 100px;
					height: 50px;
					border: 1px solid gray;
					border-radius: 20px;
					display: flex;
					align-items: center;
					justify-content: center;
				}
			</style>
			<link rel="stylesheet" href="/resources/css/reset.css" />
			<link href="../../resources/css/header.css" rel="stylesheet" type="text/css">
			<link href="../../resources/css/user/loginFail.css" rel="stylesheet" type="text/css">
			<meta charset="UTF-8">
			<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
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
				<div id="warning">
					${requestScope.loginFailMsg}
				</div>
				<div id="button">
					<a href="/myPage" id="href"> 로그인 </a>
				</div>

			</main>
		</body>

		</html>