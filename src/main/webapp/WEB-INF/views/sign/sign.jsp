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

    <h2>会員登録</h2>

    <input type="hidden" id="message-data" value="<%= request.getAttribute("message") %>">
    <input type="hidden" id="error-data" value="<%= request.getAttribute("error") %>">

    <form id="sign-form" action="/register" method="post" onsubmit="return validateForm();">

        <label for="user_email">メールアドレス:</label>
        <div class="input-wrapper">
            <input type="email" id="user_email" name="user_email" required>
            <span class="tooltip-icon" data-tooltip="有効なメールアドレスを入力してください。">❓</span>
        </div>

        <label for="user_pw">パスワード:</label>
        <div class="input-wrapper">
            <input type="password" id="user_pw" name="user_pw" required>
            <span class="tooltip-icon" data-tooltip="英字と数字を含む5文字以上のパスワードを入力してください。">❓</span>
        </div>

        <label for="user_pw_confirm">パスワード再確認:</label>
        <div class="input-wrapper">
            <input type="password" id="user_pw_confirm" name="user_pw_confirm" required>
            <span class="tooltip-icon" data-tooltip="パスワードが一致しているか確認してください。">❓</span>
        </div>

        <label for="user_name">名前:</label>
        <div class="input-wrapper">
            <input type="text" id="user_name" name="user_name" required>
            <span class="tooltip-icon" data-tooltip="名前には数字や記号を含めないでください。">❓</span>
        </div>

        <label for="user_nickname">ニックネーム:</label>
        <div class="input-wrapper">
            <input type="text" id="user_nickname" name="user_nickname" required>
            <span class="tooltip-icon" data-tooltip="ニックネームには特殊文字を含めないでください。">❓</span>
        </div>

        <button type="submit">登録</button>
    </form>

    <a href="/login/line">
        <img src="/resources/images/line_login.png" alt="LINEでログイン">
    </a>
</div>
</body>
</html>