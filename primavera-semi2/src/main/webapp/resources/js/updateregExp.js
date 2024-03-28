
let pwdCheck = true;
let nameCheck = true;
let phoneCheck = true;
let phoneDupCheck = false;
let emailCheck = true;
let emailDupCheck = false;

// 비밀번호 정규표현식
$('#userPwd').keyup((e) =>{
	 let pwd =$(e.target).val(); 

	const regExp = /^[!-~]{8,15}$/;
	
	if(regExp.test(pwd) || pwd === ""){
		$('#pwdreg').html('&nbsp;');
		pwdCheck = true;
	} else {
		$('#pwdreg').text("영문자, 숫자, 특수문자 포함하여 총 8~15자로 입력하세요.").css("color", "rgba(0, 0, 0, 0.5)");
		pwdCheck = false;
	}
});


// 이름 정규표현식
$('#userName').keyup((e) => {
	let name = $('#userName').val();
	
	const regExp = /^[가-힣]{2,}$/;
	
	if(regExp.test(name) || name === ""){
		$('#namereg').html('&nbsp;');
		nameCheck = true;
	} else {
		$('#namereg').text("한글로만 이루어진 2글자 이상의 이름을 입력하세요.").css("color", "rgba(0, 0, 0, 0.5)");
		nameCheck = false;
	}
});

// 전화번호 정규표현식 & 중복 확인
$('#userPhone').keyup((e) => {
	let phone = $('#userPhone').val();
	const regExp = /^01(0|1|[6-9])[0-9]{3,4}[0-9]{4}$/;
	
	$.ajax({
		type: "post",
		url: "/editphone",
		data: "phone=" + phone,

		success: function (result) {
			
			if (regExp.test(phone)){
				$('#phonereg').text("");
				
				switch(result){
					case 1:
						$('#phoneCheckresult').text("전화번호 사용 가능").css("color", "rgba(0, 0, 0, 0.5)");
						phoneDupCheck = false;
						phoneCheck = true;
						console.log("케이스 1 : " + phoneCheck);
						break;
					case 2:
						$('#phoneCheckresult').text("기존 전화번호와 동일합니다.").css("color", "rgba(0, 0, 0, 0.5)");
						phoneDupCheck = false;
						phoneCheck = true;
						console.log("케이스 2 : " + phoneCheck);
						break;
					case 3:
						$('#phoneCheckresult').text("전화번호 사용 불가").css("color", "black");
						phoneDupCheck = true;
						phoneCheck = false;
						console.log("케이스 3 : " + phoneCheck);
						break;
				}
				
			} else if (!regExp.test(phone)){
				$('#phoneCheckresult').text("전화번호 사용 불가").css("color", "black");
				$('#phonereg').text("유효한 전화번호를 입력해주세요.").css("color", "rgba(0, 0, 0, 0.5)");
				phoneCheck = false;
				phoneDupCheck = false;
				console.log("정규표현식 안 맞앙 " + phoneCheck);
				
			} else if (phone === ""){
				$('#phoneCheckresult').html('&nbsp;');
				phoneDupCheck = false;
				phoneCheck = false;
				console.log("비어있자녀" + phoneCheck);
			}
			
		}
	})
});



// 이메일 정규표현식
$('#email').keyup((e) => {
	let email = $('#email').val();
	const regExp = /^\w+@\w+\.\w+$/;
	
	$.ajax({
		type: "post",
		url: "/editemail",
		data: "email=" + email,

		success: function (result) {
			if (regExp.test(email)){
				$('#emailreg').text("");
				
				switch(result){
					case 1:
						$('#emailCheckresult').text("이메일 사용 가능").css("color", "rgba(0, 0, 0, 0.5)");
						emailDupCheck = false;
						emailCheck = true;
						console.log("케이스 1 : " + emailCheck);
						break;
					case 2:
						$('#emailCheckresult').text("기존 이메일과 동일합니다.").css("color", "rgba(0, 0, 0, 0.5)");
						emailDupCheck = false;
						emailCheck = true;
						console.log("케이스 2 : " + emailCheck);
						break;
					case 3:
						$('#emailCheckresult').text("이메일 사용 불가").css("color", "black");
						emailDupCheck = true;
						emailCheck = false;
						console.log("케이스 3 : " + emailCheck);
						break;
				}
				
			} else if (!regExp.test(email)){
				$('#emailCheckresult').text("이메일 사용 불가").css("color", "black");
				$('#emailreg').text("유효한 이메일을 입력해주세요.").css("color", "rgba(0, 0, 0, 0.5)");
				emailCheck = false;
				emailDupCheck = false;
				console.log("정규표현식 안 맞아 : " + emailCheck);
				
			} else if (email === ""){
				$('#emailCheckresult').html('&nbsp;');
				emailDupCheck = false;
				emailCheck = false;
				console.log("비어있어 " + emailCheck);
			}
		}
	})

});

function validate(){
	if(!pwdCheck){
		userPwd.focus();
		return false;
	} else if (!nameCheck){
		userName.focus();
		return false;
	} else if (!phoneCheck){
		alert("phoneCheck!");
		userPhone.focus();
		return false;
	} else if (phoneDupCheck){
		alert("phoneDupCheck!");
		userPhone.focus();
		return false;	
	} else if(!emailCheck){
		alert("emailCheck");
		email.focus();
		return false;
	} else if (emailDupCheck){
		alert("emailDupCheck");
		email.focus();
		return false;
	}

	return true;
}
