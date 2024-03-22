<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/map/mainMap.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
</head>

<body class="main">
	<main>
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

		<div class="word">
			<h1 class="h1">Store</h1>
		</div>

		<section id="neck">
			<div class="cover"></div>
		</section>

		<div class="slider1">
			<div class="slides1">
				<div class="slide" id="slide-1">
					<img src="../../../resources/images/wallet1.png" alt="Wallet1">
					<div class="text">퀄팅 아코디언 카드지갑<br> - 아코디언 4단 분리 지갑<br> - 카드, 지폐, 동전,
						명함 등을 분리 수납 가능</div>
				</div>
				<div class="slide" id="slide-2">
					<img src="../../../resources/images/wallet2.png" alt="Wallet2">
					<div class="text">아코디언 카드 홀더[세이지 그린]<br> - 카드 이탈방지 가드 적용<br> - 최대 8장
						카드 수납 가능 - 색상 : 세이지 그린</div>
				</div>
				<div class="slide" id="slide-3">
					<img src="../../../resources/images/wallet3.png" alt="Wallet3">
					<div class="text">콘월 여성 반지갑<br> - 멀티 반지갑<br> - 지폐 수납칸 1개, 지퍼칸 1개, 카드칸
						8개 - 블랙 색상에 핑크 테두리 컬러 추가</div>
				</div>
			</div>
		</div>
		<div class="move-btn">
			<button id="prev"><</button>
			<button id="next">></button>
		</div>

		<div class="slider2">
			<div class="slides2">
				<div class="slide" id="slide-4">
					<img src="../../../resources/images/wallet.jpg" alt="Wallet">
					<div class="text">Wallet - 버려지는 옷감들을 업사이클링해 만든 지갑</div>
				</div>
				<div class="slide" id="slide-5">
					<img src="../../../resources/images/clothes.jpg" alt="Clothes">
					<div class="text">Clothes - 버려지는 옷감들을 업사이클링해 만든 옷</div>
				</div>
				<div class="slide" id="slide-6">
					<img src="../../../resources/images/bag.jpg" alt="Bag">
					<div class="text">Backpack - 버려지는 옷감들을 업사이클링해 만든 가방</div>
				</div>
			</div>
		</div>
		

		<div class="slider3">
			<div class="slides3">
				<div class="slide" id="slide-7">
					<img src="../../../resources/images/wallet.jpg" alt="Wallet">
					<div class="text">Wallet - 버려지는 옷감들을 업사이클링해 만든 지갑</div>
				</div>
				<div class="slide" id="slide-8">
					<img src="../../../resources/images/clothes.jpg" alt="Clothes">
					<div class="text">Clothes - 버려지는 옷감들을 업사이클링해 만든 옷</div>
				</div>
				<div class="slide" id="slide-9">
					<img src="../../../resources/images/bag.jpg" alt="Bag">
					<div class="text">Backpack - 버려지는 옷감들을 업사이클링해 만든 가방</div>
				</div>
			</div>
		</div>
		

		<!-- <div class="image-text-container">
			<div class="image-text-wrapper">
				<img src="../../../resources/images/wallet.jpg" alt="Wallet">
				<div class="text-section">
					<h1>WALLET</h1>
					<br>
					<p>------------------------------------------------</p>
					<br>
					<p>버려지는 옷감들을 업사이클링해 만든 지갑</p>
				</div>
			</div>
			<div class="image-text-wrapper">
				<img src="../../../resources/images/clothes.jpg" alt="Clothes">
				<div class="text-section">
					<h1>CLOTHES</h1>
					<br>
					<p>------------------------------------------------</p>
					<br>
					<p>버려지는 옷감들을 업사이클링해 만든 옷</p>
				</div>
			</div>
			<div class="image-text-wrapper">
				<img src="../../../resources/images/bag.jpg" alt="Bag">
				<div class="text-section">
					<h1>BACKPACK</h1>
					<br>
					<p>------------------------------------------------</p>
					<br>
					<p>버려지는 옷감들을 업사이클링해 만든 가방</p>
				</div>
			</div>
		</div>
 -->
		<div id="map" style="width: 800px; height: 600px;"></div>


		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04b7f22e5edf17d8f2ce411e6eb1f006"></script>
		<script>
		    var mapContainer = document.getElementById('map'),
		        mapOption = {
		            center: new kakao.maps.LatLng(37.5519, 126.9918),
		            level: 9
		        };
		    var map = new kakao.maps.Map(mapContainer, mapOption);
		    var markers = [
		        { position: new kakao.maps.LatLng(37.49781, 127.13338), content: '<div class="wrap">'
					+ '    <div class="info">'
					+ '        <div class="title">'
					+ '            프리마베라 1호점'
					+ '            '
					+ '        </div>'
					+ '        <div class="body">'
					+ '            <div class="img">'
					+ '                <img src="../../../resources/images/wallet.jpg" width="73" height="70">'
					+ '           </div>'
					+ '            <div class="desc">'
					+ '                <div class="ellipsis">서울특별시 송파구 동남로 238</div>'
					+ '                <div class="ellipsis1"><a href="https://map.kakao.com/link/to/프리마베라 1호점,37.49781, 127.13338" target="_blank">1호점 가는길</a></div>'
					+ '                <div>070-1312-1454</div>'
					+ '            </div>' + '        </div>' + '    </div>'
					+ '</div>' },
		        { position: new kakao.maps.LatLng(37.574524, 127.03965), content: '<div class="wrap">'
					+ '    <div class="info">'
					+ '        <div class="title">'
					+ '            프리마베라 2호점'
					+ '            '
					+ '        </div>'
					+ '        <div class="body">'
					+ '            <div class="img">'
					+ '                <img src="../../../resources/images/clothes.jpg" width="73" height="70">'
					+ '           </div>'
					+ '            <div class="desc">'
					+ '                <div class="ellipsis">서울특별시 동대문구 천호대로 145</div>'
					+ '                <div class="ellipsis1"><a href="https://map.kakao.com/link/to/프리마베라 2호점,37.574524, 127.03965" target="_blank">2호점 가는길</a></div>'
					+ '                <div>070-1712-3764</div>'
					+ '            </div>' + '        </div>' + '    </div>'
					+ '</div>' },
		        { position: new kakao.maps.LatLng(37.495472, 126.887536), content: '<div class="wrap">'
					+ '    <div class="info">'
					+ '        <div class="title">'
					+ '            프리마베라 3호점'
					+ '            '
					+ '        </div>'
					+ '        <div class="body">'
					+ '            <div class="img">'
					+ '                <img src="../../../resources/images/bag.jpg" width="73" height="70">'
					+ '           </div>'
					+ '            <div class="desc">'
					+ '                <div class="ellipsis">서울특별시 구로구 가마산로 245</div>'
					+ '                <div class="ellipsis1"><a href="https://map.kakao.com/link/to/프리마베라 3호점,37.495472, 126.887536" target="_blank">3호점 가는길</a></div>'
					+ '                <div>070-4512-1214</div>'
					+ '            </div>' + '        </div>' + '    </div>'
					+ '</div>' }
		    ];
		    markers.forEach(function(markerInfo, index) {
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: markerInfo.position
		        });
					
					// 마커 위에 커스텀오버레이를 표시			
					var overlay = new kakao.maps.CustomOverlay({
			            content: markerInfo.content,
			            map: map,
			            position: marker.getPosition()
			        });
			        overlay.setMap(null);
			        daum.maps.event.addListener(marker, 'mouseover', function() {
			        	overlay.setMap(map);		
			        	setTimeout(function() { overlay.setMap(null); }, 3000);
			        });
			       
			    });
			    function closeOverlay(overlay) {
			        overlay.setMap(null);
			    }
				 // 지도에 확대 축소 컨트롤을 생성한다
				var zoomControl = new kakao.maps.ZoomControl();

				// 지도의 우측에 확대 축소 컨트롤을 추가한다
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);			
			    
	</script>

		<script>
			document.addEventListener("DOMContentLoaded", function() {
			    var observer = new IntersectionObserver(function(entries) {
			        entries.forEach(entry => {
			            if(entry.isIntersecting) {
			                entry.target.classList.add('animate');
			            }
			        });
			    });
			   
			    document.querySelectorAll('.image-text-wrapper').forEach(item => {
			        observer.observe(item);
			    });
			  
			    var mapElement = document.querySelector('#map');
			    observer.observe(mapElement);
			});
		</script>

		<script>
		let slideIndex = 1;
		showSlides(slideIndex);

		function plusSlides(n) {
		  showSlides(slideIndex += n);
		}

		function showSlides(n) {
		  let i;
		  let slides = document.querySelectorAll(".slide");
		  if (n > slides.length) {slideIndex = 1}
		  if (n < 1) {slideIndex = slides.length}
		  for (i = 0; i < slides.length; i++) {
		      slides[i].style.display = "none";
		  }
		  slides[slideIndex-1].style.display = "flex";
		}

		document.getElementById('prev').addEventListener('click', function() {
		  plusSlides(-1);
		});

		document.getElementById('next').addEventListener('click', function() {
		  plusSlides(1);
		});

</script>

	</main>
</body>
</html>