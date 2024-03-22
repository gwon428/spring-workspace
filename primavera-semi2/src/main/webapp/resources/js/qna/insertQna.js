function validate() {
		let f = document.insertQna;
		
		if (f.id_input.value == '') {
		  	f.id_input.focus();
	        return false;
		} else if(f.title_input.value == ''){
		    f.title_input.focus();
		    return false;
		}else if(f.content_input.value == ''){
		    f.content_input.focus();
		    return false;
		}
		    alert("Q&A 등록에 성공하였습니다.");
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