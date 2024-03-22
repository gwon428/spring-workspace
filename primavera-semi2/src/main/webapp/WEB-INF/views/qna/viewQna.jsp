<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/qna/viewQna.css" />
<link rel="stylesheet" href="../../../resources/css/qnaAnswer/viewQnaAnswer.css" />
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
		<div id="top_title">
			<span id="qna">Q&A</span>
			<div name="title" id="title">${qna.title}</div>
		</div>
		<div id="text_button">
			<div id="id_writeDate">
				<div name="qnaId" id="qnaId">${qna.id}</div>
				<div id="writeDate" name="writeDate">
					<fmt:formatDate value="${qna.writeDate}" pattern="yy-MM-dd HH:ss" />
				</div>
			</div>

			<div id="button">
			<c:choose>
				<c:when test="${user == 'anonymousUser'||(qna.id != user.id&&user.auth!='ADMIN')}">
				<button value="목록" id="btnlist">
					<a href="listQna" id="listQna">목록</a>
				</button>
				</c:when>
				
				<c:when test="${user != 'anonymousUser' && user.auth == 'ADMIN' && qna.id == user.id}">
				<button value="목록" id="btnlist">
					<a href="listQna" id="listQna">목록</a>
				</button>
				<button value="수정" id="btnupdate">
					<a href="updateQna" id="updateQna">수정</a>
				</button>
				<button value="삭제" id="btndelete">
					<a href="/deleteQna?qnaNum=${qna.qnaNum}" id="deleteQna">삭제</a>
				</button>
				<button value="댓글" id="btnAnswer">
					<a href="writeAnswer?qnaNum=${qna.qnaNum}" id="AnswerQna">댓글</a>
				</button>
				</c:when>
				<c:when test="${user != 'anonymousUser' && user.auth == 'ADMIN' && qna.id != user.id}">
				<button value="목록" id="btnlist">
					<a href="listQna" id="listQna">목록</a>
				</button>
				<button value="삭제" id="btndelete">
					<a href="/deleteQna?qnaNum=${qna.qnaNum}" id="deleteQna">삭제</a>
				</button>
				<button value="댓글" id="btnAnswer">
					<a href="writeAnswer?qnaNum=${qna.qnaNum}" id="AnswerQna">댓글</a>
				</button>
				</c:when>
				<c:otherwise>
				<c:if test="${qna.id == user.id}">
				<button value="목록" id="btnlist">
					<a href="listQna" id="listQna">목록</a>
				</button>
				<button value="수정" id="btnupdate">
					<a href="updateQna" id="updateQna">수정</a>
				</button>
				<button value="삭제" id="btndelete">
					<a href="/deleteQna?qnaNum=${qna.qnaNum}" id="deleteQna">삭제</a>
				</button>
				</c:if>
				</c:otherwise>
			</c:choose>	
			</div>
		</div>
		<div id="qnaContent" name="qnaContent">${qna.content}</div>
		<c:choose>
			<c:when test="${qna.url != null}">
				<div id="qnaUrl" name="qnaUrl">
					<a href="/upload/qna/${qna.url}" download>
						<img src="/upload/qna/${qna.url}" />
					</a>
						
				</div> 
			</c:when>
		</c:choose>
	</div>
	<!-- ------------------------댓글--------------------------- -->
	<div id="answer">
		<c:choose>
				<c:when test="${qnaAnswer != null}">		
					<div>
						<div id="answerHeader">
						<h2 id="answer_head">Primavera 답변</h2>
							<div id="id_date">
								<div name="answerId" id="answerId">${qnaAnswer.id}</div>
								<div id="answerDate" name="answerDate">
									<fmt:formatDate value="${qnaAnswer.answerDate}" pattern="yy-MM-dd HH:mm" />
								</div>
							</div>
						</div>
						<div id="answerContent" name="answerContent">${qnaAnswer.content}</div>
						<c:choose>
							<c:when test="${qnaAnswer.url != null}">
								<div id="answerUrl" name="answerUrl">
									<a href="/upload/qnaAnswer/${qnaAnswer.url}" download>
										<img src="/upload/qnaAnswer/${qnaAnswer.url}"/>
									</a>
								</div> 
							</c:when>
						</c:choose>
						<div id="answer_btn">		
								<button value="수정" class="btnAnswer" id="btnupdate">
									<a href="updateQnaAnswer?qnaNum=${qnaAnswer.qnaNum}" id="updateQnaAnswer">수정</a>
								</button>
								<button value="삭제" class="btnAnswer" id="btndelete">
									<a href="/deleteQnaAnswer?qnaNum=${qnaAnswer.qnaNum}" id="deleteQnaAnswer">삭제</a>
								</button>
							</div>
					</div>
			</c:when>
		</c:choose>
	</div>
</body>
</html>
