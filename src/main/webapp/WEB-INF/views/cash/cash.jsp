<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/cash/cash.css"/>
</head>
<body>
<div class="cash-balance">
    현재 보유 금액 : ${sessionScope.proSession.pro_cash}
</div>
<form class="cash-form" action="/pro/cash" method="post">
    <div class="cash-container">
        <div class="cash-item">
            <input type="radio" name="pro_cash" value="1200" checked> 1,200 C : 990 円
        </div>
        <div class="cash-item">
            <input type="radio" name="pro_cash" value="3300"> 3,300 C : 2,540 円
        </div>
        <div class="cash-item">
            <input type="radio" name="pro_cash" value="8500"> 8,500 C : 5,000 円
        </div>
        <button class="cash-button" value="${sessionScope.proSession.pro_pk}">결제</button>
    </div>
</form>
</body>
</html>