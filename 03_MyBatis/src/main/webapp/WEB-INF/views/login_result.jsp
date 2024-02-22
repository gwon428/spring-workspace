<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${not empty sessionScope.member}">
			<h1>로그인 정보</h1>
			<ul>
				<li>아이디 : ${sessionScope.member.id}</li>
				<li>비밀번호 : ${sessionScope.member.password}</li>
				<li>이름 : ${sessionScope.member.name}</li>
			</ul>
			<a href="index.jsp">첫 페이지로 이동</a>
		</c:when>
		<c:otherwise>
			<h2>로그인 실패..! 다시 로그인 해주세요</h2>
			<a href="login.jsp">첫 페이지로 이동</a>
		</c:otherwise>
	</c:choose>
</body>
</html>