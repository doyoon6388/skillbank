<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>견적 요청</title>
    <script src="/resources/js/request/myRequest.js"></script>
    <link rel="stylesheet" href="/resources/css/request/myRequest.css"/>
    <style>
        .container1 {
            position: relative;
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
        }
    </style>
</head>
<body>
<div class="request-container">
    <div class="btn-container">
        <button id="for-btn">ミツモリ待ち</button>
        <button id="for-btn2">提案中ミツモリ</button>
    </div>
    <div id="for-div">
        <c:forEach items="${request}" var="r">
            <div class="container1" style="display:
            <c:choose>
            <c:when test="${r.r_request_no != 0}">
                    none
            </c:when>
            <c:otherwise>
                    block
            </c:otherwise>
            </c:choose>;">
                <span>${r.request10}</span>
                <h1>${r.request_type}</h1>
                <div class="btn1">
                    <span class="requestDelete" data-request-no="${r.request_no}">依頼のキャンセル</span>

                </div>
                <div class="btn2">
                    <button class="myRequestOpenModalBtn" value="${r.request_no}">
                        自分の依頼を見る
                    </button>

                </div>
                <c:if test="${r.r_pro_pk != 0}">
                    <span class="badge">指定依頼</span>
                </c:if>

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
                <fmt:formatDate value="${r.r_date}" pattern="yy.MM.dd"/>
              </span>

                    </div>
                    <div class="progress-bar">
                        <div class="progress"
                             style="width: ${r.r_request_no >= 1 ? (r.r_complete == 1 ? '100%' : '50%') : '20%'}"></div>
                        <c:if test="${r.r_pro_pk != 0}">
                            <span class="badge2">指定依頼</span>
                        </c:if>
                    </div>
                    <div class="status">
                        <span class="step">依頼中</span>
                        <span class="step">相談中</span>
                        <span class="step">取引完了</span>
                    </div>

                    <div class="receiveBtn">
                        <button onclick="location.href='/my-request2?no=${r.request_no}'">
                            もっと見る
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
</div>
</body>
</html>
