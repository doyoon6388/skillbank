<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div>
    <form action="/account/pro" method="post">
    <div>카테고리 : </div>
    <div><input type="radio" name="pro_category" value="원룸/소형 이사">이사</div>
    <div><input type="radio" name="pro_category" value="청소">청소</div>
    <div><input type="radio" name="pro_category" value="폐기물">폐기물</div>
        <button name="pro_pk" value="${sessionScope.user.user_pk}">제출</button>
    </form>
</div>
</body>
</html>