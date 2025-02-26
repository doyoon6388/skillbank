<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/loginOK.css">
    <script src="/resources/js/mypage/mypage.js"></script>
</head>
<body>
<div class="toggle-container">
    <label class="toggle-switch">
        <input type="checkbox" id="toggle-btn" onclick="toggleMode()">
        <span class="slider"></span>
    </label>
    <div id="user-text">${sessionScope.user.username}님 반갑습니다</div>
    <div onclick="location.href='/chat'">채팅</div>
    <div onclick="location.href='/mypage'">마이페이지</div>
    <div onclick="location.href='/logout'">로그아웃</div>
</div>
</body>
</html>