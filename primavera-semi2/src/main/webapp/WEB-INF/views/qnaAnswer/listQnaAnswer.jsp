<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link href="../../resources/css/header.css" rel="stylesheet" type="text/css">
	<link href="../../resources/css/admin/listQnaAnswer.css" rel="stylesheet" type="text/css">
	<meta charset="UTF-8">
	<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
<title>Q&A 관리</title>
</head>
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
<body>
<section id="progressbackground">
					<div id="background-blackbox"></div>
				</section>
			<main>
			<div id="sideMenu">
				<a href="notice/list" id="noticelist">공지 게시판 관리</a>
					<a href="listStatus" id="qnalist">Q&A 게시판 관리</a>
					<a href="allUser" id="alluserlist">전체 회원 조회</a>
					<a href="showProgress" id="showprogresslist">progress 관리</a>
					<a href="showAllCollect" id="showallcollectlist">수거 신청 현황</a>
					<a href="/logout">로그아웃</a>
			</div>
			<div id="mainMenu">
	<h1>댓글 달아줘야 하는 사람들 리스트</h1>
	
	<div>
	<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>아이디</th>
							<th>작성일</th>
							<th>답변상태</th>
						</tr>
					</thead>
					<tbody>
						<!--  현재 주소에 있는 거 긁어서 같이 넘기고,거기서 계속 넘기면 다시 유지해서 올 수 있음 -->
						<c:forEach items="${listStatus}" var="item" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><a href="/viewQna?qnaNum=${item.qnaNum}">${item.title}</a></td>
								<td>${item.id}</td>
								<td><fmt:formatDate value="${item.writeDate}"
										pattern="yy-MM-dd HH:ss" /></td>
								<td>${item.status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="page">
				<ul class="pagination">
					<li class="page-item ${paging.prev ? '' : 'disabled'}">
					
					<c:choose>
						<c:when test="${paging.startPage == 1}">
							<a class="page-link" href="/listStatus?page=${paging.startPage=1}">Previous</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="/listStatus?page=${paging.startPage-1}">Previous</a>
						</c:otherwise>
					</c:choose>
					
					</li>

					<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="page">
						<li class="page-item"><a
							class="page-link ${paging.page== page ? 'active' : ''} "
							href="/listStatus?page=${page}" id="page_num">${page}</a></li>
					</c:forEach>

					<li class="page-item ${paging.next ? '' : 'disabled'}"><c:choose>
						<c:when test="${paging.endPage < 10}">
							<a class="page-link" href="/listStatus?page=${paging.endPage=paging.endPage}">Next</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="/listStatus?page=${paging.endPage + 1}">Next</a>
						</c:otherwise>
						</c:choose>	
					</li>
				</ul>
</div>
</div>
</main>	
</body>
</html>