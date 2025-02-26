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
<div style="display: flex;">
<div><button onclick="changeToUser()">고객전환버튼</button></div>
<div>${user.username}프로님 반갑습니다.</div>
    <div onclick="location.href='/logout'">로그아웃</div>
</div>
</body>
</html>