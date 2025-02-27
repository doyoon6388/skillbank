<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/profile.css">
    <script src="/resources/js/profile/profile.js"></script>
</head>
<body>
<div class="profile-container">
    <div class="toggle-container">
        <label class="toggle-switch">
            <input type="checkbox" id="toggle-btn" onclick="toggleMode()"/>
            <span class="slider"></span>
        </label>
    </div>
    <div class="profile-wrap">
        <div id="user-text">${sessionScope.user.username} 프로님 반갑습니다.</div>
        <div onclick="location.href='/mypage'">마이페이지</div>
        <div onclick="location.href='/logout'">로그아웃</div>
    </div>
    <img class="chat-btn" src="/resources/icons/profile/chat.png" alt="채팅" onclick="location.href='/chat'">
</div>
<script>
    const username = "${sessionScope.user.username}";
</script>
</body>
</html>