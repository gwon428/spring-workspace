<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<link rel="stylesheet" href="/resources/css/reset.css" />
			<link href="../../resources/css/header.css" rel="stylesheet" type="text/css">
			<link href="../../resources/css/admin/showAllCollect.css" rel="stylesheet" type="text/css">
			<meta charset="UTF-8">
			<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
			<title>Insert title here</title>
			<!-- jQuery 추가!  -->
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
			<div>
				<h2>전체 수거 신청 정보 보기</h2>
				
				<select name="sorts" id="sorts">
					<option value="1">주문번호 순</option>
					<option value="3" <c:if test="${param.sort == '3'}">selected</c:if>>이름 순</option>
					<option value="8" <c:if test="${param.sort == '8'}">selected</c:if>>수거일 순</option>
					<option value="11" <c:if test="${param.sort == '11'}">selected</c:if>>수거 무게 순</option>
				</select>
				
				<table border=1 class="table">
					<tr>
						<th scope="col">주문번호</th>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">전화번호</th>
						<th scope="col">우편번호</th>
						<th scope="col">도로명 주소</th>
						<th scope="col">상세 주소</th>
						<th scope="col">수거일</th>
						<th scope="col">수거 신청 무게</th>
						<th scope="col">금액</th>
						<th scope="col">공동 현관 비밀번호</th>
						<th scope="col">요청사항</th>
					</tr>

					<c:forEach items="${list}" var="item">
						
						
						<tbody id="tableBody">
						<tr>
							<td>${item.orderNum}</td>
							<td>${item.id}</td>
							<td>${item.name}</td>
							<td>${item.phone}</td>
							<td>${item.postCode}</td>
							<td>${item.roadAddress}</td>
							<td>${item.detailAddress}</td>
							<td>${item.collectionDate}</td>
							<td>${item.kg}</td>
							<td>${item.kg*400}</td>
							<td>${item.doorPwd}</td>
							<td>${item.request}</td>
						</tr>
						</tbody>
						
					</c:forEach>
				</table>
				<div id="page">
					<ul class="pagination">
						<li class="page-item ${paging.prev ? '' : 'disabled'}">
							<c:choose>
								<c:when test="${paging.startPage == 1}">
									<a class="page-link" href="/showAllCollect?page=${paging.startPage=1}">Previous</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="/showAllCollect?page=${paging.startPage-1}">Previous</a>
								</c:otherwise>
							</c:choose>
						</li>

						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="page">
							<li class="page-item"><a class="page-link ${paging.page== page ? 'active' : ''} "
									href="/showAllCollect?page=${page}">${page}</a></li>
						</c:forEach>

						<li class="page-item ${paging.next ? '' : 'disabled'}">
							<c:choose>
								<c:when test="${paging.endPage < 10}">
									<a class="page-link"
										href="/showAllCollect?page=${paging.endPage=paging.endPage}">Next</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="/showAllCollect?page=${paging.endPage + 1}">Next</a>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</div>
				</div>
				</div>
				
				</main>
			<script>					
				$("#sorts").change(() => {
					var sort = $('#sorts option:selected').val();
					location.href="/showAllCollect?sorts="+sort;
				});
				
			</script>
		</body>

		</html>