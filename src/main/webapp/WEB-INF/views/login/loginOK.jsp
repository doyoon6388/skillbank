<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div>
    <div>${sessionScope.user.username}</div>
    <div>마이페이지</div>
    <div onclick="location.href='/logout'">로그아웃</div>
</div>
</body>
</html>