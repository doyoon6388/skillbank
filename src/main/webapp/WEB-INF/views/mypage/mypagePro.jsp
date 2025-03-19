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
<div class="user-mypage-wrapper">
    <div class="mypage-wrapper">
        <div><h1>マイページ</h1></div>
        <div class="mypage-profile-wrapper">
            <div class="mypage-profile-img" id="mypage-profile-img-change-btn">
                <img id="profileImage"
                     src="/file/${sessionScope.proSession.pro_profile_img}"
                     alt="프로필 이미지">
            </div>
            <div class="mypage-profile-name">
                <div class="mypage-user-nickname">${sessionScope.proSession.pro_name} プロ</div>
                <div class="mypage-user-email">${sessionScope.user.user_email}</div>
            </div>
        </div>

        <div class="mypage-item-wrapper">
            <div class="mypage-item">
                <div class="mypage-item-tag">SkillBank Cash</div>
                <div class="mypage-item-list">残高 : ${sessionScope.proSession.pro_cash} C
                    <button onclick="location.href='/pro/cash'">チャージ</button>
                </div>
            </div>
        </div>

        <!-- 프로 계정 전용 정보 -->
        <div class="mypage-info-wrapper">
            <div class="mypage-info-item">
                <span class="mypage-info-tag">カテゴリ</span>
                <span class="mypage-info-value">${sessionScope.proSession.pro_category}</span>
            </div>
            <div class="mypage-info-item">
                <span class="mypage-info-tag">電話番号</span>
                <span class="mypage-info-value">${sessionScope.proSession.pro_phone}</span>
            </div>
            <div class="mypage-info-item">
                <span class="mypage-info-tag">住所</span>
                <span class="mypage-info-value">${sessionScope.proSession.pro_address}</span>
            </div>
            <div class="mypage-info-item">
                <span class="mypage-info-tag">自己紹介</span>
                <span class="mypage-info-value">${sessionScope.proSession.pro_description}</span>
            </div>
            <div class="mypage-info-item">
                <span class="mypage-info-tag">レビュー数</span>
                <span class="mypage-info-value">${sessionScope.proSession.pro_review}件</span>
            </div>
            <div class="mypage-info-item">
                <span class="mypage-info-tag">お気に入り</span>
                <span class="mypage-info-value">${sessionScope.proSession.pro_favorite}人</span>
            </div>
        </div>

        <div>
            <button class="logout-btn" onclick="logout()">ログアウト</button>
        </div>

    </div>

    <div class="mypage-profile-side-wrapper">
        <div onclick="location.href='/mypage/fav'">찜한 고수</div>
        <div>작성한 리뷰</div>
        <div>작성한 글</div>
    </div>

    <!-- 모달 구조 -->
    <div class="mypage-profile-change-modal">
        <div class="mypage-modal-content">
            <!-- 모달 닫기 버튼 -->
            <span class="mypage-profile-change-modal-close">&times;</span>
            <!-- 프로필 사진 변경 폼 -->
            <form action="/mypage/pro" method="post" enctype="multipart/form-data">
                <div class="profile-image-container">
                    <!-- 기존 프로필 이미지 미리보기 -->
                    <img id="profilePreview" src="/file/${sessionScope.proSession.pro_profile_img}"
                         alt="프로필 이미지 미리보기" style="width:100px; height:100px;">
                    <!-- 파일 선택 input (숨김 처리) -->
                    <input type="file" id="fileInput" name="pro_profile_img" style="display:none;"
                           onchange="previewImage(event)">
                    <br>
                    <!-- 변경하기 버튼: 파일 선택 창 호출 -->
                    <button type="button" id="changeButton">변경하기</button>
                    <!-- 제출하기 버튼: 파일 선택 후 나타남 -->
                    <button type="submit" id="submitButton" name="pro_pk" style="display:none;"
                            value="${sessionScope.proSession.pro_pk}">제출하기
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<%-- 모달 끝 --%>
<script src="/resources/js/mypage/mypage.js"></script>
</body>
</html>