<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<form action="updateReview" method="post">

    작성자 : <input type="text" name="review_client" value="${reviewVO.review_client}" readonly> ${reviewVO.review_client}
    프로님 :<input type="text" name="review_pro" value="${reviewVO.review_pro}" readonly> ${reviewVO.review_pro}
    <input type="radio" checked> 카테고리 : 이사
    <input type="radio"> 카테고리 : 청소
    <input type="radio"> 카테고리 : 폐기물

    <input type="text" > 리뷰 pk (임시) : ${reviewVO.review_pk}

    <input type="text">제목 :
    내용:
    <textarea name="" id="" cols="30" rows="10"></textarea>

    <input type="number" name="review_star"> 별점
    <button name="review_complete" value="1">등록</button>
</form>
</body>
</html>