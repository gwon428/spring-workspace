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
<link rel="stylesheet" href="../../../resources/css/collect/register.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />

<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"
		defer>
	</script>
<script src="../../../resources/js/registerCollectDaum.js"></script>
<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
	
</head>
<body>
<sec:authentication property="principal" var="user" />

<div class="header-blackbox"></div>
		<header style="font-weight: normal;">
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
<!-- -----------------------main----------------------------- -->
<div id="back">
<div id="back_black"></div>
	<form action="signUpCollect" method="post" id="pickUp" name="pickUp" onsubmit="return validate()">
	<div id="header">
		<h2>Primavera</h2>
		<p id="ps">*는 필수 항목입니다.</p>
	</div>
		<div id="pickUpTable">
			<div class="id">
				<p>*아이디 <span id="idCheck">변경 불가 항목입니다.</span></p>
				<input type="text" name="id" id="id" value="${user.id}" readonly/>
			</div>
			<div class="name">
				<p>*이름</p>
				<input type="text" name="name" value="${user.name}" readonly/>
			</div>
			<div class="phone">
				<p>*전화번호</p>
				<input type="text" name="phone" value="${user.phone}" readonly/>
			</div>

			<div class="addr">
				<p>*주소</p>
				<input type="text" name="postCode" id="postCode" placeholder="우편번호"
					size="15"  value="${user.postCode}"/> <input type="button"
					onclick="daumPostCode()" value="우편번호 찾기" /> <input type="text"
					name="roadAddress" id="roadAddress" placeholder="주소" size="40"
					 value="${user.roadAddress}"/> <input type="text" name="detailAddress"
					id="detailAddress" placeholder="상세 주소" size="40"  value="${user.detailAddress}"/>
			</div>

			<div class="collectDate">
				<p>*수거일</p>
				<input type="date" name="collectionDate" id="collectionDate" max="2025-12-31"
					min="2024-02-22" />
			</div>
			<div class="kg">
				<p>*수거 신청 무게</p>
				<input type="number" name="kg" id="kg" placeholder="5~20kg 신청 가능" min="5" max="20"/>
			</div>
			<div>
				<p>공동 현관 비밀번호</p>
				<textarea name="doorPwd" id="doorPwd" cols="50" rows="2"
					placeholder="공동 현관 비밀 번호가 필요한 경우, 입력해주세요"></textarea>
			</div>
			<div>
				<p>요청사항</p>
				<textarea name="request" id="request" cols="40" rows="10"
					placeholder="요청사항을 있으신 경우, 입력해주세요"></textarea>
			</div>
		</div>

		<div id="agree_check">
			<p id="agree_text">
				* 수거 신청을 위해 <a href="#pop_info_1" class="btn_open"> 이용약관 </a> 및 <a
					href="#pop_info_2" class="btn_open">개인정보 수집 </a>에 동의합니다.
			</p>
			<input type="checkbox" name="agree" id="agree" value="yes" />네, 동의합니다.
			
		</div>
		<div>
			<button type="submit" id="button">수거 신청 하기</button>
		</div>
		 
		<div id="pop_info_1" class="pop_wrap">
			<div class="pop_inner">
				<jsp:include page="/WEB-INF/views/collect/agree1.jsp"></jsp:include>
				<hr>
				<button type="button" class="btn_close">닫기</button>
			</div>
		</div>

		<div id="pop_info_2" class="pop_wrap">
			<div class="pop_inner">
				<jsp:include page="/WEB-INF/views/collect/agree2.jsp"></jsp:include>
				<hr>
				<button type="button" class="btn_close" >닫기</button>
			</div>
		</div>
 
	</form>
	</div>
	<script src="../../../resources/js/collect/register.js"></script>
	
</body>
</html>
