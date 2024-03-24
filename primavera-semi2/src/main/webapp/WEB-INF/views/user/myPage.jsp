<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<link rel="stylesheet" href="/resources/css/reset.css" />
				<link href="../../resources/css/user/myPage.css" rel="stylesheet" type="text/css">
				<link href="../../resources/css/header.css" rel="stylesheet" type="text/css">
				<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
				<title>Insert title here</title>
			</head>


			<header>
			<nav>
				<a href="/">Primavera</a>
			</nav>
			<nav>
				<a href="mainMap">Store</a> <a href="#">Guide</a> <a href="collectPage">PickUp</a> <a
					href="/notice/list">Board</a> <span>
					<a href="/review/list">Review</a> <a href="listQna">Q & A</a> <a href="/notice/list">Notice</a>
				</span> <a href="myPage"><i class="fa-regular fa-user"></i></a>
			</nav>
			</header>

			<body>
				<sec:authentication property="principal" var="user" />
				<c:choose>
					<c:when test="${user == 'anonymousUser'}">
						<main>
							<div class="section">
								<div class="container">
									<div class="row full-height justify-content-center">
										<div class="col-12 text-center align-self-center py-5">
											<div class="section pb-5 pt-5 pt-sm-2 text-center">
												<h6 class="mb-0 pb-3">
													<span>Log In </span>
													<span>Sign Up</span>
												</h6>
												<input class="checkbox" type="checkbox" id="reg-log" name="reg-log" />
												<label for="reg-log"></label>
												<div class="card-3d-wrap mx-auto">
													<div class="card-3d-wrapper">
														<div class="card-front">
															<div class="center-wrap">
																<div class="section text-center">
																	<div id="loginform">
																		<h4 class="mb-4 pb-3">Log In</h4>
																		<div id="form">
																			<form action="/login" method="post">
																				<div class="form-group">
																					<input type="text" name="username"
																						value="${id}" class="form-style"
																						placeholder="ID" id="loginId"
																						autocomplete="off">
																				</div>
																				<div class="form-group mt-2">
																					<input type="password"
																						name="password"
																						class="form-style"
																						placeholder="Password"
																						id="logpass" autocomplete="off">
																				</div>
																				
																				<input type="submit" value="LOG IN"
																					class="btn mt-4" id="submit">
																					
																					<div style="background-color: #f9e000; width: 200px; height: 30px; border-radius: 5px; margin-top: 15px; margin-left: 25px;">
																					<a class="kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=2aa4500445d4b2a832d23e0d819fb737&redirect_uri=http://localhost:8080/kakaologin&response_type=code" style="color: black;">
																						<div class="kakao_i"></div>
																						카카오톡으로 로그인
																					</a>
																				</div>
																			</form>
																			
																			
																		</div>
																	</div>
																</div>
															</div>
														</div>
														
														<div class="card-back">
															<div class="center-wrap">
																<div class="section text-center">
																	<div id="loginform" class="signinmenu">
																		<a href="findId" class="link">아이디 찾기</a>
																		<a href="changePwd" class="link">비밀번호 찾기</a>
																		<a href="register" class="btn mt-4"
																			style="font-family: 'Poppins', sans-serif;">SIGN
																			UP</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</main>
					</c:when>


					<c:otherwise>
						<c:if test="${user.auth == 'ADMIN'}">
							<section id="Adbackground">
								<div id="background-blackbox"></div>
							</section>
							<div id="Login">
								<input type="hidden" id="auth" value="<c:out value=" ${user.auth}" />">
								<div id="logo">
									<div class="logobox">Primavera</div>
								</div>
								<div id="Menu">
									<div id="MenuOne">
										<a href="notice/list">공지 게시판 관리</a> <a href="listStatus">Q&A 게시판 관리</a> <a
											href="allUser">전체 회원 조회</a>
									</div>
									<div id="MenuTwo">
										<a href="showProgress">progress 관리</a>
										<a href="showAllCollect">수거 신청 현황</a>
										<a href="/logout">로그아웃</a>
									</div>
								</div>
							</div>

						</c:if>
						<c:if test="${user.auth == 'MEMBER'}">
							<section id="Userbackground">
								<div id="background-blackbox"></div>
							</section>
							<div id="Login">
								<input type="hidden" id="auth" value="<c:out value=" ${user.auth}" />">
								<div id="logo">
									<div class="logobox">Primavera</div>
								</div>

								<div id="Menu">
									<div id="MenuOne">
										<a href="showReview">내가 적은 후기</a>
										<a href="showQna">내 Q&A</a>
										<a href="showCollect">진행상황</a>
									</div>
									<div id="MenuTwo">
										<c:choose>
											<c:when test="${user.password != null}">
												<a href="userUpdate">회원 정보 수정</a>
											</c:when>
											<c:otherwise>
												<a href="../updatekakaoUser" >초기 회원 정보 수정</a>
											</c:otherwise>
										</c:choose>
										
										<c:choose>
										<c:when test="${user.kakao == 'Y' && user.password == null}">
											<!-- 나중에 kakao 회원 유무와 동시에 &&으로 phone이 null이 아닌 경우를 동시에 걸면
											카카오 로그인은 했는데 회원 정보 수정을 한번도 하지 않은 경우로 판단하여 확인 절차없이 바로 탈퇴하도록
											 -->
											<a href="kakaounlink">카카오 회원 탈퇴</a>
										</c:when>
										<c:otherwise>
											<a href="deleteUser">회원 탈퇴</a>
										</c:otherwise>
										
										</c:choose>
										<a href="/logout">로그아웃</a>
									</div>
								</div>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
			</body>

			</html>