<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />
	<style>
		h1 {
			margin-top: 70px;
		}
		.form-group {
			margin: 20px 0;
		}
		img {
			width: 200px;
		}
	</style>
</head>
<body>
<div class="container">
		<h1>게시물 정보</h1>
		<form action="/update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="no" value="${vo.no}">
			<input type="hidden" name="url" value="${vo.url}">
			<div class="form-group">
				<label>Title</label>
				<input class="form-control" name="title" value="${vo.title}">
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea class="form-control" row="10" name="content" style="resize:none;">${vo.content}</textarea>
				<a href="/upload/${vo.url}" download><img src="/upload/${vo.url}"/></a>
			</div>
			<div class="form-group">
				<label for="file">Add File</label>
				<input class="form-control" type="file" id="file" name="file" accept="image/*">
			</div>
			
			<button type="submit" class="btn btn-outline-warning">수정</button>
			<a class="btn btn-outline-danger" href="/delete?no=${vo.no}">삭제</a>
		</form>
	</div>
</body>
</html>