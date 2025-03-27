<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>コミュニティ</title>
    <link rel="stylesheet" href="/resources/css/community/community.css"></link>
    <script src="/resources/js/community/community.js"></script>
</head>
<body>

<h1>コミュニティ</h1>

<div class="community-body-wrapper">
    <div class="community-client-tab">
        <div data-category="main" onclick="location.href='/community/main'">全体</div>
        <div data-category="askpro" onclick="location.href='/community/askpro'">プロに尋ねる</div>
        <div data-category="together" onclick="location.href='/community/together'">一緒に</div>
        <div data-category="review" onclick="location.href='/community/review'">レビュー</div>
        <div data-category="appeal" onclick="location.href='/community/appeal'">プロのアピール</div>
<%--    <div class="community-write-btn">--%>
        <button class="community-client-write" onclick="location.href='/community/write'">書き込み</button>
<%--    </div>--%>
    </div>
    <div class="community-content">
        <jsp:include page="${communityPage}"/>
    </div>
</div>


</body>
</html>