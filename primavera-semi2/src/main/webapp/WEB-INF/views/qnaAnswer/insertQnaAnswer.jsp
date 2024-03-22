<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="../../../resources/css/reset.css" />
    <link rel="stylesheet" href="../../../resources/css/header.css" />
    <link
      rel="stylesheet"
      href="../../../resources/css/qnaAnswer/insertQnaAnswer.css"
    />
    <script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
  </head>
  <body>
    <sec:authentication property="principal" var="user" />
    <div class="header-blackbox"></div>
		<header>
			<nav>
				<a href="/">Primavera</a>
			</nav>
			<nav>
				<a href="/map/mainMap">Store</a> <a href="#">Guide</a> <a href="collectPage">PickUp</a> <a
					href="/notice/list">Board</a> <span>
					<a href="/review/list">Review</a> <a href="listQna">Q & A</a> <a href="/notice/list">Notice</a>
				</span> <a href="myPage"><i class="fa-regular fa-user" id="mypage"></i></a>
			</nav>
		</header>
<!-- -----------------------------------main----------------------------- -->

    <div id="main">
      <div id="allContent">
        <div class="qnaAll">
          <div class="back_black"></div>
          <div id="qna_content">
            <h1>Q&A 질문</h1>
            <session id="contents">
              <div name="qnaId" id="qnaId">
                <label>회원 아이디</label>
                <input value="${qnaView.id}" readonly />
              </div>
              <div name="qnaNum" id="qnaNum">
                <label>질문 번호</label>
                <input value="${qnaView.qnaNum}" readonly />
              </div>
              <div name="qnaTitle" id="qnaTitle">
                <label>제목</label><br>
                <textarea readonly>${qnaView.title}</textarea>
              </div>
              <div id="qnaContent" name="qnaContent">
                <label>내용</label><br>
                <textarea readonly>${qnaView.content}</textarea>
              </div>
              <c:choose>
                <c:when test="${qnaView.url != null}">
                  <div id="qnaUrl" name="qnaUrl">
                    <img src="/upload/qna/${qnaView.url}" />
                  </div>
                </c:when>
              </c:choose>
            </session>
          </div>
        </div>
<!-- -----------------qnaAnswer파트----------------------------- -->
        <div class="qnaAnswer">
          <h1>Q&A 답변</h1>
          <form
            action="insertAnswer"
            method="post"
            enctype="multipart/form-data"
            id="insertAnswer"
            name="insertAnswer"
            onsubmit="return validate()"
          >
            <div id="id_orderNum">
              <div class="insertAnswer">
                <label>*관리자 아이디</label>
                <input
                  class="id"
                  name="id"
                  id="id"
                  value="${user.id}"
                  readonly
                />
              </div>

              <div class="insertAnswer">
                <label>*질문번호</label>
                <input
                  class="qnaNum"
                  name="qnaNum"
                  id="qnaNum"
                  value="${qna}"
                  readonly
                />
              </div>
            </div>
            <div class="insertAnswer">
              <label>*내용</label>
              <br>
              <textarea
                class="content"
                row="10"
                name="content"
                id="content"
              ></textarea>
            </div>

            <div class="insertAnswer" id="img">
              <div id="img_input">
                <label for="file" id="photo">photo</label>
                <input
                  class="insertAnswer"
                  type="file"
                  id="file"
                  name="file"
                  accept="image/*"
                  onchange="imgShow(event);"
                  onclick="labelText();"
                  hidden
                />
                <div id="image_container"></div>
              </div>
            </div>
            <div id="answerButton">
            <button type="submit" class="btn_final" id="btn_insert">
              등 록
            </button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <script src="../../../resources/js/qnaAnswer/insertQnaAnswer.js"></script>
  </body>
</html>
