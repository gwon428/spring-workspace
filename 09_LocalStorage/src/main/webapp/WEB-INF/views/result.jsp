<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과 페이지</title>
</head>
<body>
<script>
	const token = `${token}`;
	alert(token);
	localStorage.setItem("token", token);
	location.href="/";	// index.jsp 페이지로
</script>
</body>
</html>