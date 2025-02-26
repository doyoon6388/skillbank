<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
<script src="/resources/js/mypage/mypage.js"></script>
</head>
<body>
<div style="display: flex; width: 800px; justify-content: space-evenly" >
    <div><button onclick="changeToPro()">고수전환버튼</button></div>
    <div>${sessionScope.user.username}님 반갑습니다</div>
    <div onclick="location.href='/mypage'">마이페이지</div>
    <div onclick="location.href='/logout'">로그아웃</div>
</div>
</body>
</html>