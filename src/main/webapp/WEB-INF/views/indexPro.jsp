<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=BIZ+UDGothic&family=Kaisei+Tokumin&family=Kosugi+Maru&display=swap"
      rel="stylesheet">
<link rel="stylesheet" href="/resources/css/indexPro.css">
<script src="/resources/js/main/index.js"></script>

<body>
<<<<<<< HEAD
<div style="display: flex; justify-content: space-between">
<div style="display: flex; width: 500px; justify-content: space-evenly">
    <div>로고자리</div>
    <div>견적요청</div>
    <div onclick="location.href='/findpro'">고수찾기</div>
    <div onclick="location.href='/community'">커뮤니티</div>
    <div>여기는 셀러 인덱스입니다</div>
=======
<div class="header">
    <div class="header-items">
        <div onclick="location.href='/main'">🏠 logo</div>
        <div onclick="location.href='/request'">📋 見積もり依頼</div>
        <div onclick="location.href='/find-expert'">🔍 プロを探す</div>
        <div onclick="location.href='/community'">💬 コミュニティ</div>
    </div>
    <div>
        <jsp:include page="${loginCheck}"></jsp:include>
    </div>
>>>>>>> e1fd087a488ef6bf60a27349af80fe2557f8b7d8
</div>
<div class="container">
    <jsp:include page="${page}"></jsp:include>
</div>
</body>
</html>