<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
       	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sec:authentication property="principal" var="member"/>
<ul>
<li><a href="/all">전체 페이지</a></li>
<c:choose>
	<c:when test="${member == 'anonymousUser'}">
	<li><a href="/login">로그인</a></li>
	<li><a href="/register">회원가입</a></li>
	</c:when>
	
	<c:otherwise>
	<sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
	<li><a href="/admin">관리자 페이지</a></li>
	</sec:authorize>
	
	<li><a href="/member">회원 페이지</a></li>
	<li><a href="/logout">로그아웃</a></li>
	</c:otherwise>
	</c:choose>
</ul>
</body>
</html>