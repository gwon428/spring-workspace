<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
	<style>
		.fa-heart{
		cursor:pointer
		}
		
		#addPick{
		color: red;
		}
		
		#delPick{
		color: red;
		}
	</style>
</head>
<body>
	<sec:authentication var="user" property="principal" />
	<!--
	${product}<br>
	${user}<br>
	${pick}
	-->
	<img src="${product.prodPhoto}" width="400">
	<h2>${product.prodName} 
		<c:choose>
			<c:when test="${empty pick}">
				<i class="fa-regular fa-heart" id="addPick"></i>
			</c:when>
			<c:otherwise>
				<i class="fa-solid fa-heart" id="delPick"></i>
				
				<script>
					$('#delPick').click(()=>{
						$.ajax({
							type:'post',
							url:'/delPick',
							data: 'code=' + ${product.prodCode},
							
							success: function(data){
								location.reload();
							}
						})
					})
				</script>
			</c:otherwise>
		</c:choose>
	</h2>
	<p>${product.price}</p>
	
	<script>
	$('#addPick').click(() =>{
		$.ajax({
			type:'post',
			url:'/addPick',
			data: 'code=' + ${product.prodCode},
			
			success: function(data){
				location.reload();
			}
		})
	})
	
	
	</script>
</body>
</html>





