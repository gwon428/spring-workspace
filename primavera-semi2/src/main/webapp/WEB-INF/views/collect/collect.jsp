
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/collect/collect.css" />
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

</head>

<body>
	<sec:authentication property="principal" var="user" />
	<main>
		<div class="header-blackbox"></div>
		<header>
			<nav>
				<a href="/">Primavera</a>
			</nav>
			<nav>
				<a href="mainMap">Store</a> <a href="#">Guide</a> <a
					href="collectPage">PickUp</a> <a href="/notice/list">Board</a> <span>
					<a href="/review/list">Review</a> <a href="listQna">Q & A</a> <a
					href="/notice/list">Notice</a>
				</span> <a href="myPage"><i class="fa-regular fa-user" id="mypage"></i></a>
			</nav>
		</header>


		<section id="top">
			<div class="blackbox"></div>
			<div class="top-content">
				<h2>Pick Up</h2>
			</div>
		</section>
		<!-- -------------------------------------------------main------------------------------------------------------------ -->
		<section id="main">
			<div class="main">
				<div id="i-contents">
					<i class="fa-solid fa-chevron-left" id="direc"></i>
					<div id="contents">
						<div class="image-content">
							<div class="card" style="width: 18rem;">
								<img src="../../../resources/images/main1.jpg" id="main1"
									class="card-img-top" alt="...">
								<div class="card-body" id="card-body">
									<div id="ready_icon">
										<p class="card-text">Ready</p>
										&nbsp;&nbsp; <i class="fa-solid fa-caret-down baa"></i>
									</div>
									<div id="hiddenContent">
										<span>[STEP 1]<br>'Pick Up' 버튼을 클릭하여 헌옷 수거 신청
										</span>
									</div>
								</div>
							</div>

						</div>
						<div class="image-content">
							<div class="card" style="width: 18rem;">
								<img src="../../../resources/images/main5.jpg" id="main2"
									class="card-img-top" alt="...">

								<div class="card-body" id="card-body">
									<div id="ready_icon">
										<p class="card-text">Pick Up</p>
										&nbsp;&nbsp; <i class="fa-solid fa-caret-down baa"></i>
									</div>
									<div id="hiddenContent">
										<span>[STEP 2]<br>신청 날짜에 맞춰 픽업팀이 비대면 수거
										</span>
									</div>
								</div>
							</div>
						</div>

						<div class="image-content">
							<div class="card" style="width: 18rem;">
								<img src="../../../resources/images/main3.jpg" id="main3"
									class="card-img-top" alt="...">

								<div class="card-body" id="card-body">
									<div id="ready_icon">
										<p class="card-text">Check</p>
										&nbsp;&nbsp; <i class="fa-solid fa-caret-down baa"></i>
									</div>
									<div id="hiddenContent">
										<span>[STEP 3]<br>무게 측정과 제품 검수 후 매입 금액 산정
										</span>
									</div>
								</div>




							</div>
						</div>

						<div class="image-content">
							<div class="card" style="width: 18rem;">
								<img src="../../../resources/images/main4.jpg" id="main4"
									class="card-img-top" alt="...">

								<div class="card-body" id="card-body">
									<div id="ready_icon">
										<p class="card-text">Cash</p>
										&nbsp;&nbsp; <i class="fa-solid fa-caret-down baa"></i>
									</div>
									<div id="hiddenContent">
										<span>[STEP 4]<br>회원 계좌로 산정 금액 입금
										</span>
									</div>
								</div>
							</div>
						</div>


					</div>
					<i class="fa-solid fa-chevron-right" id="direc"></i>
				</div>
				<c:choose>
					<c:when test="${user == 'anonymousUser'}">
						<a href="../myPage" id="registerPage">Pick Up</a>
					</c:when>
					<c:otherwise>
						<c:if test="${user.password == null}">
							<a href="../updatekakaoUser" id="registerPage">Pick Up</a>
						</c:if>
						<c:if test="${user.password != null}">
						<a href="registerCollect" id="registerPage">Pick Up</a>
						</c:if>
					</c:otherwise>
					
					
				</c:choose>
			</div>
		</section>

	</main>
	<script src="../../../resources/js/collect/collect.js"></script>

</body>

</html>
