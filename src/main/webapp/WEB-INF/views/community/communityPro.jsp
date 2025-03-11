<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>コミュニティ</title>
    <link rel="stylesheet" href="/resources/css/community/community.css"></link>
</head>
<body>

<div class="community-header-wrapper">
    <div class="community-logo"><span class="community-logo-span">コミュニティ - pro</span></div>
    <div class="community-button-container">
        <div class="selectable-client" onclick="location.href='/community/main'">スバ民の部屋▶</div>
        <div class="selectable-pro" onclick="location.href='/community/pro/main'">プロの部屋▶</div>
        <div>
            <button class="community-pro-write" onclick="location.href='community/pro/write'">書き込み</button>
        </div>
    </div>
</div>
<div class="community-body-wrapper">
    <div class="community-tab">
        <div>全体</div>
        <div onclick="location.href='/community/pro/wisdom'">プロの知恵</div>
        <div onclick="location.href='/community/pro/event'">イベント/告知</div>
        <div>プロのためのガイド</div>
    </div>
    <div class="community-content">
        <jsp:include page="${communityPage}"></jsp:include>
    </div>
</div>
</body>
</html>