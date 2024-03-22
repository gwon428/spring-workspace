<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/front.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>Document</title>
<style>
@font-face {
	font-family: "Cafe24Oneprettynight";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff")
		format("woff");
	font-style: normal;
}
.pop_wrap {
	visibility: hidden;
	border: 1px solid black;
	position: fixed;
	top: 19%;
	left: 40%;
	box-sizing: border-box;
	width: 400px;
	height: 550px;
	background-color: white;
	overflow: hidden;
	border-radius: 10px;
}
.pop_inner {
	line-height: 23px;
	font-size: 13px;
	margin: 0 8px;
}
.pop_inner hr {
	margin: 3px;
}
.btn_close {
	position: absolute;
	left: 40%;
	margin-top: 15px;
	font-family: "Cafe24Oneprettynight";
	font-weight: bolder;
	border: 1px solid black;
	border-radius: 3px;
	width: 43px;
	margin-left: 16px;
}
#pop_head {
	display: flex;
	justify-content: space-between;
}
.modal-body {
	max-height: calc(99vh - 500px);
	overflow-y: auto;
	font-family: "Malgun Gothic";
}
</style>
</head>
<body>
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
			</span> <a href="myPage"><i class="fa-regular fa-user"></i></a>
		</nav>
	</header>
	<main>
		<section id="section1">
			<div>
				<video
					src="../../resources/images/production_id_4919750 (1080p).mp4"
					id="background_video" preload="auto" autoplay="autoplay"
					loop="loop" muted="muted" volume="0"></video>
			</div>
			<div class="directivity">
				<h1 class="h1">We are walking with</h1>
				<h1 class="h2">the environment</h1>
				<a href="collectPage">
					<h1>Pick Up ></h1>
				</a>
			</div>
			<nav>
				<a href="#section1"><i class="fa-solid fa-seedling"></i></a> <a
					href="#section2"><i class="fa-solid fa-leaf"></i></a> <a
					href="#section3"><i class="fa-solid fa-tree"></i></i></a> <a
					href="#section4"><i class="fa-solid fa-mountain-sun"></i></a>
			</nav>
		</section>
		<section id="section2">
			<div id="carouselExampleFade" class="carousel slide carousel-fade">
				<div class="carousel-inner">
					<div class="carousel-item active" id="container3">
						<h1>Company_introduce</h1>
						<p class="text1">
							'Primavera'는 '진정한 봄'이라는 뜻의 이탈리아어로 새로운 생명의 시작과 자연의 활기를 뜻합니다 <br>
							<br> 저희 'Primavaera'는 심각한 지구 온난화와 기후 변화로 인한 피해를 줄이고자 탄소 배출량을
							줄일 수 있는 폐의류 업사이클링을 통해 환경과 자연의 피해를 줄이고 이들의 원래 모습을 되찾기 위한 길을 걷고
							있습니다
						</p>
						<img src="../resources/images/front_img.jpg" class="" alt="...">
					</div>
					<div class="carousel-item" id="container3">
						<h1>Work_introduce</h1>
						<p>
							업사이클링이란 기존에 버려지는 제품을 새로운 제품으로 재탄생시켜 새로운 가치를 부여하는 작업을 의미합니다. <br>
							<br> 'Primavera'는 일상이나 기업에서 버려지는 폐의류를 수거하여 분류한 뒤 이들을 새로운
							제품으로 만들어 새로운 가치를 부여하고 오프라인 매장에 판매함으로써 환경과 시장경제에 이바지하고 있습니다
						</p>
						<img src="../resources/images/Work_introduce.jpg" class=""
							alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleFade" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleFade" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</section>
		<section id="section3">
			<div class="container1">
				<h1>User_Guide</h1>
				<p>지속 가능한 옷은 이미 옷장에 있는 옷입니다. <br>


프리마베라는 버려지는 의류에 새로운 가치를 부여합니다. <br><br>
Sustainable clothes are clothes you already have in your closet.
Primavera gives new value to discarded clothing.
					</p>
				<a href="#"> > You want more details, don't you?</a>
			</div>
			<div class="container2">
				<div class="container-blackbox"></div>
				<h1>Map</h1>
				<a href="#"><img
					src="../../resources/images/서울지도 최종본 section3.jpg" alt=""></a>
				<li>The service area is all over Seoul.</li>
			</div>
			<div class="Floor">
				<p>Details of user</p>
				<p>guides and maps</p>
			</div>
		</section>
		<section id="section4">
			<div class="line1"></div>
			<div class="section4_login">
				<div id="title">
					<h2>Join our Prima</h2>
					<p>커뮤니티에 가입하여 더 많은 최신정보들과 유저들간의 소통을 원한다면</p>
				</div>
				<div>
					<a href="myPage">Login</a> <a href="register">Join Membership</a>
				</div>
			</div>
			<div class="line2"></div>
			<footer>
				<p class="title">Primavera</p>
				<div class="left">
					<h5>Let's change the environment</h5>
					<h4>
						새로운 생명의 시작과 자연의 활기<br> the beginning of a new life and the
						exuberance of nature
					</h4>
					<p>저희 회사는 서울에 등록된 회사입니다(번호 CSEZ421153)</p>
					<h1>Since 2024</h1>
				</div>
				<div class="center">
					<ul>
						<li>p : 052)XXX-XXXX</li>
						<li>T : 010-XXXX-XXXX</li>
						<li>E : Primavera@com.kh.kr</li>
					</ul>
					<span> <a href="https://www.instagram.com/">instagram</a> <a
						href="https://www.facebook.com/?locale=ko_KR">facebook</a> <a
						href="https://twitter.com/?lang=ko">twitter</a> <a
						href="https://www.youtube.com/">YouTube</a>
					</span>
				</div>
				<div class="right">
					<div class="right">
						<h2>Ceo : 애드워드 권</h2>
						<h2>
							Personal Information Management Officer : <br> 스미스 정 | 소피아 손
							| 제임스 킴
						</h2>
						<br>
						<h2>본사&스토어주소 : 서울 강남구 테헤란로14길 6</h2>
						<div>
							<a href="#pop_info_1" class="btn_open">이용약관</a> <a
								href="#pop_info_2" class="btn_open">개인정보처리방침</a>
						</div>
						<img
							src="https://assets-global.website-files.com/6477332607fa08930fe00261/6477570d55c46a6f4957b3ef_app%20store.svg"
							alt="" />
					</div>
			</footer>
		</section>
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
	</main>
	<script src="/resources/js/front.js"></script>
</body>
</html>