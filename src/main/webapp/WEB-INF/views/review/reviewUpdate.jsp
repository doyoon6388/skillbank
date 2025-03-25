<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/mypage/review.css">
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
    제목 : <input type="text" value="${reviewVO.review_title}" placeholder="${reviewVO.review_title}"> <br>
    내용:
    <textarea name="review_txt" cols="30" rows="10"></textarea> <br>

    <div id="starRating">
  <span class="star" data-index="0">
    <span class="star-fill"></span>
  </span>
        <span class="star" data-index="1">
    <span class="star-fill"></span>
  </span>
        <span class="star" data-index="2">
    <span class="star-fill"></span>
  </span>
        <span class="star" data-index="3">
    <span class="star-fill"></span>
  </span>
        <span class="star" data-index="4">
    <span class="star-fill"></span>
  </span>
    </div>
    <input type="hidden" name="review_star" id="ratingValue" value="0">



    <button name="review_complete" value="1">등록</button>
</form>

<script src="/resources/js/review/review.js"></script>
</body>
</html>