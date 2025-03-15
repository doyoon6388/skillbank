<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/findpro/findProDetail.css">
</head>
<body>
<div class="findpro-item">
    <div class="findpro-image">
        <img src="/file/${proDetail.pro_profile_img}" alt="" />
    </div>
    <div class="findpro-info">
        <p>${proDetail.pro_name}</p>
        <p>${proDetail.pro_category}</p>
        <p>${proDetail.pro_description}</p>
        <p>${proDetail.pro_address}</p>
        <p>찜 수: <span id="favorite-count">${proDetail.pro_favorite}</span></p>
        <p>리뷰 수: ${proDetail.pro_review}</p>
    </div>
    <!-- 찜하기 버튼: 클릭 시 toggleFavorite() 함수 실행 -->
    <button class="findpro-favorite-btn" onclick="toggleFavorite()">
        <c:choose>
            <c:when test="${favorited}">
                <img src="/resources/icons/findPro/filled_star.png" alt="찜됨" id="favorite-icon" />
            </c:when>
            <c:otherwise>
                <img src="/resources/icons/findPro/empty_star.png" alt="찜하기" id="favorite-icon" />
            </c:otherwise>
        </c:choose>
    </button>
</div>
<!-- 프로 상세 PK와 현재 유저 PK를 보관하는 숨겨진 필드 (예시) -->
<input type="hidden" id="proDetail-pro-pk" value="${proDetail.pro_pk}">
<input type="hidden" id="current-user-pk" value="${sessionScope.user.user_pk}">

<script src="/resources/js/findpro/findProDetail.js"></script>
</body>
</html>