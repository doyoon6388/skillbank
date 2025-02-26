<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>

<link rel="stylesheet" href="/resources/css/index.css">
<script src="/resources/js/main/index.js"></script>

<body>
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
</div>
<div class="container">
    <jsp:include page="${page}"></jsp:include>
</div>
</body>
</html>