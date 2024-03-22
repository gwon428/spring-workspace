function validate() {
	let f = document.pickUp;
	
	if (f.name.value == '') {
	  	f.name.focus();
        return false;
	} else if(f.phone.value == ''){
	    f.phone.focus();
	    return false;
	} else if(f.postCode.value == ''){
	    f.postCode.focus();
	    return false;
	}else if(f.roadAddress.value == ''){
	    f.roadAddress.focus();
	    return false;
	}else if(f.detailAddress.value == ''){
	    f.detailAddress.focus();
	    return false;
	}else if(f.collectionDate.value==''){
	    f.collectionDate.focus();
	    return false;
	}else if(f.kg.value==''){
	    f.kg.focus();
	    return false;
	}else if(!f.agree.checked){
		alert("약관 내용에 동의해주세요.");
	    return false;
	}
	    alert("수거 신청에 성공하였습니다.");
	    return true; 
}
	      

var target = document.querySelectorAll('.btn_open');
var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
var targetID;

for (var i = 0; i < target.length; i++) {
	target[i].addEventListener('click', function() {
			targetID = this.getAttribute('href');
			document.querySelector(targetID).style.visibility = 'visible';
	});
}

for (var j = 0; j < target.length; j++) {
	btnPopClose[j].addEventListener('click', function() {
		this.parentNode.parentNode.style.visibility = 'hidden';
	});
}


