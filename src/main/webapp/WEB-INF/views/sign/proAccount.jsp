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
        <div>어떤 일을 전문으로 하시나요 ?_?</div>
        <div><input type="radio" name="pro_category" value="원룸/소형 이사">이사</div>
        <div><input type="radio" name="pro_category" value="청소">청소</div>
        <div><input type="radio" name="pro_category" value="폐기물">폐기물</div>

        <div>작업장 이름</div>
        <div><input type="text" name="pro_name"></div>

        <div>작업장 주소</div>
        <div><input type="text" name="pro_address"></div>

        <div>회사 전화번호</div>
        <input type="text" name="pro_phone">

        <button name="pro_pk" value="${sessionScope.user.user_pk}">제출</button>
    </form>
</div>
</body>
</html>