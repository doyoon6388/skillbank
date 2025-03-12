<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link rel="stylesheet" href="resources/css/mypage/mypage.css">
    <!-- Flatpickr CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
</head>
<body>
<div><h1>마이페이지</h1></div>

<div class="mypage-wrapper">
    <!-- 프로필 영역 -->
    <div class="mypage-profile-wrapper">
        <div class="mypage-profile-img" id="mypage-profile-img-change-btn">
            <img id="profileImage"
                 src="/file/${sessionScope.user.user_profile_img}"
                 alt="프로필 이미지">
        </div>
        <div class="mypage-profile-name">
            <div class="mypage-user-nickname">${sessionScope.user.user_nickname}님</div>
            <div class="mypage-user-email">${sessionScope.user.user_email}</div>
        </div>
    </div>

    <!-- 회원 정보 수정 가능 영역 -->
    <div class="mypage-info-wrapper">
        <div class="mypage-info-item editable" data-field="user_name">
            <span class="mypage-info-tag">이름</span>
            <span class="mypage-info-value">${sessionScope.user.user_name}</span>
            <span class="mypage-info-arrow">></span>
        </div>

        <div class="mypage-info-item editable" data-field="user_phone">
            <span class="mypage-info-tag">전화번호</span>
            <span class="mypage-info-value">${sessionScope.user.user_phone}</span>
            <span class="mypage-info-arrow">></span>
        </div>

        <div class="mypage-info-item editable" data-field="user_birth">
            <span class="mypage-info-tag">생년월일</span>
            <span class="mypage-info-value">${sessionScope.user.user_birth}</span>
            <span class="mypage-info-arrow">></span>
        </div>

        <div class="mypage-info-item editable" data-field="user_gender">
            <span class="mypage-info-tag">성별</span>
            <span class="mypage-info-value">${sessionScope.user.user_gender}</span>
            <span class="mypage-info-arrow">></span>
        </div>

        <div class="mypage-info-item editable" data-field="user_address">
            <span class="mypage-info-tag">주소</span>
            <span class="mypage-info-value">${sessionScope.user.user_address}</span>
            <span class="mypage-info-arrow">></span>
        </div>
    </div>

    <!-- 고수 찾기 -->
    <div class="mypage-item-wrapper">
        <div class="mypage-item">
            <div class="mypage-item-tag">고수 찾기</div>
            <div class="mypage-item-list">찜한 고수</div>
        </div>
    </div>
</div>

<!-- 프로필 변경 모달 -->
<div class="mypage-profile-change-modal">
    <div class="mypage-modal-content">
        <span class="mypage-profile-change-modal-close">&times;</span>
        <form action="/mypage" method="post" enctype="multipart/form-data">
            <div class="profile-image-container">
                <img id="profilePreview" src="/file/${sessionScope.user.user_profile_img}"
                     alt="프로필 이미지 미리보기">
                <input type="file" id="fileInput" name="user_profile_img" style="display:none;"
                       onchange="previewImage(event)">
                <br>
                <button type="button" id="changeButton">변경하기</button>
                <button type="submit" id="submitButton" name="user_pk" style="display:none;"
                        value="${sessionScope.user.user_pk}">제출하기
                </button>
            </div>
        </form>
    </div>
</div>

<!-- 회원 정보 수정 모달 -->
<div class="mypage-info-modal">
    <div class="mypage-modal-content">
        <span class="mypage-info-modal-close">&times;</span>
        <h2 id="modalTitle">정보 수정</h2>
        <div id="modalInput"></div>
        <button id="saveInfoButton">저장</button>
    </div>
</div>

<!-- Google Maps API 추가 (API_KEY는 발급받은 키로 변경) -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_API_KEY&libraries=places"></script>
<!-- Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="/resources/js/mypage/mypage.js"></script>
</body>
</html>