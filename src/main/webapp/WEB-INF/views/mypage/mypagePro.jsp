<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/mypage/mypage.css">
</head>
<body>
<div><h1>마이페이지</h1></div>
<div class="mypage-wrapper">
    <div class="mypage-profile-wrapper">
        <div class="mypage-profile-img" id="mypage-profile-img-change-btn">
            <img id="profileImage"
                 src=""
                 alt="프로필 이미지">
        </div>
        <div class="mypage-profile-name">
            <div>${sessionScope.user.user_name}님</div>
            <div>${sessionScope.user.user_email}</div>
        </div>
    </div>
    <div class="mypage-item-wrapper">
        <div class="mypage-item">
            <div class="mypage-item-tag">SkillBank Cash</div>
            <div class="mypage-item-list">보유 금액 : session <button>충전하기</button></div>
        </div>
    </div>

    <!-- 모달 구조 -->
    <div class="mypage-profile-change-modal">
        <div class="mypage-modal-content">
            <!-- 모달 닫기 버튼 -->
            <span class="mypage-profile-change-modal-close">&times;</span>
            <!-- 프로필 사진 변경 폼 -->
            <form action="/mypage" method="post" enctype="multipart/form-data">
                <div class="profile-image-container">
                    <!-- 기존 프로필 이미지 미리보기 -->
                    <img id="profilePreview" src="/file/${sessionScope.user.user_profile_img}"
                         alt="프로필 이미지 미리보기" style="width:100px; height:100px;">
                    <!-- 파일 선택 input (숨김 처리) -->
                    <input type="file" id="fileInput" name="user_profile_img" style="display:none;"
                           onchange="previewImage(event)">
                    <br>
                    <!-- 변경하기 버튼: 파일 선택 창 호출 -->
                    <button type="button" id="changeButton">변경하기</button>
                    <!-- 제출하기 버튼: 파일 선택 후 나타남 -->
                    <button type="submit" id="submitButton" name="user_pk" style="display:none;"
                            value="${sessionScope.user.user_pk}">제출하기
                    </button>
                </div>
            </form>
        </div>
    </div>
    <%-- 모달 끝 --%>
    <script src="/resources/js/mypage/mypage.js"></script>
</body>
</html>