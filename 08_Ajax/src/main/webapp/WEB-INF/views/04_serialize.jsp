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
<h1>회원가입</h1>
	
	<form id="frm">
		아이디 : <input type="text" name="id" id="id"><br>
		비밀번호 : <input type="password" name="password" id="password"><br>
		이름 : <input type="text" name="name" id="name"><br>
		<input type="button" value="가입" id="btn">
	</form>
	
	<div id="result"></div>
	
	<!-- post 방식으로 /serial id, password, name 값 넘겨서 회원가입 하고
	돌아와서 result에 정보 기재 -->
	<script>
	$('#btn').click(() => {
		$.ajax({
			type:"post",
			url:"/serial",
			data: $('#frm').serialize(),
			
			success: function(data){
				$('#result').html("아이디 : " + data.id);
			},
			error: function(){
				alert("에러발생")
			}
		})
	})
	</script>
</body>
</html>