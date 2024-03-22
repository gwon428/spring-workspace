<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link href="../../resources/css/header.css" rel="stylesheet"
		type="text/css">
	<link href="../../resources/css/user/registerUser.css" rel="stylesheet"
		type="text/css">
	<script src="https://kit.fontawesome.com/4602e82315.js"
		crossorigin="anonymous"></script>
	
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
	<main>
	<div class="center-wrap">

		<h1>회원가입</h1>
		<form action="register" method="post" id="register" name="register" onsubmit="return validate()">
			<div id="registForm">
				<div id="regist">
				
					<div id="registerOne">
						<div class="input">
							<div>
								<p>아이디 <span id="idCheckresult">&nbsp;</span></p> 
								<input type="text" name="id" id="userId" required>
							</div>
								<span id="idreg">&nbsp;</span>
								<span id="idreg2">&nbsp;</span>
						</div>
						
						<div class="input">
							<p>비밀번호<span></span></p>
							<input type="password" name="password" id="userPwd" required>
							<span id="pwdreg">&nbsp;</span>
							<span id="pwdreg2">&nbsp;</span>
						</div>
						
						<div class="input">
							<p>비밀번호 확인<span></span></p>
							<input type="password" id="passwordcheck" required>
							<span id="pwdcheckreg">&nbsp;</span>
						</div>
					</div>
					
					<div id="registerTwo">
						<div class="input">
							<p>이름<span></span></p>
							<input type="text" name="name" id="userName" required>
							<span id="namereg">&nbsp;</span>
							<span id="namereg2">&nbsp;</span>
						</div>	
						
						<div class="input">
							<div>
								<p> 휴대폰번호 <span id="phoneCheckresult"> &nbsp;</span>  </p>
								<input type="text" name="phone" id="userPhone" required>
							</div>
								<span id="phonereg">&nbsp;</span>
						</div>
							
						<div class="input">
							<div>
								<p>이메일 <span id="emailCheckresult"> &nbsp;</span></p>
								<input type="text" name="email" id="email" required>
							</div>
								<span id="emailreg">&nbsp;</span>
						</div>
					</div>
					
					<div id="registerThree">
					<div class="input">
						<p>주소<span></span></p>
							<div class="addr">
								<div class="addrPost">
									<input type="text" name="postCode" id="postCode" placeholder="우편번호" required>
									<input type="button" onclick="DaumPostcode()" value="우편번호 찾기">
								</div>
								
								<input type="text" name="roadAddress" id="roadAddress" placeholder="주소" required>
								<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" required>
							</div>
					</div>
					
						<div id="bank">
							<div id="bankname">
								<p>은행</p>
								<select name="bankName">
									<option value="NH">농협</option>
									<option value="KB">국민</option>
									<option value="WOORI">우리</option>
									<option value="SH">신한</option>
									<option value="IBK">기업</option>
									<option value="kakao">카카오</option>
									<option value="HANA">하나</option>
								</select>
							</div>
							<div id="account">
								<p>계좌번호</p>
								<input type="text" name="account" id="account" required><br>
							</div>
						</div>
						
					</div>
				</div>
				
				<div id="agree_check">
					<p id="agree_text">
						* 수거 신청을 위해 <a href="#pop_info_1" class="btn_open"> 이용약관</a> 및 <a href="#pop_info_2"
							class="btn_open">개인정보 수집</a>에 동의합니다.
					</p>
					<input type="checkbox" name="agree" id="agree" value="yes" />네, 동의합니다.<br>
				</div>
			</div>
			<div>
				<input type="submit" value="회원가입" id="submit">
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
					<button type="button" class="btn_close">닫기</button>
				</div>
			</div>
		</form>
			</div>
	</main>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript" src="../../resources/js/registerAddress.js"></script>
		<script type="text/javascript" src="../../resources/js/registerregExp.js"></script>
	</body>

	</html>