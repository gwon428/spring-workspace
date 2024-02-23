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
	
	<h2> foreach 동적쿼리 테스트</h2>
	<form action="find2">
		<input type="checkbox" name="checkId" value="user01"> user01
		<input type="checkbox" name="checkId" value="user02"> user02
		<input type="checkbox" name="checkId" value="user03"> user03
		<input type="checkbox" name="checkId" value="user04"> user04
		<input type="submit" value="검색">
		<!-- SELECT * FROM member WHERE id IN('', '', ''); ==> 필터 검색!!!!-->
	</form>
</body>
</html>