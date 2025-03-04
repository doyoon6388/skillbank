<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>コミュニティ</title>
    <link rel="stylesheet" href="resources/css/community/community.css"></link>
</head>
<body>

<div class="community-header-wrapper">
<div class="community-logo">コミュニティ</div>
    <div class="community-button-container">
    <div>スバ民の部屋　ー＞</div>
    <div>専門家の部屋　ー＞</div>
    <div><button>書き込み</button></div>
    </div>
</div>
<div class="community-body-wrapper">
<div class="community-tab">
    <div>全体</div>
    <div>専門家に聞く</div>
    <div>共同</div>
    <div>アピール</div>
</div>
<div class="community-content"><jsp:include page="${communityPage}"></jsp:include></div>
</div>
</body>
</html>