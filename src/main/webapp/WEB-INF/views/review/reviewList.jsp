<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="review-wrapper">
    <h1>작성 중인 리뷰</h1>
    <hr>
    <c:if test="${empty incompleteReview}">
        <div>작성 중인 리뷰가 없습니다</div>
    </c:if>
    <c:forEach items="${incompleteReview}" var="i">
<div class="incomplete-review" style="cursor: pointer" onclick="location.href='/mypage/reviewUpdate/${i.review_pk}'">
${i.review_pro}님을 위한 리뷰
</div>
    </c:forEach>
    <h1>작성 완료된 리뷰</h1>
    <hr>
    <c:if test="${empty completeReview}">
        <div>작성 된 리뷰가 없습니다</div>
    </c:if>
    <c:forEach items="${completeReview}" var="i">
        <div class="complete-review" style="cursor: pointer" onclick="location.href='/review/${i.review_pk}'">
                ${i.review_pro}님을 위한 리뷰
        </div>
    </c:forEach>
</div>
</body>
</html>