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
	<h1>회원 검색</h1>
	<form action="findMember">
		<select name="select">
			<option value="all">전체</option>
			<option value="id">아이디</option>
			<option value="name">이름</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>
</body>
</html>