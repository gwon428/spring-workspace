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
	<form action="find" method="post">
		아이디 혹은 이름 키워드를 입력하세요 : <input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>
</body>
</html>