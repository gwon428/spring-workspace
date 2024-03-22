<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/notice/list.css" />
</head>
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>

<body>
	<sec:authentication property="principal" var="user" />
	<div class="header-blackbox"></div>
	<header>
		<nav>
			<a href="/">Primavera</a>
		</nav>

		<nav>
			<a href="/mainMap">Store</a> <a href="#">Guide</a> <a
				href="/collectPage">PickUp</a> <a href="/notice/list">Board</a> <span>
				<a href="/review/list">Review</a> <a href="/listQna">Q & A</a> <a
				href="/notice/list">Notice</a>
			</span> <a href="/myPage"><i class="fa-regular fa-user"></i></a>
		</nav>
	</header>
	<!-- ---------------------------------------------------------------------------- -->
	<sec:authentication property="principal" var="user" />

		<main>
			<section class="section1">
				<img src="../../../resources/images/pexels-pixabay-158827.jpg"
					alt="" />
				<h1 class="h2">Notice</h1>
			</section>
			<section class="section2">
				<div>
					<div class="container">
						<h1>Notice</h1>
						<c:if test="${user != 'anonymousUser' && user.auth == 'ADMIN'}">
							<a href="/notice/write" class="btn btn-outline-warning"
								id="admit">게시글 등록</a>
						</c:if>
					</div>
					<table border="1" class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>내용</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noticeList}" var="notice" varStatus="status">
								<tr>
									<td>${status.count + paging.pageSize * (paging.page-1)}</td>
									<td><a
										href="/notice/noticeView?noticeNum=${notice.noticeNum}">${notice.title}</a>
									</td>
									<td>${notice.content}</td>
									<td><fmt:formatDate value="${notice.writeDate}"
											pattern="yy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav>
						<ul class="pagination">
						<li class="page-item ${paging.prev ? '' : 'disabled'}">
							<c:choose>
								<c:when test="${paging.startPage == 1}">
									<a class="page-link" href="/notice/list?page=${paging.startPage=1}">Previous</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="/notice/list?page=${paging.startPage-1}">Previous</a>
								</c:otherwise>
							</c:choose>
						</li>

						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="page">
							<li class="page-item"><a class="page-link ${paging.page== page ? 'active' : ''} "
									href="/notice/list?page=${page}">${page}</a></li>
						</c:forEach>

						<li class="page-item ${paging.next ? '' : 'disabled'}">
							<c:choose>
								<c:when test="${paging.endPage < 10}">
									<a class="page-link" href="/notice/list?page=${paging.endPage=paging.endPage}">Next</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="/notice/list?page=${paging.endPage + 1}">Next</a>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
					</nav>
				</div>
			</section>
		</main>
</body>

</html>