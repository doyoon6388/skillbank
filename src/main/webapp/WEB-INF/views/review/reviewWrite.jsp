<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<form action="/mypage/updateReview" method="post">
    프로님 :<input type="text" name="review_pro" value="${reviewVO.review_pro}" hidden> ${reviewVO.review_pro}
    <br>
    작성자 : <input type="text" name="review_client" value="${reviewVO.review_client}" hidden> ${reviewVO.review_client}
    <br>
    <h1>카테고리</h1>
    <input name="pro_category" type="radio" value="원룸/소형 이사" checked> 이사
    <input name="pro_category" type="radio" value="청소"> 청소
    <input name="pro_category" type="radio" value="폐기물"> 폐기물
    <br>
        리뷰 pk (임시) : ${reviewVO.review_pk}
    <br>
    제목 : <input type="text" name="review_title" value="제목을 입력하세요" placeholder="제목을 입력하세요"> <br>
    내용:
    <textarea name="review_txt" cols="30" rows="10">내용을 입력하세요</textarea> <br>
    <input type="number" name="review_star"> 별점 <br>
    <button name="review_complete" value="1">등록</button>
</form>
</body>
</html>