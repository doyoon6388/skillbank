<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>会員登録</title>
    <link rel="stylesheet" href="/resources/css/sign/sign.css">
    <script src="/resources/js/sign/sign.js"></script>

    <% session.removeAttribute("message"); %>
    <% session.removeAttribute("error"); %>
</head>
<body>
<div id="sign-container">

    <img class="login-Logo" src="/resources/images/login/loginlogo.png" alt="" style="width: 220px; margin: 30px;">

    <input type="hidden" id="message-data" value="<%= request.getAttribute("message") %>">
    <input type="hidden" id="error-data" value="<%= request.getAttribute("error") %>">

    <form id="sign-form" action="/register" method="post" onsubmit="return validateForm();">

        <label for="user_email">e-mail :</label>
        <div class="input-wrapper">
            <input type="email" id="user_email" name="user_email" required>
            <span class="tooltip-icon" data-tooltip="有効なメールアドレスを入力してください。">?</span>
        </div>

        <label for="user_pw">password :</label>
        <div class="input-wrapper">
            <input type="password" id="user_pw" name="user_pw" required>
            <span class="tooltip-icon" data-tooltip="英字と数字を含む5文字以上のパスワードを入力してください。">?</span>
        </div>

        <label for="user_pw_confirm">Confirm Password :</label>
        <div class="input-wrapper">
            <input type="password" id="user_pw_confirm" name="user_pw_confirm" required>
            <span class="tooltip-icon" data-tooltip="パスワードが一致しているか確認してください。">?</span>
        </div>

        <label for="user_name">name :</label>
        <div class="input-wrapper">
            <input type="text" id="user_name" name="user_name" required>
            <span class="tooltip-icon" data-tooltip="名前には数字や記号を含めないでください。">?</span>
        </div>

        <label for="user_nickname">nickname :</label>
        <div class="input-wrapper">
            <input type="text" id="user_nickname" name="user_nickname" required>
            <span class="tooltip-icon" data-tooltip="ニックネームには特殊文字を含めないでください。">?</span>
        </div>

        <button type="submit">登録</button>
    </form>

</div>
</body>
</html>