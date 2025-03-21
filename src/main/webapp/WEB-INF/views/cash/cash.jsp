<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>SkillBank キャッシュチャージ</title>
    <link rel="stylesheet" href="/resources/css/cash/cash.css"/>
</head>
<body>

<div class="cash-wrapper">

    <img class="login-Logo" src="/resources/images/login/loginlogo.png" alt="" style="width: 220px; margin: 30px;">

    <div class="cash-balance">
        残高 : <span style="font-weight: 600">${sessionScope.proSession.pro_cash} コイン</span>
    </div>

    <form class="cash-form" action="/pro/cash" method="post">
        <div class="cash-container">
            <label class="cash-item">
                <input type="radio" name="pro_cash" value="1200" checked>
                <span class="cash-amount">1,200 コイン</span>
                <span class="cash-price">990 円</span>
            </label>

            <label class="cash-item">
                <input type="radio" name="pro_cash" value="3300">
                <span class="cash-amount">3,300 コイン</span>
                <span class="cash-price">2,540 円</span>
            </label>

            <label class="cash-item">
                <input type="radio" name="pro_cash" value="8500">
                <span class="cash-amount">8,500 コイン</span>
                <span class="cash-price">5,000 円</span>
            </label>
        </div>

        <button class="cash-button" type="submit" value="${sessionScope.proSession.pro_pk}">
            チャージ
        </button>
    </form>
</div>

<script src="/resources/js/cash/cash.js"></script>

</body>
</html>