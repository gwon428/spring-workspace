<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/review/view.css" />
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
</head>

<body class="main">
	<header>
		<nav>
			<a href="/">Primavera</a>
		</nav>
		<nav>
			<a href="/mainMap">Store</a> <a href="#">Guide</a> <a
				href="/collectPage">PickUp</a> <a href="/list">Board</a> <span>
				<a href="/review/list">Review</a> <a href="listQna">Q & A</a> <a
				href="/notice/list">Notice</a>
			</span> <a href="/myPage"><i class="fa-regular fa-user"></i></a>
		</nav>
	</header>
	<div class="container">
		<h1>Review</h1>
		<form id="reviewForm" action="/updatereview" method="post"
			enctype="multipart/form-data" onsubmit="return validateForm();">
			<input type="hidden" name="no" value="${vo.no}"> <input
				type="hidden" name="url" value="${vo.url}">

			<c:if test="${not empty vo.url}">
				<div class="form-image">
					<img id="imagePreview" src="/upload/review/${vo.url}"
						alt="Review Image">
				</div>
			</c:if>

			<c:if test="${vo.id == currentUserId}">
				<label for="fileInput" class="btn btn-info">이미지 수정</label>
				<input type="file" id="fileInput" name="file" accept="image/*"
					style="display: none;" onchange="previewImage(event)">
			</c:if>

			<div class="form-group">
				<label>제목</label> <input class="form-control" name="title"
					maxlength="30" placeholder="제목을 입력하세요.(최대 30자)" value="${vo.title}"
					${vo.id != currentUserId ? 'readonly' : ''}>
			</div>

			<div class="form-group">
				<label>별점</label>
				<div class="star-rating">
					<c:forEach begin="1" end="5" var="i">
						<i class="${i <= vo.rating ? 'fas' : 'far'} fa-star"
							data-rating="${i}"></i>
					</c:forEach>
					<input type="hidden" name="rating" id="rating-input"
						value="${vo.rating}"}>
				</div>
			</div>

			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="10" name="content"
					maxlength="300" placeholder="내용을 입력하세요.(최대 300자)"
					${vo.id != currentUserId ? 'readonly' : ''}>${vo.content}</textarea>
			</div>

			<a href="/review/list" class="btn-list">글목록</a>

			<c:if test="${vo.id == currentUserId}">
				<button type="submit" class="btn-info">수정</button>
			</c:if>

			<sec:authorize
				access="hasAuthority('ADMIN') or ${vo.id == currentUserId}">
				<a class="btn-delete" href="/deletereview?no=${vo.no}">삭제</a>
			</sec:authorize>
		</form>
	</div>

	<script>
		function previewImage(event) {
	        var reader = new FileReader();
	        reader.onload = function(){
	            var output = document.getElementById('imagePreview');
	            output.src = reader.result;
	        };
	        reader.readAsDataURL(event.target.files[0]);
	    }
	</script>

	<script>
	    function validateForm() {
	        var title = document.getElementsByName("title")[0].value.trim();
	        var content = document.getElementsByName("content")[0].value.trim();
	
	        if (!title && !content) {
	            alert("제목과 내용이 입력되지 않았습니다.");
	            return false;
	        } else if (!title) {
	            alert("제목이 입력되지 않았습니다.");
	            return false;
	        } else if (!content) {
	            alert("내용이 입력되지 않았습니다.");
	            return false;
	        }
	        return true;
	    }
	</script>
	
	<script>
        document.addEventListener("DOMContentLoaded", function() {
            const stars = document.querySelectorAll(".star-rating i");
            const readOnly = "${vo.id != currentUserId}" === "true";

            stars.forEach((star, index) => {
                if (readOnly) {
                    star.style.cursor = 'default';
                } else {
                    star.addEventListener("click", () => {
                        const rating = index + 1;
                        document.getElementById("rating-input").value = rating;
                        updateStars(rating);
                    });
                }
            });

            function updateStars(rating) {
                stars.forEach((star, index) => {
                    star.classList.remove(index < rating ? "far" : "fas");
                    star.classList.add(index < rating ? "fas" : "far");
                });
            }
        });
    </script>
</body>
</html>