<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>견적 요청</title>
    <script src="/resources/js/request/myRequest.js"></script>
    <link rel="stylesheet" href="resources/css/request/myRequest.css" />
  </head>
  <body>
    <%--
    <input
      name="r_user_id"
      value="${sessionScope.user.user_pk}"
      hidden="hidden"
    />
    --%>

    <div id="for-div">
      <c:forEach items="${request}" var="r">
        <div class="container1">
          <span>${r.request10}</span>
          <h1>${r.request_type}</h1>
          <div class="btn1">
            <span class="requestDelete" data-request-no="${r.request_no}"
              >견적 그만 받기</span
            >
            <a href="#">요청사항 추가</a>
          </div>
          <div class="btn2">
            <button class="myRequestOpenModalBtn" value="${r.request_no}">
              내 요청 보기
            </button>
          </div>
        </div>
      </c:forEach>
    </div>

    <div id="for-div2" style="display: none">
      <div class="receiveRequestWrapper">
        <c:forEach items="${request}" var="r">
          <div class="receiveRequestContainer">
            <div class="receiveHeader">
              <h1 class="receiveTitle">${r.request_type}</h1>
              <span class="receiveDate">
                <fmt:formatDate value="${r.r_date}" pattern="yy.MM.dd" />
              </span>
            </div>
            <div class="progress-bar">
              <div class="progress" style="width: 30%"></div>
            </div>
            <div class="status">
              <span class="step">견적요청</span>
              <span class="step">상담진행</span>
            </div>

            <div class="receiveBtn">
              <button onclick="location.href='my-request2?no=${r.request_no}'">
                자세히 보기
              </button>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
    <div id="modal-overlay" onclick="closeModal()"></div>
    <div id="modal">
      <div class="modalContainer"></div>
    </div>
  </body>
</html>
