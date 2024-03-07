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
	
	<form>
		아이디 : <input type="text" name="id" id="id">
		<input type="button" value="중복체크" id="idCheck">
		<span id="idCheckView"></span>
	</form>
	
	<!-- 
	중복 체크 버튼을 눌렀을 때 post 방식으로 /check로 id값 넘기고
	결과값(boolean)을 받아서 아이디가 있으면 ID 사용 불가, 없으면 ID 사용 가능		
	 -->
	
	<script>
	$('#idCheck').click(()=>{
		const id = $('#id').val();
		$.ajax({
			type:"post",
			url:"/check",
			data: "id=" + id,
			
			success: function(result){
				if (result){
					$('#idCheckView').text("ID 사용 불가").css("color", "red");
				} else {
					$('#idCheckView').text("ID 사용 가능").css("color", "green");
				}
			}
		})
	})
	</script>
</body>
</html>