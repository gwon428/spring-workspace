<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>

<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/notice/view.css" />
<style>
h1 {
	margin-top: 70px;
}

.form-group {
	margin: 20px 0;
}

img {
	width: 200px;
}

div#editor {
	padding: 16px 24px;
	border: 1px solid #D6D6D6;
	border-radius: 4px;
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
			<a href="/mainMap">Store</a> <a href="#">Guide</a> <a
				href="collectPage">PickUp</a> <a href="/notice/list">Board</a> <span>
				<a href="/review/list">Review</a> <a href="listQna">Q & A</a> <a
				href="/notice/list">Notice</a>
			</span> <a href="myPage"><i class="fa-regular fa-user"></i></a>
		</nav>
	</header>
	<!--  -->
	<sec:authentication property="principal" var="user" />
	<c:choose>
		<c:when test="${user == 'anonymousUser' || user.auth == 'MEMBER'}">
			<div class="container2">
				<h1>Notice</h1>
				<form action="updateNotice" method="post"
					enctype="multipart/form-data">
					<div class="form-group" id="usertitle">
						<label class="form-control" name="title" value="${vo.title}"
							id="titleinput">title : "${vo.title}"</label>
					</div>
					<div class="form-group" id="usercontext">
						<label>content : </label>
						<textarea class="form-control" cols="1000" row="100"
							name="content" style="resize: none" id="content_input" readonly>${vo.content}</textarea>
					</div>
					<!-- 
					<c:if test="${url =! ''}">
					<a href="/upload/notice/${vo.url}" id="fileupload" download>첨부파일 : ${vo.url}</a> <input
						class="form-control" type="file" id="file" name="file"
						accept="/*"> 
					</c:if>
					 -->
					 <c:if test="${vo.url != null}">
						<a href="/upload/notice/${vo.url}" id="fileupload"for="file" download>첨부파일 : ${vo.url}</a>
					</c:if>
					<c:if test="${vo.url == null}">
						<a href="" id="fileupload" style="cursor:default;"></a>
					</c:if>
					<a href="/notice/list" id="list">목록</a>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<c:if test="${user.auth == 'ADMIN' || user.auth ==! 'ADMIN' }">
				<div class="container">
					<h1>게시물 정보</h1>
					<form action="updateNotice" method="post"
						enctype="multipart/form-data" onsubmit="return valdate()">
						<input type="hidden" name="noticeNum" value="${vo.noticeNum}">
						<input type="hidden" name="url" value="${vo.url}">
						<div class="form-group" id="title">
							<label>title</label> <input class="form-control" name="title"
								value="${vo.title}" id="title_input">
						</div>
						<div class="form-group" id="context">
							<label>content</label>
							<textarea class="form-control" row="10" name="content"
								style="resize: none;" id="content_input">${vo.content}</textarea>
							<!--	<a href="/upload/notice/${vo.url}" download></a> <!-- <img src="/upload/notice/${vo.url}" />	-->
						</div>
						<!--  다운로드 가능  -->
						<div class="form-group" id="file">
							<a href="/upload/notice/${vo.url}" for="file" download>파일 업로드
								: ${vo.url}</a> <input class="form-control" type="file" id="file"
								name="file" accept="/*">
						</div>

						<div class="type">
							<button type="submit" class="btn btn-outline-warning">수정</button>
							<a class="btn btn-outline-danger"
								href="/notice/deleteNotice?noticeNum=${vo.noticeNum}">삭제</a> <a
								href="/notice/list" class="back">목록</a>
						</div>
					</form>
				</div>
			</c:if>
		</c:otherwise>
	</c:choose>
	<script src="../../../../resources/js/notice/view.js"></script>
</body>
</html>