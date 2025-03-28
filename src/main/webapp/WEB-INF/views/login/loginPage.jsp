<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="/resources/css/login/loginPage.css">
</head>
<body>
<div id="login-container">

    <img class="login-Logo" src="/resources/images/login/loginlogo.png" alt="" style="width: 220px; margin: 60px 0 40px;">

    <form action="/login" method="post">
        <label for="user_email">E-mail :</label>
        <input type="text" id="user_email" name="user_email" required/>

        <label for="user_pw">Password :</label>
        <input type="password" id="user_pw" name="user_pw" required/>
        <input type="hidden" name="prevPage" value="${param.prevPage}">

        <!-- 로그인 실패 시 에러 메시지 -->
        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <input type="submit" value="ログイン"/>
    </form>

    <!-- 회원가입 페이지로 이동 버튼 -->
    <button id="register-btn" onclick="location.href='/signin'">
        <div>会員登録</div>
    </button>

    <div class="other-login">
        <img onclick="location.href='/login/line'" src="/resources/images/login/line_login.png" alt="LINEでログイン">
        <img onclick="location.href='https://login.yahoo.co.jp/config/login?.cpt=AkDS22cADjlkCrVyA0GGmn9pdWhhtQxmq2TRHTHITd9yNs5pQIOSVy9xHlm1lcyWkSlvQDCMFD2USDAEBcKiTXpb1M2qfeMeuc320Nkao0jjvVP625VjnFaQSNGlyS_gEG4nnKcO&.src=www&.done=https%3A%2F%2Fwww.yahoo.co.jp%2F'"
             src="/resources/images/login/yahoo_login.jpg" alt="LINEでログイン">
        <img onclick="location.href='https://account.apple.com/sign-in'" src="/resources/images/login/apple_login.png"
             alt="LINEでログイン">
    </div>

</div>

<script>
    // 로그인 페이지 로딩 시, prevPage URL 파라미터 값 넣기
    const urlParams = new URLSearchParams(window.location.search);
    document.querySelector('form').innerHTML +=
        `<input type='hidden' name='prevPage' value='${urlParams.get("prevPage") || ""}' />`;
</script>
</body>
</html>