<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<link rel="stylesheet" href="/resources/css/reset.css" />
				<link href="../../resources/css/header.css" rel="stylesheet" type="text/css">
				<link href="../../resources/css/admin/showProgress.css" rel="stylesheet" type="text/css">

				<link rel="preconnect" href="https://fonts.googleapis.com">
				<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
				<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">

				<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
				<title>Insert title here</title>
				<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
					<form action="update_ok" method="post" id="update" name="update">
						<div class="left">
							<h1>수거 신청 현황 관리</h1>
							<div id="progtable">

								<table border=1 class="table">
									<tr>
										<th>주문번호</th>
										<th>아이디</th>
										<th>이름</th>
										<th>전화번호</th>
										<th>진행상황</th>
										<th>수거량(kg)</th>
										<th>금액(원)</th>
									</tr>

									<c:forEach items="${progress}" var="item">
										<tr>
											<td class="numbering">${item.orderNum}</td>
											<td>${item.id}</td>
											<td>${item.name}</td>
											<td>${item.phone}</td>
											<td id="prog">${item.prog}</td>
											<td>${item.kg}</td>
											<td>${item.kg*400}</td>
										</tr>
									</c:forEach>
								</table>
								<ul class="pagination">
									<li class="page-item ${paging.prev ? '' : 'disabled'}">
										<c:choose>
											<c:when test="${paging.startPage == 1}">
												<a class="page-link"
													href="/showProgress?page=${paging.startPage=1}">Previous</a>
											</c:when>
											<c:otherwise>
												<a class="page-link"
													href="/showProgress?page=${paging.startPage-1}">Previous</a>
											</c:otherwise>
										</c:choose>
									</li>

									<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="page">
										<li class="page-item"><a
												class="page-link ${paging.page== page ? 'active' : ''} "
												href="/showProgress?page=${page}">${page}</a></li>
									</c:forEach>

									<li class="page-item ${paging.next ? '' : 'disabled'}">
										<c:choose>
											<c:when test="${paging.endPage < 10}">
												<a class="page-link"
													href="/showProgress?page=${paging.endPage=paging.endPage}">Next</a>
											</c:when>
											<c:otherwise>
												<a class="page-link"
													href="/showProgress?page=${paging.endPage + 1}">Next</a>
											</c:otherwise>
										</c:choose>
									</li>
								</ul>
							</div>
						</div>
						<div id="manageProgress">

							<table border=1 class="progress">
								<tr>
									<th class="progth">주문번호</th>
									<th class="progth">진행 상황 변경</th>
								</tr>
								<tr>
									<td>
										<select name="orderNum" id="orderNum">
											<c:forEach items="${progress}" var="item">
												<option value="${item.orderNum}">${item.orderNum}</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<select name="prog" id="prog">
											<option value="신청 완료">신청 완료</option>
											<option value="수거 완료">수거 완료</option>
											<option value="수거 물품 확인">수거 물품 확인</option>
											<option value="입금 진행중">입금 진행중</option>
											<option value="입금 완료">입금 완료</option>
										</select>
									</td>
								</tr>
							</table>
							<div>
								<input type="button" id="btn" value="신청 현황 변경">
							</div>
						</div>
					</form>
</div>
				</main>
				<script src="../../../resources/js/collect/showProgress.js"></script>
			</body>

			</html>