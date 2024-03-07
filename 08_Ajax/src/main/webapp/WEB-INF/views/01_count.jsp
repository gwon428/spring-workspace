<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Ajax(Asynchronous JavaScript and XML) : 비동기적 정보 교환 기법 -->
	<h1>Show Count</h1>
	<input type="button" id="btn" value="count 증가" onclick = "startRequest()"/>
	<p id="result">0</p>
	
	<!-- 자바스크립트 방식 -->
	<script>
		let xhr;					// 자바스크립트가 제공하는 XMLHttpRequest()의 약자
		function startRequest(){	// '요청'에 해당하는 로직을 담는 메서드
			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = callback;	// callback 함수 연결
			xhr.open("get", "/count");	// 정보 보내기 ..? // 0 -> 1로 변하게 하는 로직 
			xhr.send(null);		// 이 때 서버로 실질적인 전송 (input type="submit")
			// xhr.send => get 방식은 null (파라미터로 보내는 게 없어서?), post 방식은 
		}
		
		function callback(){		// '응답'에 해당하는 로직을 담는 메서드
			if(xhr.readyState === 4){
				if(xhr.status === 200){	// 응답이 성공한 상태!
					const result = xhr.responseText;		// AjaxController에서 보낸 count 값 = xhr.responseText
					document.querySelector("#result").innerHTML = result;
				}
			}
		}
	</script>
</body>
</html>