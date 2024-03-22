<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css" />
<link href="../../resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/user/showQna.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<title>내 Q&A</title>
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
		<div id="top"></div>
		
		
		<main>
		<div id="sideMenu">
			<a href="showReview" id="showReview">My Review</a> <a href="showQna" id="myqna">내 Q&A</a> <a
				href="showCollect">진행 상황</a> <a href="updateUser">회원
				정보 수정</a> <a href="deleteUser">회원 탈퇴</a> <a href="logout">로그아웃</a>
		</div>
		
		<div id="mainMenu">
		<h2>내 Q&A</h2>
			<table border=1 class="table">
				<tr>
					<th>질문번호</th>
					<th style="padding-right: 10px;">제목</th>
					<th scope="col">내용</th>
					<th>작성일</th>
					<th>답변상태</th>
				</tr>

				<c:forEach items="${list}" var="item">
					<tr>
						<td class="no" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${item.qnaNum}</td>
						<td id="title" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap; padding-right: 10px;"><a href="/viewQna?qnaNum=${item.qnaNum}">${item.title}</a></td>
						<td id="content" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${item.content}</td>
						<td><fmt:formatDate value="${item.writeDate}"
								pattern="yy-MM-dd" /></td>
						<td>${item.status}</td>
					</tr>
				</c:forEach>
			</table>
	<div id="page">
				<ul class="pagination">
					<li class="page-item ${paging.prev ? '' : 'disabled'}"><c:choose>
							<c:when test="${paging.startPage == 1}">
								<a class="page-link"
									href="/showQna?page=${paging.startPage=1}">Previous</a>
							</c:when>
							<c:otherwise>
								<a class="page-link"
									href="/showQna?page=${paging.startPage-1}">Previous</a>
							</c:otherwise>
						</c:choose></li>

					<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
						var="page">
						<li class="page-item"><a
							class="page-link ${paging.page== page ? 'active' : ''} "
							href="/showQna?page=${page}">${page}</a></li>
					</c:forEach>

					<li class="page-item ${paging.next ? '' : 'disabled'}"><c:choose>
							<c:when test="${paging.endPage < 10}">
								<a class="page-link"
									href="/showQna?page=${paging.endPage=paging.endPage}">Next</a>
							</c:when>
							<c:otherwise>
								<a class="page-link"
									href="/showQna?page=${paging.endPage + 1}">Next</a>
							</c:otherwise>
						</c:choose></li>
				</ul>
			</div>
			</div>
			</main>
</body>
</html>