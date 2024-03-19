<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>09. LocalStorage</title>
</head>
<body>

	<h1>로그인</h1>
	<form action="/login" method="post">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="pwd"><br>
		<input type="submit">
	</form>
	<hr>

	<h1>Local Storage TEST</h1>
	
	<button onclick="add()">추가</button>
	<button onclick="view()">보기</button>
	<button onclick="remove()">삭제</button>
	
	<div id="result"></div>
	
	<script>
		function add(){
			localStorage.setItem("test", "item1");
		}
		
		function view(){
			const result = document.querySelector("#result");
			const item = localStorage.getItem("test");
			result.innerHTML = item;
		}
		
		function remove(){
			localStorage.removeItem("test");
			location.reload();	// 새로고침
		}
	</script>
</body>
</html>