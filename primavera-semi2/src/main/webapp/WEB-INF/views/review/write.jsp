<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/review/write.css" />
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
</head>
<body>
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

	<div id="main">
		<h1>Review 쓰기</h1>
		<div class="container">
			<form id="reviewForm" action="/review/write" method="post"
				enctype="multipart/form-data" onsubmit="return validateForm();">
				<div class="form-group" id="title">
					<label>제목</label> <input class="form-control" name="title"
						id="title_input" maxlength="30" placeholder="제목을 입력하세요.(최대 30자)">
				</div>
				<div class="form-group">
					<label>Rating</label>
					<div id="rating" class="star-rating">
						<i class="fas fa-star" data-rating="1"></i> <i class="far fa-star"
							data-rating="2"></i> <i class="far fa-star" data-rating="3"></i>
						<i class="far fa-star" data-rating="4"></i> <i class="far fa-star"
							data-rating="5"></i> <input type="hidden" name="rating"
							id="rating-input" value="1">
					</div>
				</div>
				<div class="form-group" id="content">
					<label>내용</label>
					<textarea class="form-control" rows="10" name="content"
						id="content_input" maxlength="300"
						placeholder="내용을 입력하세요.(최대 300자)"></textarea>
				</div>
				<div class="form-group">
					<label for="file" class="btn_photo">Photo</label> <input
						class="form-control" type="file" id="file" name="file"
						accept="image/*" onchange="previewImage(event);" hidden>
					<div id="image_preview" style="display: none;"></div>
				</div>
				<div class="btn">
					<button type="submit" class="btn_photo">글쓰기</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		function previewImage(event) {
		    var reader = new FileReader();
		    reader.onload = function() {
		        var output = document.getElementById('image_preview');
		        output.style.backgroundImage = 'url(' + reader.result + ')';
		        // 이미지가 로드되면 보이도록 설정(미리보기)
		        output.style.display = 'block';
		    };
		    // 선택된 파일을 읽기
		    reader.readAsDataURL(event.target.files[0]);
		}
    </script>

	<script>
	    function validateForm() {
	        var title = document.getElementById("title_input").value;
	        var content = document.getElementById("content_input").value;
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
                const stars = document.querySelectorAll("#rating i");
                updateStars(1);
                
                stars.forEach((star, index) => {
                    star.addEventListener("click", () => {
                        const rating = index + 1;
                        document.getElementById("rating-input").value = rating;
                        updateStars(rating);
                    });
                });
                
                function updateStars(rating) {
                    stars.forEach((star, index) => {
                        if (index < rating) {
                            star.classList.remove("far");
                            star.classList.add("fas");
                        } else {
                            star.classList.remove("fas");
                            star.classList.add("far");
                        }
                    });
                }
            });          
        </script>
</body>
</html>