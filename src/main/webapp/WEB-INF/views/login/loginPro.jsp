<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/profile.css"/>
    <script src="/resources/js/profile/profile.js"></script>
</head>
<body>
<div class="profile-container">
    <div class="profile-wrap">
        <div class="profile&toggle">
            <div class="toggle-container">
                <label class="toggle-switch">
                    <input type="checkbox" ${checked} id="toggle-btn" onclick="toggleMode()"/>
                    <span class="slider"></span>
                </label>
            </div>
            <div hidden="hidden" id="user-text">
                ${sessionScope.proSession.pro_name} 프로님
            </div>
        </div>
        <img id="profileImage1" src="/file/${sessionScope.proSession.pro_profile_img}" alt="プロフィール画像"
             onclick="location.href='/mypage'"/>
    </div>
    <img class="chat-btn" src="/resources/icons/profile/chatPro.png" alt="채팅"
         onclick="location.href='/test/chat/list'"/>
</div>
<script>
    const username = "${sessionScope.user.user_name}";
</script>
</body>
</html>