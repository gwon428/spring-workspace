<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<link rel="stylesheet" href="../../../resources/css/header.css" />
<link rel="stylesheet" href="../../../resources/css/qna/listQna.css" />
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<link rel="stylesheet" href="../../../resources/css/qna/listQnaModal.css" />

</head>
<body>
<sec:authentication property="principal" var="user" />
	
		<div class="header-blackbox"></div>
		<header>
			<nav>
				<a href="/">Primavera</a>
			</nav>
			<nav>
				<a href="mainMap">Store</a> 
				<a href="#">Guide</a> 
				<a href="collectPage">PickUp</a> 
				<a href="/notice/list">Board</a> 
				<span>
					<a href="/review/list">Review</a> 
					<a href="listQna">Q & A</a> 
					<a href="/notice/list">Notice</a>
				</span> 
				<a href="myPage"><i class="fa-regular fa-user" id="mypage"></i></a>
			</nav>
		</header>
		<section id="top">
			<div class="blackbox"></div>
			<div class="top-content">
				<h2>Q&A</h2>
			</div>
		</section>
		<!-- -----------------------------------main----------------------------- -->
		<div class="main">
			<div class="container">
				<div class="header">
					<h1>Q&A</h1>
					<c:choose>
						<c:when test="${user == 'anonymousUser'}">
							<a href="../myPage" 
								id="writeQna">Q&A등록</a>
						</c:when>
						<c:otherwise>
							<a href="/writeQna" id="writeQna">Q&A등록</a>
						</c:otherwise>
					</c:choose>

				</div>
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>아이디</th>
							<th>작성일</th>
							<th>답변상태</th>
						</tr>
					</thead>
					<tbody>
						<!--  현재 주소에 있는 거 긁어서 같이 넘기고,거기서 계속 넘기면 다시 유지해서 올 수 있음 -->
						<c:forEach items="${list}" var="item" varStatus="status">
							<tr>
							<!-- 
								<td>${status.count}</td>
								 -->
								 <td>${paging.total - (paging.page - 1) * 10 - status.index}</td>
								<c:choose>
									<c:when test="${(item.secret == 'Y') && (user == 'anonymousUser')}">
										<td><i class="fa-solid fa-lock"></i>&nbsp;
										<a href="myPage">${item.title}</a></td>
									</c:when>
									<c:otherwise>
									<c:if test="${(item.secret == 'Y') && (user.auth == 'MEMBER')}">
										<td><i class="fa-solid fa-lock"></i>&nbsp;
										<div id="pwd_check" data-id="${item.id}" data-value="${item.qnaNum}">${item.title}</div></td>
									</c:if>
									
										<c:if test="${(item.secret == 'Y' && user.auth == 'ADMIN')}">
											<td><i class="fa-solid fa-lock"></i>&nbsp;
											<a href="/viewQna?qnaNum=${item.qnaNum}">${item.title}</a></td>
										</c:if>
										<c:if test="${user == 'anonymousUser'||item.secret == null}">
											<td><a href="/viewQna?qnaNum=${item.qnaNum}">${item.title}</a></td>
										</c:if>
									</c:otherwise>
								</c:choose> 

								<td>${item.id}</td>
								<td><fmt:formatDate value="${item.writeDate}"
										pattern="yy-MM-dd HH:mm" /></td>
								<td>${item.status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>			
			<nav id="paging">
				<ul class="pagination">
					<li class="page-item ${paging.prev ? '' : 'disabled'}">
					
					<c:choose>
						<c:when test="${(paging.startPage == 1)&&(paging.select != null) && (paging.keyword != null)}">
							<a class="page-link" href="/listQna?select=${paging.select}&keyword=${paging.keyword}&page=${paging.startPage=1}">Previous</a>
						</c:when>
						<c:when test="${(paging.startPage == 1)&&(paging.select == null) && (paging.keyword == null)}">
							<a class="page-link" href="/listQna?page=${paging.startPage=1}">Previous</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="/listQna?page=${paging.startPage-1}">Previous</a>
						</c:otherwise>
					</c:choose>
					
					</li>

					<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
						var="page">
						<li class="page-item">
							<c:choose>
							<c:when test="${(paging.select != null) && (paging.keyword != null)}">
								<a class="page-link ${paging.page== page ? 'active' : ''}" href="/listQna?select=${paging.select}&keyword=${paging.keyword}&page=${page}" id="page_num">
									${page}
								</a>
							</c:when>
							<c:otherwise>
								<a class="page-link ${paging.page== page ? 'active' : ''}" href="/listQna?page=${page}" id="page_num">
									${page}
								</a>
							</c:otherwise>
							</c:choose>
						</li>
					</c:forEach>

					<li class="page-item ${paging.next ? '' : 'disabled'}">
					<c:choose>
						<c:when test="${(paging.endPage < 10)&&(paging.select != null) && (paging.keyword != null)}">
							<a class="page-link" href="/listQna?select=${paging.select}&keyword=${paging.keyword}&page=${paging.endPage=paging.endPage}">Next</a>
						</c:when>
						<c:when test="${(paging.endPage < 10)&&(paging.select == null) && (paging.keyword == null)}">
							<a class="page-link" href="/listQna?page=${paging.endPage=paging.endPage}">Next</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="/listQna?page=${paging.endPage + 1}">Next</a>
						</c:otherwise>						
					</c:choose>	
					</li>
				</ul>
			</nav>
				<div id="findQna">
					<form action="listQna" method="get">
						<select name="select">
							<option value="allFind">전체</option>
							<option value="titleFind">제목</option>
							<option value="idFind">아이디</option>
						</select>
						<input type="text" name="keyword">
						<input type="submit" value="조회" id="searchOk">
					</form>
				</div>
		</div>
		
				<div id="modalContainer" class="hidden">
				  <div id="modalContent">
				  	<h3>비밀글</h3>
				  	<div id="content">
				  	<form action="pwdCheck" method="post" id="pwdCheck" name="pwdCheck">
				  		<label>회원 비밀번호</label>
				  		<input type="password" id="password" name="password">
				  		<input type="hidden" id="qnaNum" name="qnaNum"> 
				  		<input type="hidden" id="idCheck" name="idCheck">
				  		<div id="modal_btn"> 
					   	 	<button type="submit" id="pwdSubmit">확인</button>
					    	<button id="modalCloseButton">닫기</button>
					    </div>
				  	</form>	
				    </div>
				  </div>
		</div>
	
<script src="../../../resources/js/qna/listQnaModal.js"></script>
</body>
</html>