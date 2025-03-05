<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>会員登録</title>
    <link rel="stylesheet" href="/resources/css/sign/sign.css">
    <script>
        window.onload = function() {
            var errorMessage = "<%= request.getAttribute("error") %>";
            if (errorMessage !== "null" && errorMessage !== "") {
                alert(errorMessage);
            }
        };
    </script>
</head>
<body>
<div id="sign-container">
    <h2>会員登録</h2>
    <form action="/register" method="post">
        <label for="user_email">メールアドレス:</label>
        <input type="email" id="user_email" name="user_email" required>

        <label for="user_pw">パスワード:</label>
        <input type="password" id="user_pw" name="user_pw" required>

        <label for="user_name">名前:</label>
        <input type="text" id="user_name" name="user_name" required>

        <label for="user_gender">性別:</label>
        <select id="user_gender" name="user_gender">
            <option value="男性">男性</option>
            <option value="女性">女性</option>
            <option value="その他">その他</option>
        </select>

        <label for="user_address">住所:</label>
        <input type="text" id="user_address" name="user_address" required>

        <label for="user_phone">電話番号:</label>
        <input type="text" id="user_phone" name="user_phone" required>

        <button type="submit">登録</button>
    </form>
</div>
</body>
</html>