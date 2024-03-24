<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css" />
<link href="../../resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/admin/showCollect.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<title>수거 신청 현황 보기</title>
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
<!-- 회원용 수거 신청 진행 상황 페이지 -->

<div id="top"></div>

<main>
<div id="sideMenu">
			<a href="showReview" id="showReview">My Review</a> <a href="showQna">내 Q&A</a> <a
				href="showCollect" id="showCollect">진행 상황</a> <a href="userUpdate">회원
				정보 수정</a> <a href="deleteUser">회원 탈퇴</a> <a href="logout">로그아웃</a>
		</div>
		
		<div id="mainMenu">
<h2>진행 상황</h2>
	<table border=1 class="table">
		<tr>
			<th>주문번호</th>
			<th style="width: 210px;">진행상황</th>
			<th style="width: 180px;">수거일</th>
			<th style="width:250px;">수거 신청 무게</th>
			<th>금액</th>
		</tr>
		
		<c:forEach items="${list}" var="item">
			<tr>
				<td class="no">${item.orderNum}</td>
				<td>${item.prog}</td>
				<td>${item.collectionDate}</td>
				<td>${item.kg}</td>
				<td>${item.kg*400}</td>
			</tr>
		</c:forEach>
		
	</table>
	
	<div id="page">
	<ul class="pagination">
			<li class="page-item ${paging.prev ? '' : 'disabled'}">
				<c:choose>
					<c:when test="${paging.startPage == 1}">
						<a class="page-link" href="/showCollect?page=${paging.startPage=1}">Previous</a>
					</c:when>
					<c:otherwise>
						<a class="page-link" href="/showCollect?page=${paging.startPage-1}">Previous</a>
					</c:otherwise>
				</c:choose>
			</li>

			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="page">
				<li class="page-item"><a
					class="page-link ${paging.page== page ? 'active' : ''}"
					href="/showCollect?page=${page}">${page}</a></li>
			</c:forEach>

			<li class="page-item ${paging.next ? '' : 'disabled'}">
				<c:choose>
					<c:when test="${paging.endPage < 10}">
						<a class="page-link" href="/showCollect?page=${paging.endPage=paging.endPage}">Next</a>
					</c:when>
					<c:otherwise>
						<a class="page-link" href="/showCollect?page=${paging.endPage + 1}">Next</a>
					</c:otherwise>
				</c:choose></li>
		</ul>
		</div>
		</div>
	</main>
</body>
</html>