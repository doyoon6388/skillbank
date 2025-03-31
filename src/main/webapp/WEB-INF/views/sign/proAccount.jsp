<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div>

    <img class="login-Logo" src="/resources/images/login/loginlogo.png" alt="" style="width: 220px; margin: 60px 0 40px;">

    <form action="/account/pro" method="post">
        <div>어떤 일을 전문으로 하시나요 ?_?</div>
        <div><input type="radio" name="pro_category" value="引っ越し">引っ越し</div>
        <div><input type="radio" name="pro_category" value="クリーニング">クリーニング</div>
        <div><input type="radio" name="pro_category" value="粗大ゴミ回収">粗大ゴミ回収</div>

        <div>작업장 이름</div>
        <div><input type="text" name="pro_name"></div>

        <div>작업장 주소</div>
        <div><input type="text" name="pro_address"></div>

        <div>회사 전화번호</div>
        <input type="text" name="pro_phone">

        <button name="pro_pk" value="${sessionScope.user.user_pk}">제출</button>
    </form>
</div>
</body>
</html>