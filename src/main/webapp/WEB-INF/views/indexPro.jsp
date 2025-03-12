<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SkillBank</title>
</head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=BIZ+UDGothic&family=Kaisei+Tokumin&family=Kosugi+Maru&display=swap"
      rel="stylesheet"/>
<link rel="stylesheet" href="/resources/css/indexPro.css">
<script src="/resources/js/main/index.js"></script>

<body>
<div class="header-wrapper">
    <div class="header">
        <div class="header-items">
            <div onclick="location.href='/main'"><img src="/resources/icons/index/sbLogo.png" class="logo"></div>
            <div onclick="location.href='/request'">📋 見積もり依頼</div>
            <div onclick="location.href='/findpro'">🔍 プロを探す</div>
            <div onclick="location.href='/community/pro/main'">💬 コミュニティ</div>
        </div>
        <div>
            <jsp:include page="${loginCheck}"></jsp:include>
        </div>
    </div>
</div>
<div id="indexPro-container">
    <c:if test="${not empty page}">
        <jsp:include page="${page}"></jsp:include>
    </c:if>
</div>
</body>
</html>