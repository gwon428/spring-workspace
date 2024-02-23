<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="updateMember" method="post">
		아이디 : <input type="text" name="id" readonly value="${vo.id}"> <br>
		변경할 비밀번호 : <input type="password" name="password" value="${vo.password}"> <br>
		변경할 이름 : <input type="text" name="name" value="${vo.name}">
		<input type="submit" value="회원 정보 수정">
	</form>
	
	<h2>비밀번호 변경</h2>
	<form action="updateMember" method="post">
		<input type="hidden" name="id"  value="${vo.id}"> <br>
		변경할 비밀번호 : <input type="password" name="password" value="${vo.password}"> <br>
		<input type="submit" value="회원 정보 수정">
	</form>
</body>
</html>