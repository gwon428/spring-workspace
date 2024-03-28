<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<!-- 버튼을 눌렀을 때 동물보호센터명을 적은 값을 통해 해당 정보 result에 보여주기 -->
	<h2>동물보호센터 정보</h2>
	동물보호센터명 : <input type="text" id="name">
	<button id="btn">해당 동물보호센터 정보</button>
	
	<div id="result"></div>
	
	<script>
	$("#btn").click(function(){
		$.ajax({
			url:"/animal",
			data: {
				name: $("#name").val(),
			},
			success: function(data){
				const itemArr = data.response.body.items.item;
				console.log(itemArr);
				
				let value="";
				for(let item of itemArr){
					value += "<ul>" +
							"<li>" + item.careNm + "</li>" +
							"<li>" + item.careAddr + "</li>" + 
							"</ul>";
				}
				$("#result").html(value);
			}
		});
	});
	</script>
</body>
</html>