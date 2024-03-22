function validate() {
		let f = document.updateQna;
		
		if (f.title.value == '') {
		  	f.title.focus();
	        return false;
		} else if(f.content.value == ''){
		    f.content.focus();
		    return false;
		}alert("Q&A 수정에 성공하였습니다.");
		    return true; 
	}
	
function imgShow(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			document.querySelector("div#image_container").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
	
function labelText(){
		var text = document.querySelector("#photo");
		text.style.display = "none";
	}

/* ------ 수정 시 사진 삭제 ----------*/
function photoDelete(){
	const qnaPhoto= document.querySelector("#qnaPhoto");
	const photoDeleteBtn = document.querySelector("#photoDelete");
	
	qnaPhoto.style.visibility = 'hidden';
	photoDeleteBtn.style.display = 'flex';
	delImg.value = true;
	
}