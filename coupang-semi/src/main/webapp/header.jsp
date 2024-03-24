<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- 2. reset.css 추가 -->
<link rel="stylesheet" href="resources/css/reset.css" />

<!-- 3. 스타일 적용 : style.css 추가 -->
<link rel="stylesheet" href="resources/css/index.css" />

<!-- 아이콘 추가 : fontawesome -->
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<sec:authentication var="user" property="principal" />

	<!-- 1. HTML 작성 -->
	<div class="tob-bar container">
		<div class="tob-bar-left">
			<a href="#">즐겨찾기</a> <a href="#">입점신청</a>
		</div>
		<div class="tob-bar-right">
			<c:choose>
				<c:when test="${user == 'anonymousUser'}">
					<a href="/login">로그인</a>
					<a href="/register">회원가입</a>
				</c:when>
				<c:otherwise>
					<a href="/logout">로그아웃</a>
				</c:otherwise>
			</c:choose>
			<a href="#">고객센터</a>
		</div>
	</div>

	<!-- header -->
	<header class="container">
		<div class="category-btn">
			<i class="fa-solid fa-bars"></i>
			<p>카테고리</p>
			<!-- 숨겨져 있는 카테고리 -->
			<!-- event 사용 -> hover 방식으로 변경
            hover 같은 경우는 하위 태그로 존재해야 함!
        -->
			<div class="category">
				<div class="category-list"></div>
			</div>
		</div>
		<div class="header-main">
			<div class="header-main-top">
				<a href="#" class="logo"> <img
					src="https://image7.coupangcdn.com/image/coupang/common/logo_coupang_w350.png"
					alt="" />
				</a>
				<form action="">
					<select name="" id="">
						<option value="">전체</option>
						<option value="">여성패션</option>
						<option value="">남성패션</option>
						<option value="">남녀 공용 의류</option>
						<option value="">유아동패션</option>
						<option value="">뷰티</option>
					</select> <input type="text" /> <i class="fa-solid fa-microphone"></i>
					<button type="submit">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</form>
				<a href="#" class="header-main-icon"> <i
					class="fa-regular fa-user"></i>
					<p>마이쿠팡</p>
				</a> <a href="#" class="header-main-icon"> <i
					class="fa-solid fa-cart-shopping"></i>
					<p>장바구니</p>
				</a>
			</div>
			<nav class="header-main-bottom">
				<i class="fa-solid fa-chevron-left"></i> <a href="#"> <img
					src="https://image6.coupangcdn.com/image/coupang/common/coupang_play_icon@3x.png"
					alt="" /> <span>쿠팡플레이</span>
				</a> <a href="#"> <img
					src="https://image10.coupangcdn.com/image/coupang/rds/logo/xxhdpi/logo_rocket_symbol_large.png"
					alt="" /> <span>로켓배송</span>
				</a> <a href="#"> <img
					src="https://image9.coupangcdn.com/image/coupang/common/pc_header_rocket_fresh_1x.png"
					alt="" /> <span>로켓프레시</span>
				</a> <a href="#"> <img
					src="https://image7.coupangcdn.com/image/coupang/home/icons/Christmas/Christmas_PC_2023.png"
					alt="" /> <span>크리스마스</span>
				</a> <a href="#"> <img
					src="https://image6.coupangcdn.com/image/coupang/common/logoBizonlyBrown.png"
					alt="" /> <span>쿠팡비즈</span>
				</a> <a href="#"> <img
					src="https://image6.coupangcdn.com/image/coupang/home/icons/Overseas.png"
					alt="" /> <span>로켓직구</span>
				</a> <a href="#"> <span>골드박스</span>
				</a> <a href="#"> <span>와우회원할인</span>
				</a> <a href="#"> <span>이벤트/쿠폰</span>
				</a> <a href="#"> <img
					src="https://image10.coupangcdn.com/image/coupang/home/icons/RETURNED_MARKET_B@2x.png"
					alt="" /> <span>반품마켓</span>
				</a> <a href="#"> <img
					src="https://image9.coupangcdn.com/image/coupang/common/icon_government_promotion.png"
					alt="" /> <span>착한상점</span>
				</a> <a href="#"> <span>기획전</span>
				</a> <a href="#"> <img
					src="https://image9.coupangcdn.com/image/coupang/common/icon_travel.png"
					alt="" /> <span>여행/티켓</span>
				</a> <i class="fa-solid fa-chevron-right"></i>
			</nav>
		</div>
	</header>
</body>
</html>