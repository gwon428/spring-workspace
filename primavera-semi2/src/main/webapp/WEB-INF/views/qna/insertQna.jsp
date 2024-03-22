<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/qna/insertQna.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
</head>
<body>
<sec:authentication property="principal" var="user" />
	<div class="header-blackbox"></div>
		<header>
			<nav>
				<a href="/">Primavera</a>
			</nav>
			<nav>
				<a href="mainMap">Store</a> <a href="#">Guide</a> <a href="collectPage">PickUp</a> <a
					href="/notice/list">Board</a> <span>
					<a href="/review/list">Review</a> <a href="listQna">Q & A</a> <a href="/notice/list">Notice</a>
				</span> <a href="myPage"><i class="fa-regular fa-user" id="mypage"></i></a>
			</nav>
		</header>

	<!-- -----------------------------------main----------------------------- -->
	<div id="main">
		<h1>Q&A 등록</h1>
	<div class="container">
		<form action="insertQna" method="post" enctype="multipart/form-data" id="insertQna" name="insertQna" onsubmit="return validate()">
		<div id="id_orderNum">
			<div class="insertQna" id="id">
				<label>*아이디</label> <input class="form-control" name="id" id="id_input" value="${user.id}" readonly>
			</div>
			<div class="insertQna" id="secret">
				<label id="secretCheck">비밀글</label><input type="checkbox" name="secret" id="secret_input" value="Y">
			</div> 
		</div>
			<div class="insertQna" id="title">
				<label>*제목</label> <input class="form-control" name="title" id="title_input">
			</div>
			<div class="insertQna" id="content">
				<label>*내용</label>
				<textarea class="form-control" row="10" name="content" id="content_input"></textarea>
			</div>
			<div class="insertQna" id="img">
				<div id="img_input">
				<label for="file" id="photo">photo</label> 
				
				<input class="form-control"
					type="file" id="file" name="file" accept="image/*" onchange="imgShow(event);" onclick="labelText();"hidden>
					<div id="image_container">
					</div>
					</div>
			</div>
			<div class="btn">
			<button type="submit" class="btn_final" id="btn_insert" onclick="add()">등 록</button>
			<button value="목록" class="btn_final" id="btn_list"><a href="listQna" id="listQna">취 소</a></button>
			</div>
		</form>
	</div>
	</div>
	<script src="../../../resources/js/qna/insertQna.js"></script>
	

</body>
</html>