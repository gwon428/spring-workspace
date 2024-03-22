let idDupCheck = false; // true가 되면 ID 사용 불가!
let idCheck = false;
let pwdCheck = false;
let pwdCheck2 = false;
let nameCheck = false;
let phoneCheck = false;
let phoneDupCheck = false;
let emailCheck = false;
let emailDupCheck = false;
let f = false;

// 아이디 정규표현식
$('#userId').keyup((e) =>{
	let id=$(e.target).val(); 
	const regExp = /^[A-Za-z][A-Za-z0-9]{3,11}$/;
	if(regExp.test(id) || id === ""){
		$('#idreg').html('&nbsp;');
		$('#idreg2').html('&nbsp;');
		idCheck = false;
	} else {
		$('#idCheckresult').text("ID 사용 불가").css("color", "black");
		$('#idreg').text("첫 글자는 반드시 영문자로,").css("color", "black");
		$('#idreg2').text("영문자, 숫자 포함하여 총 4~12자로 입력하세요.").css("color", "black");
		idCheck = true;
	}
});
			
$('#userId').keyup(() => {
	const id = $('#userId').val();
	$.ajax({
		type: "post",
		url: "/check",
		data: "id=" + id,

		success: function (result) {
			if (result) {
				$('#idCheckresult').text("ID 사용 불가").css("color", "black");
				idDupCheck = true;
			} else if (id == '') {
				$('#idCheckresult').html('&nbsp;');
			} else if(!result && !idCheck) {
				$('#idCheckresult').text("ID 사용 가능").css("color", "white");
				idDupCheck = false;
			}
		}
	})
})

// 비밀번호 정규표현식
$('#userPwd').keyup((e) =>{
	 let pwd =$(e.target).val(); 

	const regExp = /^[!-~]{8,15}$/;
	
	if(regExp.test(pwd) || pwd === ""){
		$('#pwdreg').html('&nbsp;');
		$('#pwdreg2').html('&nbsp;');
		pwdCheck = false;
	} else {
		$('#pwdreg').text("영문자, 숫자, 특수문자 포함하여").css("color", "black");
		$('#pwdreg2').text(" 총 8~15자로 입력하세요.").css("color", "black");
		pwdCheck = true;
	}
});


// 비밀번호 확인
$('#passwordcheck').keyup((e) =>{
	let pwd = $('#userPwd').val();
	let pwdCheck = $(e.target).val();
	
	if((pwd === pwdCheck) || pwdCheck === "") {
		$('#pwdcheckreg').html('&nbsp;');
		pwdCheck2 = false;
	} else {
		$('#pwdcheckreg').text("위의 비밀번호와 일치하게 입력하세요.").css("color", "black");
		pwdCheck2 = true;
	}
});

// 이름 정규표현식
$('#userName').keyup((e) => {
	let name = $('#userName').val();
	
	const regExp = /^[가-힣]{2,}$/;
	
	if(regExp.test(name) || name === ""){
		$('#namereg').html('&nbsp;');
		$('#namereg2').html('&nbsp;');
		nameCheck = false;
	} else {
		$('#namereg').text("한글로만 이루어진").css("color", "black");
		$('#namereg2').text("2글자 이상의 이름을 입력하세요.").css("color", "black");
		nameCheck = true;
	}
});

// 전화번호 정규표현식
$('#userPhone').keyup((e) => {
	let phone = $('#userPhone').val();
	
	const regExp = /^01(0|1|[6-9])[0-9]{3,4}[0-9]{4}$/;
	
	if(regExp.test(phone) || phone === ""){
		$('#phonereg').html('&nbsp;');
		phoneCheck = false;
	} else {
		$('#phoneCheckresult').text("전화번호 사용 불가").css("color", "black");
		$('#phonereg').text("휴대폰 번호를 입력하세요.").css("color", "black");
		phoneCheck = true;
	}
});

// 휴대폰 번호 중복 확인
$('#userPhone').keyup(() => {
	const phone = $('#userPhone').val();
	$.ajax({
		type: "post",
		url: "/checkphone",
		data: "phone=" + phone,

		success: function (result) {
			if (result) {
				$('#phoneCheckresult').text("전화번호 사용 불가").css("color", "black");
				phoneDupCheck = true;
			} else if (phone == '') {
				$('#phoneCheckresult').html('&nbsp;');
			} else if(!result && !phoneCheck) {
				$('#phoneCheckresult').text("전화번호 사용 가능").css("color", "white");
				phoneDupCheck = false;
			}
		}
	})
})

// 이메일 정규표현식
$('#email').keyup((e) => {
	let email = $('#email').val();
	
	const regExp = /^\w+@\w+\.\w+$/;
	
	if(regExp.test(email) || email === ""){
		$('#emailreg').html('&nbsp;');
		emailCheck = false;
	} else {
		$('#emailCheckresult').text("이메일 사용 불가").css("color", "black");
		$('#emailreg').text("이메일 형식에 맞춰서 입력하세요.").css("color", "black");
		emailCheck = true;
	}
});

$('#email').keyup(() => {
	const email = $('#email').val();
	$.ajax({
		type: "post",
		url: "/checkemail",
		data: "email=" + email,

		success: function (result) {
			if (result) {
				$('#emailCheckresult').text("이메일 사용 불가").css("color", "black");
				emailDupCheck = true;
			} else if (email == '') {
				$('#emailCheckresult').html('&nbsp;');
			} else if(!result && !emailCheck) {
				$('#emailCheckresult').text("이메일 사용 가능").css("color", "white");
				emailDupCheck = false;
			}
		}
	})
})


function validate(){

	let f = document.register;

	if(idCheck){
		userId.focus();
		return false;
	} else if (idDupCheck){
		userId.focus();
		return false;
	} else if(pwdCheck){
		userPwd.focus();
		return false;
	} else if(pwdCheck2){
		passwordcheck.focus();
		return false;
	} else if (nameCheck){
		userName.focus();
		return false;
	} else if (phoneCheck){
		userPhone.focus();
		return false;
	} else if (phoneDupCheck){
		userPhone.focus();
		return false;	
	} else if(emailCheck){
		email.focus();
		return false;
	} else if (emailDupCheck){
		email.focus();
		return false;
	} else if(!f.agree.checked){
		alert("약관 내용에 동의해주세요.");
	    return false;
	}
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

