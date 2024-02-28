<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
	<!-- localhost:8080/list
		스키마 : sakila
		테이블 : film_text
		테이블들 리스트로 가져와서 여기 페이지에 보여주기!
		
		1. MyBatis 세팅 : pom.xml, driver.properties, root-context.xml, mybatis-config.xml
		
		2. VO : Film, mapper : film-mapper.xml -> mybatis-config.xml 세팅
		
		3. Controller : FilmController -> @GetMapping("/list") 메서드 추가
		
		4. film-mapper.xml : namespace=filmMapper
			-> <select id="showFilm"> <resultMap>
			
		5. DAO : FilmDAO, Service : FilmService
		
		6. FilmController -> Service 연결해서 기능 가지고 와서 데이터 바인딩
		
		7. 
	-->
	<div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">제목</th>
					<th scope="col">설명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="item">
					<tr>
						<td>${item.id}</td>
						<td>${item.title}</td>
						<td>${item.desc}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<ul class="pagination">
		
			<li class="page-item ${paging.prev ? '' : 'disabled'}"><a class="page-link" href="/list?page=${paging.startPage-1}">Previous</a>
			</li>
			
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="page">
				<li class="page-item"><a class="page-link ${paging.page == page ? 'active' : ''}" href="/list?page=${page}">${page}</a></li>
			</c:forEach>
			
			<li class="page-item ${paging.next ? '' : 'disabled'}"><a class="page-link"href="/list?page=${paging.endPage+1}">Next</a></li>
		</ul>
	</div>
</body>
</html>