<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/qnaAnswer/updateQnaAnswer.css" />
<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>

</head>
<body>
<div class="header-blackbox"></div>
		<header>
			<nav>
				<a href="/">Primavera</a>
			</nav>
			<nav>
				<a href="/map/mainMap">Store</a> <a href="#">Guide</a> <a href="collectPage">PickUp</a> <a
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
	         <div id="qna_content">
	           <h1>Q&A 질문</h1>
	           <session id="contents">
	             <div name="qnaId" id="qnaId">
	               <label>회원 아이디</label>
	               <input value="${qnaView.id}" readonly />
	             </div>
	             <div name="qnaNum" id="qnaNum">
	               <label>질문 번호</label>
	               <input value="${qnaView.qnaNum}" readonly />
	             </div>
	             <div name="qnaTitle" id="qnaTitle">
	               <label>제목</label><br>
	               <textarea readonly>${qnaView.title}</textarea>
	             </div>
	             <div id="qnaContent" name="qnaContent">
	               <label>내용</label><br>
	               <textarea readonly>${qnaView.content}</textarea>
	             </div>
	             <c:choose>
	               <c:when test="${qnaView.url != null}">
	                 <div id="qnaUrl" name="qnaUrl">
	                   <img src="/upload/qna/${qnaView.url}" />
	                 </div>
	               </c:when>
	             </c:choose>
	           </session>
	         </div>
	       </div>
<!-- -----------------qnaAnswer 수정 파트----------------------------- -->

		<div class="qnaAnswerUpdate">
			<h1>답변 수정</h1>
			<form action="/updateAnswer" method="post" enctype="multipart/form-data" name="updateQnaAnswer" onsubmit="return validate()">
				<input type="hidden" name="qnaNum" value="${qnaAnswer.qnaNum}">
				<input type="hidden" name="url" value="${qnaAnswer.url}">
				
				<div class="updateAnswer">
					<label>*내용</label>
					<br>
					<textarea id="content" row="10" name="content" style="resize:none;">${qnaAnswer.content}</textarea>
				</div>
				<div class="updatePhoto">
					<c:choose>
						<c:when test="${qnaAnswer.url != null}">
							<img src="/upload/qnaAnswer/${qnaAnswer.url}" id="qnaAnswerPhoto"/>
							<div id="photoDelete"><i class="fa-solid fa-circle-xmark" onclick="photoDelete()"></i></div>
							<input type="hidden" value="${qnaAnswer.delImg}" name="delImg" id="delImg"/>
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
				 <div id="answerUpdateButton">
					<button type="submit" class="btn_update" id="btn_update">수정</button>
				 </div>
			</form>
		</div>
	</div>
</div>
<script src="../../../resources/js/qnaAnswer/updateQnaAnswer.js"></script>

</body>
</html>