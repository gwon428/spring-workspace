<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<link rel="stylesheet" href="/resources/css/reset.css" />
			<link href="../../resources/css/header.css" rel="stylesheet" type="text/css">
			<link href="../../resources/css/user/allUser.css" rel="stylesheet" type="text/css">
			<meta charset="UTF-8">
			<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
			<title>전체 회원 보기</title>
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
				<div id="top"></div>
				<h2>전체 회원 조회</h2>
				<table border="1" class="table">
					<thead>
					<tr>
						<th class="no">No</th>
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>우편번호</th>
						<th class="roadAddr">도로명 주소</th>
						<th>상세 주소</th>
						<th width="175">이메일</th>
						<th>은행</th>
						<th width="150">계좌번호</th>
					</tr>
					</thead>
					<c:forEach items="${list}" var="item" varStatus="status">
						 <tr>
							<td class="no">${status.count + paging.pageSize * (paging.page-1)}</td>
							<td>${item.id}</td>
							<td>${item.name}</td>
							<td>${item.phone}</td>
							<td>${item.postCode}</td>
							<td class="roadAddr">${item.roadAddress}</td>
							<td>${item.detailAddress}</td>
							<td width="175">${item.email}</td>
							<td>${item.bankName}</td>
							<td width="150">${item.account}</td>
						</tr> 
					</c:forEach>
				</table>
				<div id="page">
					<ul class="pagination">
						<li class="page-item ${paging.prev ? '' : 'disabled'}">
							<c:choose>
								<c:when test="${paging.startPage == 1}">
									<a class="page-link" href="/allUser?page=${paging.startPage=1}">Previous</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="/allUser?page=${paging.startPage-1}">Previous</a>
								</c:otherwise>
							</c:choose>
						</li>

						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="page">
							<li class="page-item"><a class="page-link ${paging.page== page ? 'active' : ''} "
									href="/allUser?page=${page}">${page}</a></li>
						</c:forEach>

						<li class="page-item ${paging.next ? '' : 'disabled'}">
							<c:choose>
								<c:when test="${paging.endPage < 10}">
									<a class="page-link" href="/allUser?page=${paging.endPage=paging.endPage}">Next</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="/allUser?page=${paging.endPage + 1}">Next</a>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</div>
				</div>
			</main>
		</body>

		</html>