<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>プロ詳細</title>
    <link rel="stylesheet" href="/resources/css/findpro/findProDetail.css">
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBI9oa4kZP2eh0RnVd3cylq3sUvY3Bipcc&callback=initMap">
    </script>
</head>
<body>

<div id="proD" data-pro-category="${proDetail.pro_category}"></div>

<div class="findpro-wrapper">
    <!-- ✅ 왼쪽: 프로필 정보 -->
    <div class="findpro-left">
        <div class="findpro-item">
            <h1>プロフィール</h1>
            <div class="findpro-item-info">
                <div class="findpro-image">
                    <img src="/file/${proDetail.pro_profile_img}" alt="프로필 이미지">
                </div>
                <div class="findpro-info">
                    <p>${proDetail.pro_category}</p>
                    <p>${proDetail.pro_name}</p>
                    <p style="cursor: pointer;" onclick="location.href='/review/pro/${proDetail.pro_pk}'">📝 ${proDetail.pro_review}</p>
                </div>
                <div class="favorite-div">
                    <div class="findpro-favorite-btn">
                        <c:choose>
                            <c:when test="${favorited}">
                                <img src="/resources/icons/findPro/filled_star.png" alt="찜된 상태" id="favorite-icon">
                            </c:when>
                            <c:otherwise>
                                <img src="/resources/icons/findPro/empty_star.png" alt="찜 안됨" id="favorite-icon">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <span id="favorite-count" style="width: 20px; height: 20px;">${proDetail.pro_favorite}</span>
                </div>
            </div>
        </div>
        <div class="findpro-introduce">
            <div>${proDetail.pro_description}</div>
        </div>
    </div>

    <!-- ✅ 오른쪽: 버튼 + 지도 -->
    <div class="findpro-right">
        <button class="findpro-button" onclick="openModal()">リクエスト要請</button>
        <button class="findpro-button" onclick="alert('준備中です')">共有する</button>

        <p id="proAddress">住所 : ${proDetail.pro_address}</p>
        <div id="findpro-map"></div>
    </div>
</div>

<!-- 숨겨진 데이터 -->
<input type="hidden" id="proDetail-pro-pk" value="${proDetail.pro_pk}">
<input type="hidden" id="current-user-pk" value="${sessionScope.user.user_pk}">

<form action="/my-request" method="post">
    <input name="r_user_id" value="${sessionScope.user.user_pk}" type="hidden">
    <input name="request_type" value="${proDetail.pro_category}" type="hidden">
    <input name="r_pro_pk" value="${proDetail.pro_pk}" type="hidden">

    <c:forEach var="i" begin="1" end="15">
        <input type="hidden" id="request${i}" name="request${i}"/>
    </c:forEach>

    <!-- 모달 -->
    <div id="findModal" class="findModal">
        <div class="findModal-content">
            <!-- ✅ 상단: 프로그래스 바 + 닫기 버튼 -->
            <div class="modal-header">
                <div id="progress-container">
                    <div id="progress-bar"></div>
                </div>
                <span class="close" onclick="closeModal()">&times;</span>
            </div>

            <!-- ✅ 본문 영역 -->
            <div class="modal-body">
                <c:forEach var="i" begin="1" end="15">
                    <div id="content-${i}"></div>
                </c:forEach>
            </div>
        </div>
    </div>
</form>

<script>
    let isLoggedIn = ${isLoggedIn};
</script>
<script src="/resources/js/findpro/findProDetail.js"></script>

</body>
</html>