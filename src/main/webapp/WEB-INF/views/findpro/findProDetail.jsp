<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="findpro-item">
    <div class="findpro-image">
        <img src="/file/${proDetail.pro_profile_img}" alt="" />
    </div>
    <div class="findpro-info">
        <p>${proDetail.pro_name}</p>
        <p>${proDetail.pro_category}</p>
        <p>찜 수: ${proDetail.pro_favorite}</p>
        <p>리뷰 수: ${proDetail.pro_review}</p>
    </div>
</div>
</body>
</html>