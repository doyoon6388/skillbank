<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>マイページ</title>
    <link rel="stylesheet" href="resources/css/mypage/mypage.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
</head>
<body>
<div class="user-mypage-wrapper">
    <div class="mypage-wrapper">
        <div><h1>マイページ</h1></div>
        <div class="mypage-profile-wrapper">
            <div class="mypage-profile-img" id="mypage-profile-img-change-btn">
                <img id="profileImage" src="/file/${sessionScope.user.user_profile_img}" alt="プロフィール画像">
            </div>
            <div class="mypage-profile-name">
                <div class="mypage-user-nickname">${sessionScope.user.user_nickname} さん</div>
                <div class="mypage-user-email">${sessionScope.user.user_email}</div>
            </div>
        </div>

        <div class="mypage-info-wrapper">
            <div class="mypage-info-item editable" data-field="user_name">
                <span class="mypage-info-tag">名前</span>
                <span class="mypage-info-value">${sessionScope.user.user_name}</span>
                <span class="mypage-info-arrow">></span>
            </div>
            <div class="mypage-info-item editable" data-field="user_phone">
                <span class="mypage-info-tag">電話番号</span>
                <span class="mypage-info-value">${sessionScope.user.user_phone}</span>
                <span class="mypage-info-arrow">></span>
            </div>
            <div class="mypage-info-item editable" data-field="user_birth">
                <span class="mypage-info-tag">生年月日</span>
                <span class="mypage-info-value">${formattedBirth}</span>
                <span class="mypage-info-arrow">></span>
            </div>
            <div class="mypage-info-item editable" data-field="user_gender">
                <span class="mypage-info-tag">性別</span>
                <span class="mypage-info-value">${sessionScope.user.user_gender}</span>
                <span class="mypage-info-arrow">></span>
            </div>
            <div class="mypage-info-item editable" data-field="user_address">
                <span class="mypage-info-tag">住所</span>
                <span class="mypage-info-value">${sessionScope.user.user_address}</span>
                <span class="mypage-info-arrow">></span>
            </div>
        </div>
    </div>

    <div class="mypage-profile-side-wrapper">
        <div onclick="location.href='my-request?id=${sessionScope.user.user_pk}'">받은 요청</div>
        <div onclick="location.href='/mypage/fav'">찜한 고수</div>
        <div>작성한 리뷰</div>
        <div>작성한 글</div>
        <button class="logout-btn" onclick="logout()">ログアウト</button>
    </div>

    <!-- ✅ 모달 배경 (회색 빛 배경) 추가 -->
    <div class="mypage-modal-overlay"></div>

    <!-- 회원 정보 수정 모달 -->
    <div class="mypage-info-modal">
        <div class="mypage-modal-content">
            <span class="mypage-info-modal-close">&times;</span>
            <h2 id="modalTitle">情報の編集</h2>
            <div id="modalInput"></div>
            <button id="saveInfoButton">確認</button>
        </div>
    </div>

    <div class="mypage-profile-change-modal">
        <div class="mypage-modal-content">
            <span class="mypage-profile-change-modal-close">&times;</span>
            <h2>プロフィール</h2>
            <form action="/mypage" method="post" enctype="multipart/form-data">
                <div class="profile-image-container">
                    <img id="profilePreview" src="/file/${sessionScope.user.user_profile_img}"
                         alt="プロフィール画像プレビュー">
                    <input type="file" id="fileInput" name="user_profile_img" style="display:none;"
                           onchange="previewImage(event)">
                    <br>
                    <button type="button" id="changeButton">変更</button>
                    <button type="submit" id="submitButton" name="user_pk" style="display:none;"
                            value="${sessionScope.user.user_pk}">保存
                    </button>
                </div>
            </form>
        </div>
    </div>

    <div class="mypage-gender-modal">
        <div class="mypage-modal-content">
            <span class="mypage-gender-modal-close">&times;</span>
            <h2>性別</h2>
            <div style="display: flex; gap: 10px;">
                <button class="gender-option" data-value="男性">男性</button>
                <button class="gender-option" data-value="女性">女性</button>
            </div>
            <button id="saveGenderButton">確認</button>
        </div>
    </div>
</div>

<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_API_KEY&libraries=places"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="resources/js/mypage/mypage.js"></script>
</body>
</html>