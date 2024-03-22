<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/qna/updateQna.css"/>
<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>

</head>
<body>
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
     <div id="allContent">
	       <div class="qnaAll">
	         <div class="back_black"></div>
	         <div id=""></div>
	       </div>
<!-- -----------------qnaAnswer 수정 파트----------------------------- -->
	<div class="container">
			<h1>질문 수정</h1>
			<form action="/updateQna" method="post" enctype="multipart/form-data" id="updateQna" name="updateQna" onsubmit="return validate()">
				<input type="hidden" name="qnaNum" value="${qna.qnaNum}">
				<input type="hidden" name="url" value="${qna.url}">
				<div class="updateQna">
					<label>*제목</label>
					<br>
					<textarea class="form-control" row="10" name="title" style="resize:none;" id="title">${qna.title}</textarea>
				</div>
				<div class="updateQna">
					<label>*내용</label>
					<br>
					<textarea class="form-control" row="10" name="content" style="resize:none;" id="content">${qna.content}</textarea>
				</div>
			
				
				<div class="updatePhoto">
					<c:choose>
						<c:when test="${qna.url != null}">
							<img src="/upload/qna/${qna.url}" id="qnaPhoto"/>
							<div id="photoDelete"><i class="fa-solid fa-circle-xmark" onclick="photoDelete()"></i></div>
							<input type="hidden" value="${qna.delImg}" name="delImg" id="delImg"/>
						</c:when>
					</c:choose>
					<div class="updateAnswer" id="img">
						<div id="img_input">
						<label for="file" id="photo">수정 사진</label> 
						
						<input class="form-control"
							type="file" id="file" name="file" accept="image/*" onchange="imgShow(event);" onclick="labelText();" hidden>
						<div id="image_container"></div>
						</div>
					</div>
				</div>
				<div id="updateButton">
					<button type="submit" class="btn btn-outline-warning" id="btn_update">수정</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="../../../resources/js/qna/updateQna.js"></script>

</body>
</html>