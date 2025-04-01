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
                <label class="prosign-label">어떤 일을 전문으로 하시나요 ?_?</label>
                <div class="prosign-radio-group">
                    <label><input type="radio" name="pro_category" value="引っ越し">引っ越し</label>
                    <label><input type="radio" name="pro_category" value="クリーニング">クリーニング</label>
                    <label><input type="radio" name="pro_category" value="粗大ゴミ回収">粗大ゴミ回収</label>
                </div>
            </div>

            <div class="prosign-section">
                <label class="prosign-label">작업장 이름</label>
                <input type="text" name="pro_name" class="prosign-input">
            </div>

            <div class="prosign-section">
                <label class="prosign-label">작업장 주소</label>
                <input type="text" name="pro_address" class="prosign-input">
            </div>

            <div class="prosign-section">
                <label class="prosign-label">회사 전화번호</label>
                <input type="text" name="pro_phone" class="prosign-input">
            </div>

            <div class="prosign-button-container">
                <button class="prosign-submit-btn" name="pro_pk" value="${sessionScope.user.user_pk}">제출</button>
            </div>
        </form>
    </div>

</div>
</body>
</html>