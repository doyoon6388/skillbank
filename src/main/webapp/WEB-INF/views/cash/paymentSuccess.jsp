<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결제 완료</title>
    <link rel="stylesheet" href="/resources/css/cash/cash.css"/>
</head>
<body>
<div class="cash-success-wrapper">
    <!-- ✅ 결제 완료 아이콘 -->
    <img class="login-Logo" src="/resources/images/login/loginlogo.png" alt="" style="width: 220px; margin: 60px 0 40px;">

    <!-- ✅ 보유 금액 -->
    <div class="cash-balance">
        残高 : <span class="highlight">${sessionScope.proSession.pro_cash} コイン</span>
    </div>

    <!-- ✅ 결제 성공 메시지 -->
    <div class="cash-success-message">
        チャージ成功！
    </div>

    <!-- ✅ 홈으로 이동 버튼 -->
    <button class="cash-home-button" onclick="location.href='/main'">홈으로 이동</button>
</div>
</body>
</html>