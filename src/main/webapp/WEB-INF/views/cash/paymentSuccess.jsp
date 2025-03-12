<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 성공</title>
    <link rel="stylesheet" href="/resources/css/cash/cash.css"/>
</head>
<body>
<div class="cash-balance">
    현재 보유 금액: ${sessionScope.proSession.pro_cash}
</div>
<div class="payment-message">
    가상 결제가 성공적으로 완료되었습니다.
</div>
<button onclick="location.href='/main'">홈으로 이동</button>
</body>
</html>
