<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SkillBank - Pro登録</title>
    <link rel="stylesheet" href="/resources/css/sign/prosign.css">
</head>
<body>
<div class="prosign-wrapper">

    <img class="prosign-logo" src="/resources/images/login/loginlogo.png" alt="logo">

    <div class="prosign-form-container">
        <form action="/account/pro" method="post" class="prosign-form">
            <div class="prosign-section">
                <label class="prosign-label">専門分野を選択して下さい</label>
                <div class="prosign-radio-group">
                    <label><input type="radio" name="pro_category" value="引っ越し">引っ越し</label>
                    <label><input type="radio" name="pro_category" value="クリーニング">クリーニング</label>
                    <label><input type="radio" name="pro_category" value="粗大ゴミ回収">粗大ゴミ回収</label>
                </div>
            </div>

            <div class="prosign-section">
                <label class="prosign-label">プロのお名前</label>
                <input type="text" name="pro_name" class="prosign-input">
            </div>

            <div class="prosign-section">
                <label class="prosign-label">職場住所</label>
                <input type="text" name="pro_address" class="prosign-input">
            </div>

            <div class="prosign-section">
                <label class="prosign-label">電話番号</label>
                <input type="text" name="pro_phone" class="prosign-input">
            </div>

            <div class="prosign-button-container">
                <button class="prosign-submit-btn" name="pro_pk" value="${sessionScope.user.user_pk}">提出</button>
            </div>
        </form>
    </div>

</div>
</body>
</html>