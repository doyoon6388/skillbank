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
    <h2>ログイン</h2>
    <form action="/login" method="post">
        <label for="user_email">メールアドレス:</label>
        <input type="text" id="user_email" name="user_email" required/>

        <label for="user_pw">パスワード:</label>
        <input type="password" id="user_pw" name="user_pw" required/>
        <input type="hidden" name="prevPage" value="${param.prevPage}">

        <!-- 로그인 실패 시 에러 메시지 -->
        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <input type="submit" value="ログイン"/>
    </form>

    <!-- 회원가입 페이지로 이동 버튼 -->
    <button id="register-btn" onclick="location.href='/signin'">会員登録</button>
</div>
<script>
    // 로그인 페이지 로딩 시, prevPage URL 파라미터 값 넣기
    const urlParams = new URLSearchParams(window.location.search);
    document.querySelector('form').innerHTML +=
        `<input type='hidden' name='prevPage' value='${urlParams.get("prevPage") || ""}' />`;
</script>
</body>
</html>