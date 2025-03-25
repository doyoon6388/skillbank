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
<div class="review-form-container">
    <form action="/mypage/updateReview" method="post" enctype="multipart/form-data">
        <div class="review-info">
            프로님 : <input type="text" name="review_pro" class="review-hidden-input" value="${reviewVO.review_pro}"
                         hidden> ${reviewVO.review_pro}<br>
            작성자 : <input type="text" name="review_client" class="review-hidden-input" value="${reviewVO.review_client}"
                         hidden> ${reviewVO.review_client}<br>
            <h1 class="review-title">카테고리</h1>
            <label class="review-radio">
                <input name="review_category" type="radio" value="원룸/소형 이사" checked> 이사
            </label>
            <label class="review-radio">
                <input name="review_category" type="radio" value="청소"> 청소
            </label>
            <label class="review-radio">
                <input name="review_category" type="radio" value="폐기물"> 폐기물
            </label>
            <input name="review_pk" value="${reviewVO.review_pk}" hidden>
            <br>
            제목 : <input type="text" name="review_title" class="review-input" value="${reviewVO.review_title}"
                        placeholder="${reviewVO.review_title}"> <br>
            내용:<textarea name="review_txt" class="review-textarea" cols="30" rows="10">${reviewVO.review_txt}</textarea>
            <br>

            <!-- 파일 업로드 영역 -->
            <div class="review-file-upload">
                <label for="review_file">파일 업로드 (최대 5장까지):</label>
                <input type="file" id="review_file" name="files" accept="image/*" multiple>
                <p class="upload-note">최대 5장까지 업로드 가능합니다.</p>
            </div>

            <!-- rating -->
            <div class="review-star-rating" id="starRating">
      <span class="review-star" data-value="1">
        <img src="/resources/icons/findPro/empty_star.png" alt="별점">
      </span>
                <span class="review-star" data-value="2">
        <img src="/resources/icons/findPro/empty_star.png" alt="별점">
      </span>
                <span class="review-star" data-value="3">
        <img src="/resources/icons/findPro/empty_star.png" alt="별점">
      </span>
                <span class="review-star" data-value="4">
        <img src="/resources/icons/findPro/empty_star.png" alt="별점">
      </span>
                <span class="review-star" data-value="5">
        <img src="/resources/icons/findPro/empty_star.png" alt="별점">
      </span>
            </div>
            <input type="hidden" name="review_star" id="ratingValue" value="0">

            <button type="submit" name="review_complete" value="1" class="review-submit-button">등록</button>
    </form>
</div>
<script src="/resources/js/review/review.js"></script>
</body>
</html>