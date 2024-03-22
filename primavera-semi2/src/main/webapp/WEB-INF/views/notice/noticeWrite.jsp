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
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/notice/write.css" />
</head>
<style>
h1 {
	margin-top: 70px;
}

.form-group {
	margin: 20px 0;
}
</style>
</head>
<body>
	<div class="header-blackbox"></div>
	<header>
		<nav>
			<a href="/">Primavera</a>
		</nav>
		<nav>
			<a href="/mainMap">Store</a> 
			<a href="#">Guide</a>
			<a href="collectPage">PickUp</a>
			<a href="list">Board</a> 
			<span> 
			<a href="/review/list">Board</a> 
			<a href="/listQna">Q & A</a> 
			<a href="/notice/list">Notice</a>
			</span> 
			<a href="myPage"><i class="fa-regular fa-user"></i></a>
		</nav>
	</header>
	<div class="container">
		<h1>Notice 등록</h1>
		<form action="writeNotice" method="post" enctype="multipart/form-data" onsubmit="return validate()">
			<div class="form-group" id="title">
			<label for="ADMIN_title">title</label> 
			<input class="form-control" name="title" id="title_input">
			</div>
			<div class="form-group" id="context">
			<label for="ADMIN_content">content</label>
			<textarea class="form-control" row="10" name="content" id="content_input"></textarea>
			</div>
			<div class="form-group" id="file">
			
			<label for="ADMIN_file">파일 업로드</label> 
			<input class="form-control" type="file" id="file" name="file" accept="image/*">
			</div>
			
			<button type="submit" class="btn btn-outline-warning">등록</button>
			
			<a href="/notice/list" class="back">취소</a></div>
			
		</form>
	</div>
		<script src="../../../../resources/js/notice/write.js"></script>
</body>
</html>