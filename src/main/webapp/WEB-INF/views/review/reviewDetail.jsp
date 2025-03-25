<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/mypage/reviewDetail.css">
</head>
<body>
<div class="review-detail-container">
    <!-- 리뷰 제목 -->
    <h1 class="review-detail-title">${reviewVO.review_title}</h1>

    <!-- 리뷰 작성자 및 프로 정보 -->
    <div class="review-detail-meta">
        <span class="review-detail-pro">프로님: ${reviewVO.review_pro}</span>
        <span class="review-detail-client">작성자: ${reviewVO.review_client}</span>
        <span class="review-detail-date">작성일:
        <fmt:formatDate value="${reviewVO.review_date}" pattern="yyyy-MM-dd"/>
      </span>
    </div>

    <!-- 카테고리 -->
    <div class="review-detail-category">
        카테고리: ${reviewVO.review_category}
    </div>

    <!-- 별점 표시 -->
    <div class="review-detail-star">
        <span>별점: </span>
        <c:forEach var="i" begin="1" end="5">
            <c:choose>
                <c:when test="${i <= reviewVO.review_star}">
                    <img src="${pageContext.request.contextPath}/resources/icons/findPro/filled_star.png" alt="별점">
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/resources/icons/findPro/empty_star.png" alt="별점">
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>

    <!-- 리뷰 내용 -->
    <div class="review-detail-content">
        ${reviewVO.review_txt}
    </div>

    <!-- 첨부 파일 영역 (파일명이 '!' 구분자로 연결되어 있다고 가정) -->
    <c:if test="${not empty reviewVO.review_file}">
        <div class="review-detail-files">
            <h3>첨부 파일</h3>
            <c:forEach var="fileName" items="${fn:split(reviewVO.review_file, '!')}">
                <c:if test="${not empty fileName}">
                    <div class="review-file-item">
                        <a href="${pageContext.request.contextPath}/file/${fileName}" target="_blank">
                            <img src="${pageContext.request.contextPath}/file/${fileName}" alt="첨부파일" class="review-file-image">
                        </a>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </c:if>
</div>
</body>
</html>