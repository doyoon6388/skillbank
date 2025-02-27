<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/mypage/mypage.css"></style>
</head>
<body>
<div><h1>마이페이지</h1></div>
<div class="mypage-wrapper">
<div class="mypage-profile-wrapper">
    <div class="mypage-profile-img"><img src="" alt=""></div>
    <div class="mypage-profile-name">
    <div>${sessionScope.user.username}님</div>
    <div>${sessionScope.user.email}</div>
    </div>
</div>
<div class="mypage-item-wrapper">
    <div class="mypage-item">
        <div class="mypage-item-tag">고수 찾기</div>
        <div class="mypage-item-list">찜한 고수</div>
    </div>
    <div class="mypage-item">
        <div class="mypage-item-tag">커뮤니티</div>
        <div class="mypage-item-list">커뮤니티 작성글 / 댓글</div>
    </div>
    <div class="mypage-item">
        <div class="mypage-item-tag">설정</div>
        <div class="mypage-item-list">계정 설정</div>
    </div>
</div>
</div>
</body>
</html>