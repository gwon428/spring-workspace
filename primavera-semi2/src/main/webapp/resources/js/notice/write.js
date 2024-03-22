function validate() {
	    // 제목(title) 필드 확인
	    var title = document.getElementById("title_input").value;
	    if (title.trim() == "") {
	        alert("제목을 입력해주세요.");
	        return false; // 제출 방지
	    }

	    // 내용(content) 필드 확인
	    var content = document.getElementById("content_input").value;
	    if (content.trim() == "") {
	        alert("내용을 입력해주세요.");
	        return false; // 제출 방지
	    }

	    // 파일(file) 필드 확인
	    var file = document.getElementById("file").value;
	    if (file.trim() == "") {
	        alert("파일을 업로드해주세요.");
	        return false; // 제출 방지
	    }

	    // 모든 필드가 유효한 경우 true 반환하여 제출 허용
	    return true;
	}