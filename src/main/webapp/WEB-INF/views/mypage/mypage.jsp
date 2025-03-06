<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/mypage/mypage.css">
    </style>
</head>
<body>
<div><h1>마이페이지</h1></div>
<div class="mypage-wrapper">
    <div class="mypage-profile-wrapper">
        <div class="mypage-profile-img"><img src="resources/icons/profile/${sessionScope.user.user_profile_img}" alt="">
        </div>
        <div class="mypage-profile-name">
            <div>${sessionScope.user.user_name}님</div>
            <div>${sessionScope.user.user_email}</div>
        </div>
        <div class="mypage-profile-img-change-btn">
            <button>프로필 변경</button>
        </div>
    </div>
    <div class="mypage-item-wrapper">
        <div class="mypage-item">
            <div class="mypage-item-tag">고수 찾기</div>
            <div class="mypage-item-list">찜한 고수</div>
        </div>
    </div>
</body>
</html>