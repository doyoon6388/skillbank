<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>コミュニティ</title>
    <link rel="stylesheet" href="/resources/css/community/community.css"></link>
    <script src="resources/js/community/community.js"></script>
</head>
<body>

<div class="community-header-wrapper">
    <div class="community-logo"><span class="community-logo-span">コミュニティ</span></div>
    <div class="community-button-container">
            <div class="selectable-client" onclick="location.href='/community/main'">スバ民の部屋▶</div>
            <div class="selectable-pro" onclick="location.href='/community/pro/main'">プロの部屋▶</div>
        <div>
            <button class="community-client-write" onclick="location.href='/community/write'">書き込み</button>
        </div>
    </div>
</div>
<div class="community-body-wrapper">
    <div class="community-tab">
        <div onclick="location.href='/community/main'">全体</div>
        <div onclick="location.href='/community/askpro'">プロに聞く</div>
        <div onclick="location.href='/community/together'">一緒に</div>
        <div>レビュー</div>
        <div>プロのアピール</div>
    </div>
    <div class="community-content">
        <jsp:include page="${communityPage}"></jsp:include>
    </div>
</div>
</body>
</html>