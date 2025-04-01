<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>찜한 고수</title>
    <link rel="stylesheet" href="/resources/css/mypage/favPro.css">
</head>
<body>

<div class="favPro-wrapper">
    <h1>お気に入り　一覧</h1>

    <c:choose>
        <c:when test="${empty favPros}">
            <p>気にいったプロがいません。</p>
        </c:when>
        <c:otherwise>
            <div class="favPro-list">
                <c:forEach var="pro" items="${favPros}">
                    <div class="favPro-item">
                        <img src="/file/${pro.pro_profile_img}" alt="고수 프로필 이미지">
                        <div class="favPro-info">
                            <h2>${pro.pro_name} プロ</h2>
                            <p>カテゴリ　: ${pro.pro_category}</p>
                            <button onclick="location.href='/findpro/detail/${pro.pro_pk}'">詳細情報を見る</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>