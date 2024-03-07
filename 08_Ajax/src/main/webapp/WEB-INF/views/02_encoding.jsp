<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<h2>Encoding 처리하기</h2>
	닉네임 : <input type="text" name="nick" id="nick">
	<input type="button" value="닉네임 보내기" id="btn">  <!-- onclick="startRequest()" -->
	<div id="result"></div>
	
	<!-- 자바스크립트 방식
		get 방식으로 /encoding <--- 닉네임 보내서 [요청]
		해당 닉네임 받아서 result에 보여주기
	--> 
	<!-- 
	<script>
		let xhr;
		function startRequest(){
			const nick = document.querySelector("#nick");
			xhr = new XMLHttpRequest();
			// callback 함수 연결
			xhr.onreadystatechange = callback;
			// open에 메서드 방식, 보낼 url
			// get 방식일 경우.. url에 추가
			xhr.open("get", "/encoding?nick="+encodeURI(encodeURIComponent(nick.value)));
			// 진짜 전송
			xhr.send(null);
		}
		
		function callback(){
			if(xhr.readyState === 4){
				if(xhr.status === 200){
					const result = xhr.responseText;
					document.querySelector("#result").innerHTML = decodeURI(decodeURIComponent(result));
				}
			}
		}
	</script>
	 -->
	 
	 
	 <!-- jQuery 방식 -->
	<script>
	$('#btn').click(()=>{
		const nick = $('#nick').val();
		// 비동기 시작
		$.ajax({
			// 요청
			type:"get",
			url:"/encoding",
			data: "nick=" +encodeURI(encodeURIComponent(nick)),
			
			// 응답
			success: function(result){
				 $('#result').text(decodeURI(decodeURIComponent(result)));
			}
		});
	})
	</script>
</body>
</html>